const cds = require('@sap/cds');
const { UPDATE } = require('@sap/cds/lib/ql/cds-ql');

class MyEmpCapmService extends cds.ApplicationService {
  async init() {
    const { Employees, ProductSet } = this.entities;
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const mobileRegex = /^[0-9]{10}$/;
    const nwsystem = await cds.connect.to("northwind");

    this.on('READ', ProductSet, async (req) => {
      return  nwsystem.run(req.query);
    });

    this.before(['CREATE', 'UPDATE'], Employees, async (req) => {
      // Validate email
      if (!req.data.email || !emailRegex.test(req.data.email)) {
        req.error({
          code: 400,
          target: 'email',
          message: "Email cannot be blank"
        });
        return; // stop further execution
      }

      //handle valid mobile no.
      if (!req.data.mobile || !mobileRegex.test(req.data.mobile)) {
            req.error({
                code: 400,
                target: 'mobile',
                message: "Invalid mobile number"
            });
    return;
  }

      // Handle designation_code → salary mapping
      if (req.data?.designation_code) {
        let code = req.data.designation_code;
        let osalary = 0;

        switch (code) {
          case 'DE01':
            osalary = 12000;
            break;
          case 'DE02':
            osalary = 10000;
            break;
          case 'DE03':
            osalary = 9000;
            break;
          case 'DE04':
            osalary = 8000;
            break;
          default:
            osalary = 0; // fallback if no match
        }

        req.data.salary = osalary;
      }
    });

    this.on('updateEMPStatus', async (req) => {
      if(req.data?.employeeId){
        let updateStatus = await UPDATE(Employees, req.data?.employeeId).with({
          status_code: 'ACT'
        });
          if(updateStatus){
            req.info(200, "Employee Activated");          
          }
          else{
            req.error(400, "Failed to Activate Employee");
          }
      }
    });

    return super.init();
  }
}

module.exports = MyEmpCapmService;
