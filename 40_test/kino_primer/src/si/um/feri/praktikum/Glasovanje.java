package si.um.feri.praktikum;



public class Glasovanje {
	private int IDglasovanje, petek_2, petek_3, petek_9, petek_2_vsota, petek_3_vsota, petek_9_vsota, sob_2, sob_3, sob_9, sob_2_vsota, sob_3_vsota, sob_9_vsota;
	String film;
	
	public Glasovanje() {
	}
	public Glasovanje(int IDglasovanje, String film) {
		this.IDglasovanje=IDglasovanje;
		this.film=film;
	}
	
	public Glasovanje(int IDglasovanje, String film, int petek_2, int petek_3, int petek_9, int petek_2_vsota, int petek_3_vsota, int petek_9_vsota, int sob_2, int sob_3, int sob_9, int sob_2_vsota, int sob_3_vsota, int sob_9_vsota) {
		this.IDglasovanje=IDglasovanje;
		this.film=film;
		this.petek_2  = petek_2;
		this.petek_3  = petek_3;
		this.petek_9  = petek_9;
		this.petek_2_vsota  = petek_2_vsota;
		this.petek_3_vsota  = petek_3_vsota;
		this.petek_9_vsota  = petek_9_vsota;
		this.sob_2  = sob_2;
		this.sob_3  = sob_3;
		this.sob_9  = sob_9;
		this.sob_2_vsota  = sob_2_vsota;
		this.sob_3_vsota  = sob_3_vsota;
		this.sob_9_vsota  = sob_9_vsota;
		
	}
	
	public int getIDglasovanje() {
		return IDglasovanje;
	}

	public void setIDglasovanje(int iDglasovanje) {
		IDglasovanje = iDglasovanje;
	}

	public int getPetek_2() {
		return petek_2;
	}

	public void setPetek_2(int petek_2) {
		this.petek_2 = petek_2;
	}

	public int getPetek_3() {
		return petek_3;
	}

	public void setPetek_3(int petek_3) {
		this.petek_3 = petek_3;
	}

	public int getPetek_9() {
		return petek_9;
	}

	public void setPetek_9(int petek_9) {
		this.petek_9 = petek_9;
	}

	public int getPetek_2_vsota() {
		return petek_2_vsota;
	}

	public void setPetek_2_vsota(int petek_2_vsota) {
		this.petek_2_vsota = petek_2_vsota;
	}

	public int getPetek_3_vsota() {
		return petek_3_vsota;
	}

	public void setPetek_3_vsota(int petek_3_vsota) {
		this.petek_3_vsota = petek_3_vsota;
	}

	public int getPetek_9_vsota() {
		return petek_9_vsota;
	}

	public void setPetek_9_vsota(int petek_9_vsota) {
		this.petek_9_vsota = petek_9_vsota;
	}

	public int getSob_2() {
		return sob_2;
	}

	public void setSob_2(int sob_2) {
		this.sob_2 = sob_2;
	}

	public int getSob_3() {
		return sob_3;
	}

	public void setSob_3(int sob_3) {
		this.sob_3 = sob_3;
	}

	public int getSob_9() {
		return sob_9;
	}

	public void setSob_9(int sob_9) {
		this.sob_9 = sob_9;
	}

	public int getSob_2_vsota() {
		return sob_2_vsota;
	}

	public void setSob_2_vsota(int sob_2_vsota) {
		this.sob_2_vsota = sob_2_vsota;
	}

	public int getSob_3_vsota() {
		return sob_3_vsota;
	}

	public void setSob_3_vsota(int sob_3_vsota) {
		this.sob_3_vsota = sob_3_vsota;
	}

	public int getSob_9_vsota() {
		return sob_9_vsota;
	}

	public void setSob_9_vsota(int sob_9_vsota) {
		this.sob_9_vsota = sob_9_vsota;
	}

	
	
	


	public String getFilm() {
		return film;
	}

	public void setFilm(String film) {
		this.film = film;
	}


	
	@Override
	public String toString() {
		return "Movie [IDbaza=" + IDglasovanje + ", ime=" + film + "]";
	}
	
}
