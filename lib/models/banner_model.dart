class BannerModel {
  // List<dynamic> banner1 = [
  //   "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg",
  //   "https://th.bing.com/th/id/OIG.lVXjWwlHyIo4QdjnC1YE",
  //   "https://media.istockphoto.com/id/1146517111/photo/taj-mahal-mausoleum-in-agra.jpg?s=612x612&w=0&k=20&c=vcIjhwUrNyjoKbGbAQ5sOcEzDUgOfCsm9ySmJ8gNeRk=",
  //   "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
  //   "https://as1.ftcdn.net/v2/jpg/05/64/11/42/1000_F_564114238_mcU43Fplgq3J1wpxYUCvDIew9JxUbJrB.jpg"
  // ];

  String image;
  BannerModel({required this.image});
  Map<String, dynamic> toJson() {
    return {"img": image};
  }
}
