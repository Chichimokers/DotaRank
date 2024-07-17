import { HttpService } from '@nestjs/axios';
import { Injectable } from '@nestjs/common';
import * as request from 'supertest';


@Injectable()

export class DotaService {
    constructor(private httpService: HttpService){

    }

   
   async  getRankName(rank: string | number, leaderboard: boolean = false){
    return new Promise((resolve,reject)=>{

 
        if (rank === 'null') {
          console.error("This profile has not yet calibrated!");
          return null;
        }
      
        if (typeof rank === 'number') {
          rank = rank.toString();
        }
      
        if (!(/^\d{2}$/.test(rank) && !leaderboard)) {
          console.error(`Something went wrong!\nRank input: ${rank}`);
          return null;
        }
      
        if (leaderboard) {
          return `Immortal rank ${rank}`;
        }
      
        if (rank[0] === '8') {
          return 'Immortal';
        }
      
        const ranks: { [key: string]: string } = {
          '1': 'Herald',
          '2': 'Guardian',
          '3': 'Crusader',
          '4': 'Archon',
          '5': 'Legend',
          '6': 'Ancient',
          '7': 'Divine'
        };
      
        resolve(`${ranks[rank[0]]} [${rank[1]}]`);
    })
      }
      
    async GetPlayerInfo(id :string){
        return new Promise((resolve,reject)=>{
            const url = `https://api.opendota.com/api/players/${id}`;
            try{
             this.httpService.axiosRef.get(url).then((response)=>{
                if(response){
                  
                console.log("hay respuesta")
                resolve(response.data);
               

                }
                },
                (error)=>{
              console.log(error)
              resolve({
                "profile": {
                "account_id": "PRIVATE",
                "personaname": "PRIVATE",
                "name": null,
                "plus": "PRIVATE",
                "cheese": "PRIVATE",
                "steamid": "PRIVATE",
                "avatar": "PRIVATE",
                "avatarmedium": "PRIVATE",
                "avatarfull": "PRIVATE",
                "profileurl": "PRIVATE",
                "last_login": "PRIVATE",
                "loccountrycode": "PRIVATE",
                "status": "PRIVATE",
                "fh_unavailable": "PRIVATE",
                "is_contributor": "PRIVATE",
                "is_subscriber": "PRIVATE"
                },
                "rank_tier": "PRIVATE",
                "leaderboard_rank": "PRIVATE"
                })
             }


              );
            }catch{
              resolve({
                "profile": {
                "account_id": "PRIVATE",
                "personaname": "PRIVATE",
                "name": null,
                "plus": "PRIVATE",
                "cheese": "PRIVATE",
                "steamid": "PRIVATE",
                "avatar": "PRIVATE",
                "avatarmedium": "PRIVATE",
                "avatarfull": "PRIVATE",
                "profileurl": "PRIVATE",
                "last_login": "PRIVATE",
                "loccountrycode": "PRIVATE",
                "status": "PRIVATE",
                "fh_unavailable": "PRIVATE",
                "is_contributor": "PRIVATE",
                "is_subscriber": "PRIVATE"
                },
                "rank_tier": "PRIVATE",
                "leaderboard_rank": "PRIVATE"
                })

            }
            
         
    
            

        })
      
      }


}

