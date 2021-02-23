class video {
	int ID;
	String dcPlaylistKategori;
	String dcVideoBaslik;
	String dcLink;
	String dcBegeniSayisi;
	String dcBegenilmemeSayisi;
	String dcIzlenmeSayisi;
	String dcYayinlanmaTarihi;

	video.fromJson(Map<String, dynamic> json)
			:	ID = json['ID'],
	dcPlaylistKategori = json['dc_Playlist_Kategori'],
	dcVideoBaslik = json['dc_Video_Baslik'],
	dcLink = json['dc_Link'],
	dcBegeniSayisi = json['dc_Begeni_Sayisi'],
	dcBegenilmemeSayisi = json['dc_Begenilmeme_Sayisi'],
	dcIzlenmeSayisi = json['dc_Izlenme_Sayisi'],
	dcYayinlanmaTarihi = json['dc_Yayinlanma_Tarihi'];

	Map<String, dynamic> toJson() => {
				'ID': this.ID,
				'dc_Playlist_Kategori': this.dcPlaylistKategori,
				'dc_Video_Baslik': this.dcVideoBaslik,
				'dc_Link': this.dcLink,
				'dc_Begeni_Sayisi': this.dcBegeniSayisi,
				'dc_Begenilmeme_Sayisi': this.dcBegenilmemeSayisi,
				'dc_Izlenme_Sayisi': this.dcIzlenmeSayisi,
				'dc_Yayinlanma_Tarihi': this.dcYayinlanmaTarihi,
			};
}
