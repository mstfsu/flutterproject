class gereksizbilgiler {
  int ID;
  String dcKategori;
  String dcSoru;
  String dcCevap;

  gereksizbilgiler(this.dcKategori, this.dcCevap, this.dcSoru, this.ID);

  gereksizbilgiler.fromJson(Map<String, dynamic> json)
      : ID = json['ID'],
        dcKategori = json['dc_Kategori'],
        dcSoru = json['dc_Soru'],
        dcCevap = json['dc_Cevap'];

  Map<String, dynamic> toJson() => {
        'ID': ID,
        'dc_Kategori': dcKategori,
        'dc_Soru': dcSoru,
        'dc_Cevap': dcCevap,
      };
}
