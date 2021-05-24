package com.movie.movie.theater.dto;

public class TotalSangygDTO {
	private int totSangyg_id;
	private int totSangyg_seats;
	//constructor
	
	public TotalSangygDTO(int totSangyg_id, int totSangyg_seats) {
		this.totSangyg_id = totSangyg_id;
		this.totSangyg_seats = totSangyg_seats;
	}
	public TotalSangygDTO() {
		
	}
	//get&setter
	public int getTotSangyg_id() {
		return totSangyg_id;
	}

	public void setTotSangyg_id(int totSangyg_id) {
		this.totSangyg_id = totSangyg_id;
	}

	public int getTotSangyg_seats() {
		return totSangyg_seats;
	}

	public void setTotSangyg_seats(int totSangyg_seats) {
		this.totSangyg_seats = totSangyg_seats;
	}

	@Override
	public String toString() {
		return "TotalSangygDTO [totSangyg_id=" + totSangyg_id + ", totSangyg_seats=" + totSangyg_seats + "]";
	}
	
	
	
}
