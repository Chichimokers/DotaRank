
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable ,throwError,catchError} from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class ApiDotaService {
  api : any  = "http://localhost:3000";

  constructor(private http:  HttpClient) { }
   GetPLayers() : Observable<any>{

    return this.http.get(this.api+"/players").pipe(

      catchError((error: HttpErrorResponse) => {

        if (error.status === 400) {
          return throwError(error.error.msg);
        } else {
          return throwError(error.error.msg);
        }
      })
    );;


  }
}

