var Profile = require('../Database/profile.js') //Database Profile
const { decrypt } = require('../Database/encryption.js');
var g = require('./global.js'); //Global variables of server

module.exports.Leg = function(c, Read, Accounts)
{
    Accounts.findOne({Name: Read.U.toLowerCase()}, function (err, result) //Find the account sent from client
    {
        if (err){
            console.log(err)
        }

        if (result) {
            let De = decrypt(result.Pass) //Decrypt password

            if (De==(Read.P)) //If password = client password
            {
                c.Name=result.Name //Assign name to player
                c.Room=1

                if (!g.Logged.includes(c.Name)) //If player is not logged in
                {
                    Profile.findById(Read.U.toLowerCase(), function (err, docs)
                    {
                        if (docs)
                        {
                            if (docs.xx!=null)
                            {
                                 //Sync variables from server
                                c.xPos=docs.xx
                                c.yPos=docs.yy
                                c.Health=docs.Health
                            }


                            let Sendie = JSON.stringify({Type:'Login', Name: c.Name, Health: c.Health})
                            c.send(Sendie)   
                        }
                    });

                    g.Logged.push(c.Name) //Add player name to a array

                } else {
                    let Sendie = JSON.stringify({Type:'AlreadyIn'})
                    c.send(Sendie)
                }
                
            } else {
                let Sendie = JSON.stringify({Type:'Wrong'})
                c.send(Sendie)
            }
        } else {
            console.log("No Result")
            let Sendie = JSON.stringify({Type:'NoUser'})
            c.send(Sendie)
        }
    })
}