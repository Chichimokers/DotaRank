import { NgModule, Component } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { HomeScreenComponent } from './home-screen/home-screen.component';
import { PLayersComponent } from './home-screen/players/players.component';

const routes: Routes = [
  { path: '', redirectTo: 'home', pathMatch: 'full' },

  {path:'home',component:HomeScreenComponent ,children:[
      { path: '', redirectTo: 'default', pathMatch: 'full' },
      { path: 'default', component: PLayersComponent },
  ]}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
