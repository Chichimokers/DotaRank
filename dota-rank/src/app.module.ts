import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PlayerProfileEntity } from './players/player.entity';
import { HttpModule } from '@nestjs/axios';
import { PlayerService } from './players/player.service';
import { DotaService } from './Dota/dota.service';
import { PlayerController } from './players/player.controller';


@Module({
  imports: [
  

    TypeOrmModule.forFeature([PlayerProfileEntity]),

    TypeOrmModule.forRoot({
      entities: [__dirname + '/**/*.entity{.ts,.js}'],
      synchronize: true,
      type: 'postgres', 
      host: 'localhost', 
      port: 3306,
      username: 'postgres', 
      password: '123',
      database: 'rank',
      logging: true,
      migrationsRun: true,
      migrations: ["dist/migration/**/*.js"]
}),
HttpModule

  ],
  controllers: [AppController,PlayerController],
  providers: [AppService,PlayerService,DotaService],
})
export class AppModule {}
