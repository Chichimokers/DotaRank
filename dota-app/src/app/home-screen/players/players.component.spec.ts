import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PLayersComponent } from './players.component';

describe('PLayersComponent', () => {
  let component: PLayersComponent;
  let fixture: ComponentFixture<PLayersComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [PLayersComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PLayersComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
