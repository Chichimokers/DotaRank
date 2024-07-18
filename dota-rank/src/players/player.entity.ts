import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('player_profiles')
export class PlayerProfileEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ nullable: true })
  solo_competitive_rank: number;

  @Column({ nullable: true })
  competitive_rank: number;

  @Column({ nullable: true })
  rank_tier: number;

  @Column({ nullable: true })
  leaderboard_rank: number;

  @Column({ nullable: true})
  profile_account_id: string;

  @Column({ nullable: true })
  profile_personaname: string;

  @Column({ nullable: true })
  profile_name: string;

  @Column({ nullable: true })
  profile_plus: boolean;

  @Column({ nullable: true })
  profile_cheese: number;

  @Column({ nullable: true })
  profile_steamid: string;

  @Column({ nullable: true })
  profile_avatar: string;

  @Column({ nullable: true })
  profile_avatarmedium: string;

  @Column({ nullable: true })
  profile_avatarfull: string;

  @Column({ nullable: true })
  profile_profileurl: string;

  @Column({ nullable: true })
  profile_last_login: string;

  @Column({ nullable: true })
  profile_loccountrycode: string;

  @Column({ nullable: true })
  profile_is_contributor: boolean;

  @Column({ nullable: true })
  profile_is_subscriber: boolean;
}
