class gereksizbilgiler {
	int ID;
	String dcKategori;
	String dcSoru;
	String dcCevap;

	gereksizbilgiler.fromJson(Map<String, dynamic> json)
			:	ID = json['ID'],
	dcKategori = json['dc_Kategori'],
	dcSoru = json['dc_Soru'],
	dcCevap = json['dc_Cevap'];

	Map<String, dynamic> toJson() => {
				'ID': this.ID,
				'dc_Kategori': this.dcKategori,
				'dc_Soru': this.dcSoru,
				'dc_Cevap': this.dcCevap,
			};
}
