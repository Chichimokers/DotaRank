  
    import { Injectable } from '@nestjs/common';
    import {InjectRepository } from '@nestjs/typeorm'
    import { FindOperators, FindOptionsUtils, Repository } from 'typeorm';
import { PlayerProfileEntity } from './player.entity';
import { CreatePlayerDto } from '../dto/CreatePLayerdto';
import { ADdPlayerID } from '../dto/AddPLayerID';
import { DotaService } from '../Dota/dota.service';

    
    @Injectable()
    export class PlayerService {
    
      constructor(
        @InjectRepository(PlayerProfileEntity)
        private itemsRepository: Repository<PlayerProfileEntity>,
        private DotaServiceS: DotaService
     ) {}

     async UpdateALL(): Promise<boolean> {
      
      try {
        const players = await this.findAll();
        for (const player of players) {
          const playerInfo :any   = await this.DotaServiceS.GetPlayerInfo(player.profile_account_id);
          if(playerInfo["msg"] !="error"){  // Actualizar los campos del jugador con la información obtenida
            player.solo_competitive_rank = playerInfo.solo_competitive_rank;
            player.competitive_rank = playerInfo.competitive_rank;
            player.rank_tier = playerInfo.rank_tier;
            player.leaderboard_rank = playerInfo.leaderboard_rank;
            player.profile_personaname = playerInfo.profile.personaname;
            player.profile_name = playerInfo.profile.name;
            player.profile_plus = playerInfo.profile.plus;
            player.profile_cheese = playerInfo.profile.cheese;
            player.profile_steamid = playerInfo.profile.steamid;
            player.profile_avatar = playerInfo.profile.avatar;
            player.profile_avatarmedium = playerInfo.profile.avatarmedium;
            player.profile_avatarfull = playerInfo.profile.avatarfull;
            player.profile_profileurl = playerInfo.profile.profileurl;
            player.profile_last_login = playerInfo.profile.last_login;
            player.profile_loccountrycode = playerInfo.profile.loccountrycode;
            player.profile_is_contributor = playerInfo.profile.is_contributor;
            player.profile_is_subscriber = playerInfo.profile.is_subscriber;
            await this.itemsRepository.save(player);}
        
        }
        return true;
      } catch (error) {
        console.error('Error updating players:', error);
        return false;
      }
    }


     async findAll(): Promise<PlayerProfileEntity[]> {
      return await this.itemsRepository.find();
    }
    
    async findOne(id: number): Promise<PlayerProfileEntity> {
      return await this.itemsRepository.findOne({ where :{id} });
    }

    async Addplayerid(addPlayerDto: ADdPlayerID): Promise<PlayerProfileEntity> {
      const player = this.itemsRepository.create();
      player.profile_account_id = addPlayerDto.profile_account_id;
      this.itemsRepository.save(player)
      return player;
    }

    async create(item: CreatePlayerDto): Promise<PlayerProfileEntity> {
      return await this.itemsRepository.save(item);
    }
    
    async update(id: number, item: PlayerProfileEntity): Promise<PlayerProfileEntity> {
      await this.itemsRepository.update(id, item);
      return await this.itemsRepository.findOne({where : {id}});
    }
    
    async delete(id: number): Promise<void> {
      await this.itemsRepository.delete(id);
    }
    
    }
    


