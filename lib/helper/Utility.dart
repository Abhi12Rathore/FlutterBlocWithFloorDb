import 'package:pyxl_assignment/model/DaylySpend.dart';
import 'package:pyxl_assignment/model/MonthlySpend.dart';
import 'package:pyxl_assignment/model/UserData.dart';
import 'package:pyxl_assignment/model/WeekelySpend.dart';

import '../model/AccountDetails.dart';
import '../model/Cards.dart';
import '../model/Recipient.dart';
import '../model/Transaction.dart';
import 'package:get_storage/get_storage.dart';


class Utility {
  static final box = GetStorage();

  static UserData prepareUserData() {
    AccountDetails accountDetails = AccountDetails(
        "Ebl titanium account", "2234521", "Arian zesan", 6190.00);

    List<Cards>? cardsList = [];
    // Cards cards=Cards("Physical ebi Card","****2437****2424","12/29",2960.00,WeekelySpend("\$1,450.00","\$890.00","\$564.00","\$2,960.00"),MonthlySpend("\$1,450.00","\$890.00","\$564.00","\$2,960.00"),DailySpend("\$1,450.00","\$890.00","\$564.00","\$2,960.00"));
    // Cards cards1=Cards("Virtual ebi Card","****6543****6489","01/27",1280.00,WeekelySpend("\$1,450.00","\$890.00","\$564.00","\$2,960.00"),MonthlySpend("\$1,450.00","\$890.00","\$564.00","\$2,960.00"),DailySpend("\$1,450.00","\$890.00","\$564.00","\$2,960.00"));

    Cards cards =
        Cards("Physical ebi Card", "****2437****2424", "12/29", 2960.00);
    Cards cards1 =
        Cards("Virtual ebi Card", "****6543****6489", "01/27", 1280.00);

    cardsList.add(cards);
    cardsList.add(cards1);

    List<Recipient>? recipientList = [];
    Recipient recipient = Recipient(
        "Rebeka ratry",
        "https://cdn1.iconfinder.com/data/icons/avatar-97/32/avatar-02-512.png",
        "457544545478787");
    Recipient recipient1 = Recipient(
        "Sazzin molla",
        "https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375__340.png",
        "78789858474787");
    Recipient recipient2 = Recipient(
        "Tonim Khan",
        "https://cdn.icon-icons.com/icons2/2643/PNG/512/male_man_people_person_avatar_white_tone_icon_159363.png",
        "5478598557448");
    Recipient recipient3 = Recipient(
        "Adrito rafsan",
        "https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png",
        "7854748576965");

    recipientList.add(recipient);
    recipientList.add(recipient1);
    recipientList.add(recipient2);
    recipientList.add(recipient3);

    List<Transaction>? transactionList = [];

    Transaction transaction = Transaction(
        "Rebeka ratry",
        "https://cdn1.iconfinder.com/data/icons/avatar-97/32/avatar-02-512.png",
        "22 Jan 2022",
        "03:23AM",
        true,
        "\$1,190.00");
    Transaction transaction1 = Transaction(
        "Sazzin molla",
        "https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375__340.png",
        "21 Jan 2022",
        "03:23AM",
        false,
        "\$75.00");
    Transaction transaction2 = Transaction(
        "Tonim Khan",
        "https://cdn.icon-icons.com/icons2/2643/PNG/512/male_man_people_person_avatar_white_tone_icon_159363.png",
        "20 Jan 2022",
        "03:23AM",
        false,
        "\$220.00");
    Transaction transaction3 = Transaction(
        "Adrito rafsan",
        "https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png",
        "19 Jan 2022",
        "03:23AM",
        true,
        "\$2,000.00");

    transactionList.add(transaction);
    transactionList.add(transaction1);
    transactionList.add(transaction2);
    transactionList.add(transaction3);

    UserData? userData = UserData(
        12,
        "Zesan",
        "zesan@gmail.com",
        accountDetails,
        cardsList,
        recipientList,
        transactionList,
        "https://i2.wp.com/tunisaid.org/wp-content/uploads/2019/03/avataaars-2.png?ssl=1");

    return userData!!;
  }

  static void setDataSaved(bool isSaved) {
    box.write('data_added', isSaved);
  }

  static bool isSaved() {
    return box.read("data_added");
  }


}
