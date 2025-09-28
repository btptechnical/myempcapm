const cds = require('@sap/cds');

class MyEmpCapmService extends cds.ApplicationService{
    init(){
        const { Employees } = this.entities;
        this.before('UPDATE', Employees.drafts, async (req) => {
            if(!req.data.email){

            // req.error({
            //     code: 400,
            //     target: email,
            //     message: "Email can not be blank"
            // });
                
            }

            if(req.data?.designation_code){
                let code = req.data?.designation_code;
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
                        osalary = 0; // optional: fallback if no match
                }
                req.data.salary = osalary;
            }
        });
        return super.init();
    }
}

module.exports = MyEmpCapmService;