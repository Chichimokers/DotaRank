import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as path from 'path';
import { join } from 'path';
import { NestExpressApplication } from '@nestjs/platform-express';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);
  app.enableCors();
  app.useStaticAssets(join(__dirname, '..', 'angular-app'));
  app.setBaseViewsDir(join(__dirname, '..', 'angular-app'));
  app.setViewEngine("html");

  await app.listen(3000);
}
bootstrap();
