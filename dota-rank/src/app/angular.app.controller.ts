import { Controller, Get, Res } from '@nestjs/common';
import { Response } from 'express';
import { join } from 'path';

@Controller()
export class AngularAPpControllers {
  constructor() {}

  @Get('*')
  serveAngularApp(@Res() res: Response) {
    const indexHtml = join(__dirname,'..', 'angular-app');
    res.sendFile(indexHtml+"/index.html");
  }
  @Get('home/default')
  angularroute(@Res() res: Response) {
    const indexHtml = join(__dirname,'..', 'angular-app');
    res.sendFile(indexHtml+"/index.html");
  }

}
