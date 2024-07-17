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
                  

                resolve(response.data);
               

                }
                },(error)=>{
              resolve({
                "solo_competitive_rank": "PRIVATE",
                "competitive_rank": "PRIVATE",
                "rank_tier": "PRIVATE",
                "leaderboard_rank": "PRIVATE",
                "profile_account_id": "PRIVATE",
                "profile_personaname": "PRIVATE",
                "profile_name": null,
                "profile_plus": "PRIVATE",
                "profile_cheese": "PRIVATE",
                "profile_steamid": "PRIVATE",
                "profile_avatar": "PRIVATE",
                "profile_avatarmedium": "PRIVATE",
                "profile_avatarfull": "PRIVATE",
                "profile_profileurl": "PRIVATE",
                "profile_last_login": "PRIVATE",
                "profile_loccountrycode": "PRIVATE",
                "profile_is_contributor": "PRIVATE",
                "profile_is_subscriber": "PRIVATE",
                "Medal": "PRIVATE"
            })
             }


              );
            }catch{
              resolve({
                "solo_competitive_rank": "PRIVATE",
                "competitive_rank": "PRIVATE",
                "rank_tier": "PRIVATE",
                "leaderboard_rank": "PRIVATE",
                "profile_account_id": "PRIVATE",
                "profile_personaname": "PRIVATE",
                "profile_name": null,
                "profile_plus": "PRIVATE",
                "profile_cheese": "PRIVATE",
                "profile_steamid": "PRIVATE",
                "profile_avatar": "PRIVATE",
                "profile_avatarmedium": "PRIVATE",
                "profile_avatarfull": "PRIVATE",
                "profile_profileurl": "PRIVATE",
                "profile_last_login": "PRIVATE",
                "profile_loccountrycode": "PRIVATE",
                "profile_is_contributor": "PRIVATE",
                "profile_is_subscriber": "PRIVATE",
                "Medal": "PRIVATE"
            })

            }
            
         
    
            

        })
      
      }


}

