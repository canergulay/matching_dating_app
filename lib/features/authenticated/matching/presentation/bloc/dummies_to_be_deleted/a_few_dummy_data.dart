import 'package:matchangoo/features/Identification/data/models/interests/interests.dart';
import 'package:matchangoo/features/authenticated/matching/data/models/user.dart';

List<Interests> dummyInterests1 = [
  Interests(
    id: "613a184d46aff332943a7068",
    index: 0,
    names: {"tr_TR": "Kedi", "en_US": "Cat"},
  ),
  Interests(
    id: "613a208d4599d53700f49ea7",
    index: 4,
    names: {"tr_TR": "League of Legends", "en_US": "League of Legends"},
  ),
  Interests(
    id: "613a208d4599d53700f49ea9",
    index: 6,
    names: {"tr_TR": "Grand Theft Auto V", "en_US": "Grand Theft Auto V"},
  ),
  Interests(
    id: "613a208d4599d53700f49eb2",
    index: 15,
    names: {"tr_TR": "Battlefield V", "en_US": "Battlefield V"},
  ),
  Interests(
    id: "613a7121ba40ff35acf9c78d",
    index: 18,
    names: {"tr_TR": "İspanyolca", "en_US": "Spanish"},
  )
];

List<Interests> dummyInterests2 = [
  Interests(
    id: "613a208d4599d53700f49eb2",
    index: 15,
    names: {"tr_TR": "Battlefield V", "en_US": "Battlefield V"},
  ),
  Interests(
    id: "613a7121ba40ff35acf9c791",
    index: 21,
    names: {"tr_TR": "Portekizce", "en_US": "Portuguese"},
  ),
  Interests(
    id: "613a75f6ce92c52a14dc9a7e",
    index: 32,
    names: {"tr_TR": "Fitness", "en_US": "Fitness"},
  ),
];

List<Interests> dummyInterests3 = [
  Interests(
    id: "613a75f6ce92c52a14dc9a81",
    index: 35,
    names: {"tr_TR": "Kamp", "en_US": "Camping"},
  ),
  Interests(
    id: "613a7121ba40ff35acf9c793",
    index: 23,
    names: {"tr_TR": "Çince", "en_US": "Mandarin"},
  ),
  Interests(
    id: "613a75f6ce92c52a14dc9a7f",
    index: 33,
    names: {"tr_TR": "Vücut Geliştirme", "en_US": "Body Building"},
  ),
];

List<User> usersToMatch = [
  User(
      age: 22,
      awayfrom: 1,
      interests: dummyInterests2,
      pictures: [
        "https://images.unsplash.com/photo-1503983469989-e2cbfd3bfeae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
        "https://images.unsplash.com/photo-1481824429379-07aa5e5b0739?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=396&q=80",
        "https://images.unsplash.com/flagged/photo-1564485377544-ce65ce5187df?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
      ],
      profession: 'Student',
      fieldofstudy: 'Economics',
      userName: 'Deneme User1'),
  User(
      age: 21,
      awayfrom: 2.4,
      interests: dummyInterests1,
      pictures: [
        "https://images.unsplash.com/photo-1578616070222-50c4de9d5ade?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=413&q=80",
        "https://images.unsplash.com/photo-1607630451142-f7a0d4595600?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=415&q=80",
        "https://images.unsplash.com/photo-1604072366595-e75dc92d6bdc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80"
      ],
      profession: 'Student',
      fieldofstudy: 'Computer Engineering',
      userName: 'Deneme User2'),
  User(
      age: 23,
      awayfrom: 5,
      interests: dummyInterests3,
      pictures: [
        "https://images.unsplash.com/photo-1441123694162-e54a981ceba5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
        "https://images.unsplash.com/photo-1591473692209-9ea30de4c8ab?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
        "https://images.unsplash.com/photo-1615332327357-ce22631750a6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80"
            "https://images.unsplash.com/photo-1548445474-e4886e0ea461?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80"
      ],
      profession: 'Working',
      fieldofstudy: 'Lawyer',
      userName: 'Deneme User3'),
  User(
      age: 22,
      awayfrom: 1,
      interests: dummyInterests2,
      pictures: [
        "https://images.unsplash.com/photo-1503983469989-e2cbfd3bfeae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
        "https://images.unsplash.com/photo-1481824429379-07aa5e5b0739?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=396&q=80",
        "https://images.unsplash.com/flagged/photo-1564485377544-ce65ce5187df?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
      ],
      profession: 'Student',
      fieldofstudy: 'Economics',
      userName: 'Deneme User1'),
  User(
      age: 21,
      awayfrom: 2.4,
      interests: dummyInterests1,
      pictures: [
        "https://images.unsplash.com/photo-1578616070222-50c4de9d5ade?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=413&q=80",
        "https://images.unsplash.com/photo-1607630451142-f7a0d4595600?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=415&q=80",
        "https://images.unsplash.com/photo-1604072366595-e75dc92d6bdc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80"
      ],
      profession: 'Student',
      fieldofstudy: 'Computer Engineering',
      userName: 'Deneme User2'),
  User(
      age: 23,
      awayfrom: 5,
      interests: dummyInterests3,
      pictures: [
        "https://images.unsplash.com/photo-1441123694162-e54a981ceba5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
        "https://images.unsplash.com/photo-1591473692209-9ea30de4c8ab?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
        "https://images.unsplash.com/photo-1615332327357-ce22631750a6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80"
            "https://images.unsplash.com/photo-1548445474-e4886e0ea461?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80"
      ],
      profession: 'Working',
      fieldofstudy: 'Lawyer',
      userName: 'Deneme User3'),
  User(
      age: 22,
      awayfrom: 1,
      interests: dummyInterests2,
      pictures: [
        "https://images.unsplash.com/photo-1503983469989-e2cbfd3bfeae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
        "https://images.unsplash.com/photo-1481824429379-07aa5e5b0739?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=396&q=80",
        "https://images.unsplash.com/flagged/photo-1564485377544-ce65ce5187df?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
      ],
      profession: 'Student',
      fieldofstudy: 'Economics',
      userName: 'Deneme User1'),
  User(
      age: 21,
      awayfrom: 2.4,
      interests: dummyInterests1,
      pictures: [
        "https://images.unsplash.com/photo-1578616070222-50c4de9d5ade?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=413&q=80",
        "https://images.unsplash.com/photo-1607630451142-f7a0d4595600?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=415&q=80",
        "https://images.unsplash.com/photo-1604072366595-e75dc92d6bdc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80"
      ],
      profession: 'Student',
      fieldofstudy: 'Computer Engineering',
      userName: 'Deneme User2'),
  User(
      age: 23,
      awayfrom: 5,
      interests: dummyInterests3,
      pictures: [
        "https://images.unsplash.com/photo-1441123694162-e54a981ceba5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
        "https://images.unsplash.com/photo-1591473692209-9ea30de4c8ab?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
        "https://images.unsplash.com/photo-1615332327357-ce22631750a6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80"
            "https://images.unsplash.com/photo-1548445474-e4886e0ea461?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80"
      ],
      profession: 'Working',
      fieldofstudy: 'Lawyer',
      userName: 'Deneme User3'),
];
