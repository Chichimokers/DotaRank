import { Component ,OnInit} from '@angular/core';
import { ApiDotaService } from '../../services/api-dota.service';
import { Dictionary } from '../../helpers/Dictionary';

@Component({
  selector: 'app-players',
  templateUrl: './players.component.html',
  styleUrl: './players.component.css'
})
export class PLayersComponent implements OnInit {


  players:any = [];
  medas: Dictionary<string>={
    'Herald':"/assets/medal_1.png",
    'Guardian':"/assets/medal_2.png",
    'Cruzader':'/assets/medal_3.png',
    'Archon':'/assets/medal_4.png',
    'Legend':'/assets/medal_5.png',
    'Ancestral':'/assets/medal_6.png',
    'Divine':'/assets/medal_7.png',
  }

  starts: Dictionary<string>={
    1:"/assets/star_1.png",
    2:"/assets/star_2.png",
    3:"/assets/star_3.png",
    4:"/assets/star_4.png",
    5:"/assets/star_5.png",
  }
  constructor(private ServiceApi:ApiDotaService){


  }

  ngOnInit(): void {
  this.ServiceApi.GetPLayers().subscribe(
    (data : any)=>
    {
    this.players= data;
    this.players.sort((a: { rank_tier: any; }, b: { rank_tier: any; }) => b.rank_tier - a.rank_tier);

    this.setmedaimage();
  })

  /*this.players=[
    {
      "id": 4,
      "solo_competitive_rank": null,
      "competitive_rank": null,
      "rank_tier": 21,
      "leaderboard_rank": null,
      "profile_account_id": "1104590909",
      "profile_personaname": "NeoxaFS.Chichimokers Repeat.gg",
      "profile_name": null,
      "profile_plus": false,
      "profile_cheese": 0,
      "profile_steamid": "76561199064856637",
      "profile_avatar": "https://avatars.steamstatic.com/b957f6ebf21ddd31783997bf16ea6aa54bed6b78.jpg",
      "profile_avatarmedium": "https://avatars.steamstatic.com/b957f6ebf21ddd31783997bf16ea6aa54bed6b78_medium.jpg",
      "profile_avatarfull": "https://avatars.steamstatic.com/b957f6ebf21ddd31783997bf16ea6aa54bed6b78_full.jpg",
      "profile_profileurl": "https://steamcommunity.com/profiles/76561199064856637/",
      "profile_last_login": "2024-07-15T19:19:19.548Z",
      "profile_loccountrycode": "US",
      "profile_is_contributor": false,
      "profile_is_subscriber": false,
      "Medal": "Guardian [1]"
    },
    {
      "id": 5,
      "solo_competitive_rank": null,
      "competitive_rank": null,
      "rank_tier": 44,
      "leaderboard_rank": null,
      "profile_account_id": "1187563888",
      "profile_personaname": "Kiri18.PMA.Neoxa",
      "profile_name": null,
      "profile_plus": true,
      "profile_cheese": 0,
      "profile_steamid": "76561199147829616",
      "profile_avatar": "https://avatars.steamstatic.com/131b2c3bb366a4353727d6fd65e8fec78edfb4b7.jpg",
      "profile_avatarmedium": "https://avatars.steamstatic.com/131b2c3bb366a4353727d6fd65e8fec78edfb4b7_medium.jpg",
      "profile_avatarfull": "https://avatars.steamstatic.com/131b2c3bb366a4353727d6fd65e8fec78edfb4b7_full.jpg",
      "profile_profileurl": "https://steamcommunity.com/profiles/76561199147829616/",
      "profile_last_login": null,
      "profile_loccountrycode": "CU",
      "profile_is_contributor": false,
      "profile_is_subscriber": false,
      "Medal": "Archon [4]"
    },
    {
      "id": 6,
      "solo_competitive_rank": null,
      "competitive_rank": null,
      "rank_tier": 53,
      "leaderboard_rank": null,
      "profile_account_id": "324791311",
      "profile_personaname": "KyuVan",
      "profile_name": null,
      "profile_plus": true,
      "profile_cheese": 0,
      "profile_steamid": "76561198285057039",
      "profile_avatar": "https://avatars.steamstatic.com/0c575cafb5f5f51a2e632eeabca458e96e610539.jpg",
      "profile_avatarmedium": "https://avatars.steamstatic.com/0c575cafb5f5f51a2e632eeabca458e96e610539_medium.jpg",
      "profile_avatarfull": "https://avatars.steamstatic.com/0c575cafb5f5f51a2e632eeabca458e96e610539_full.jpg",
      "profile_profileurl": "https://steamcommunity.com/profiles/76561198285057039/",
      "profile_last_login": "2023-10-30T19:10:50.413Z",
      "profile_loccountrycode": "BR",
      "profile_is_contributor": false,
      "profile_is_subscriber": false,
      "Medal": "Legend [3]"
    }
  ]*/


  }
  async setmedaimage(){
return  new Promise((resolve,reject)=>{
  this.players.forEach((player: any) =>
    {

    const medalRegex = /(\w+) \[(\d+)\]/;

    // Ejecutar la búsqueda y obtener los resultados
    const medalMatch = medalRegex.exec(player.Medal);

    // Verificar si se encontró una coincidencia
    if (medalMatch) {
      // Extraer el número y la palabra
      const medalWord = medalMatch[1];
      const medalNumber = parseInt(medalMatch[2]);

      player["medal_image"] = this.medas[medalWord];

      player["star_image"] = this.starts[medalNumber];

  }
 } );
 resolve(true)
})


  }


}


