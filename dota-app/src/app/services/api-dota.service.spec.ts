import { TestBed } from '@angular/core/testing';

import { ApiDotaService } from './api-dota.service';

describe('ApiDotaService', () => {
  let service: ApiDotaService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ApiDotaService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
