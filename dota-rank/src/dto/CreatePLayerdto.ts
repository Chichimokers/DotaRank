import { IsNumber, IsString, IsBoolean } from 'class-validator';

export class CreatePlayerDto {
  @IsNumber()
  solo_competitive_rank: number;

  @IsNumber()
  competitive_rank: number;

  @IsNumber()
  rank_tier: number;

  @IsNumber()
  leaderboard_rank: number;

  @IsString()
  profile_account_id: string;

  @IsString()
  profile_personaname: string;

  @IsString()
  profile_name: string;

  @IsBoolean()
  profile_plus: boolean;

  @IsNumber()
  profile_cheese: number;

  @IsString()
  profile_steamid: string;

  @IsString()
  profile_avatar: string;

  @IsString()
  profile_avatarmedium: string;

  @IsString()
  profile_avatarfull: string;

  @IsString()
  profile_profileurl: string;

  @IsString()
  profile_last_login: string;

  @IsString()
  profile_loccountrycode: string;

  @IsBoolean()
  profile_is_contributor: boolean;

  @IsBoolean()
  profile_is_subscriber: boolean;
}
