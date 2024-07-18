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
      host: 'baasu.db.elephantsql.com', 
      port: 5432,
      username: 'cwyazfqs', 
      password: 'VRgyZvdJQU9gCUsaX9Y_v8VcoYKBVq0n',
      database: 'cwyazfqs',
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
