import { Controller,Get,Param,Post ,Body} from '@nestjs/common';
import { PlayerService } from './player.service';
import { CreatePlayerDto } from '../dto/CreatePLayerdto';
import { ADdPlayerID } from '../dto/AddPLayerID';
import { DotaService } from '../Dota/dota.service';

@Controller('players')
export class PlayerController {
  constructor(private playerService:PlayerService,private DotaServices:DotaService) {}

  
  @Get()
  async getPlayer() {

    const updating = await this.playerService.UpdateALL();

    const playerInfo = await this.playerService.findAll();

    playerInfo.forEach((item)=>{
      this.DotaServices.getRankName(item.rank_tier).then((medal)=>{
        item["Medal"] = medal.toString();
      })
    })

    return playerInfo;
  }

  @Post()
  async addPlayer(@Body() createPlayerDto: ADdPlayerID) {
    const newPlayer = await this.playerService.Addplayerid(createPlayerDto);
    return newPlayer;
  }

}
