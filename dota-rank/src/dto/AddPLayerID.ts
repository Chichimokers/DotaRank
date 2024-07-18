import { IsNumber } from 'class-validator';

export class ADdPlayerID {
  @IsNumber()
  profile_account_id: string;
}
