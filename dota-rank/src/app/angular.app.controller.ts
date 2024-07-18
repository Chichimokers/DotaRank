import { Controller, Get, Res ,Req} from '@nestjs/common';
import { Response } from 'express';
import { join } from 'path';

@Controller()
export class AngularAPpControllers {
  constructor() {}

  

  @Get('*')
   asd(@Res() res: Response) {

  res.redirect("/")
}

  

}
