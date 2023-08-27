// class Applink {
// static const String server = 'http://localhost:8000/api/';
// static const String test = 'http://localhost:8000/api/getallusers';



//   //================================ Images Link ========================= //
//    static const String server_image = "http://192.168.0.107/laravel/E-commerceApp/public";
//   static const String imagePath = "$server_image/attachments";
//   static const String imageCategories = "$imagePath/categories";
//  static const String imageItems = "$imagePath/items";





// // Start Authis
// // static const String signup = 'http://localhost:8000/api/register';
// // static const String verfycodesignup = 'http://localhost:8000/api/loginWithOtp';
// //static const String login = 'http://localhost:8000/api/login'; 


// static const String login = 'http://192.168.0.107/laravel/E-commerceApp/public/api/Admin_login';
// static const String resendVerifyCode = "http://192.168.0.107/laravel/E-commerceApp/public/api/Admin_sendOtp";


// // Forget Password
// static const String checkemail = "http://192.168.0.107/laravel/E-commerceApp/public/api/Admin_sendOtp";
// static const String verifyCodeResetPassword = "http://192.168.0.107/laravel/E-commerceApp/public/api/Admin_loginWithOtp";
// static const String resetPassword = "http://192.168.0.107/laravel/E-commerceApp/public/api/Admin_reset-password";



// // End Auth



//       //==============================  View orders (Archeive / Pending/ Details)  ================================== // 
//       static  String viewpendingOrders = "http://192.168.0.107/laravel/E-commerceApp/public/api/view_Pending_Order_To_DeliveryMan";
//       static  String approveOrder = "http://192.168.0.107/laravel/E-commerceApp/public/api/Delivery_Man_Approved";
//       static  String viewacceptedOrder = "http://192.168.0.107/laravel/E-commerceApp/public/api/view_Accepted_Order_To_DeliveryMan";
//       static  String archiveOrder = "http://192.168.0.107/laravel/E-commerceApp/public/api/archive_Order_To_DeliveryMan";
//       static  String detailsOrder = "http://192.168.0.107/laravel/E-commerceApp/public/api/details_Order";
//       static  String doneOrderDlivery = "http://192.168.0.107/laravel/E-commerceApp/public/api/done";




//  //==============================  Category (add / edit/ view)  ================================== // 
//       static  String viewCategory = "http://192.168.0.107/laravel/E-commerceApp/public/api/getallcategories";
//       static  String addCategory = "http://192.168.0.107/laravel/E-commerceApp/public/api/insertcategory";
//       static  String editCategory = "http://192.168.0.107/laravel/E-commerceApp/public/api/updatecategory";
//       static  String deleteCategory = "http://192.168.0.107/laravel/E-commerceApp/public/api/deletecategory";

      


//  //==============================  Items (add / edit/ view)  ================================== // 
//       static  String viewItem = "http://192.168.0.107/laravel/E-commerceApp/public/api/getallcategories";
//       static  String addItem = "http://192.168.0.107/laravel/E-commerceApp/public/api/insertcategory";
//       static  String editItem = "http://192.168.0.107/laravel/E-commerceApp/public/api/updatecategory";
//       static  String deleteItem = "http://192.168.0.107/laravel/E-commerceApp/public/api/deleteitem";

// }





//**************************************************************************************** */


class Applink {
static const String server = 'http://localhost:8000/api/';
static const String test = 'http://localhost:8000/api/getallusers';



  //================================ Images Link ========================= //
   static const String server_image = "http://comm-app.local";
  static const String imagePath = "$server_image/attachments";
  static const String imageCategories = "$imagePath/categories";
 static const String imageItems = "$imagePath/items";





// Start Authis
// static const String signup = 'http://localhost:8000/api/register';
// static const String verfycodesignup = 'http://localhost:8000/api/loginWithOtp';
//static const String login = 'http://localhost:8000/api/login'; 


static const String login = 'http://comm-app.local/api/Admin_login';
static const String resendVerifyCode = "http://comm-app.local/api/Admin_sendOtp";


// Forget Password
static const String checkemail = "http://comm-app.local/api/Admin_sendOtp";
static const String verifyCodeResetPassword = "http://comm-app.local/api/Admin_loginWithOtp";
static const String resetPassword = "http://comm-app.local/api/Admin_reset-password";



// End Auth



      // //==============================  View orders (Archeive / Pending/ Details)  ================================== // 
      static  String viewpendingOrders = "http://comm-app.local/api/view_Pending_Order_To_Admin";
      static  String viewAcceptedOrders= "http://comm-app.local/api/view_Accepted_Orders_To_Admin";

      
      static  String approveOrder = "http://comm-app.local/api/approved_Order";
      static  String prepareOrder = "http://comm-app.local/api/prepared_Orders_Show"; // orderid / userid && ordertype
      
      static  String archiveOrder = "http://comm-app.local/api/archive_Order_To_Admin";
      
      static  String detailsOrder = "http://comm-app.local/api/details_Order";
      static  String doneOrderDlivery = "http://192.168.0.107/laravel/E-commerceApp/public/api/done";




 //==============================  Category (add / edit/ view)  ================================== // 
      static  String viewCategory = "http://comm-app.local/api/getallcategories";
      static  String addCategory = "http://comm-app.local/api/insertcategory";
      static  String editCategory = "http://comm-app.local/api/updatecategory";
      static  String deleteCategory = "http://comm-app.local/api/deletecategory";

      


 //==============================  Items (add / edit/ view)  ================================== // 
      static  String viewItem = "http://comm-app.local/api/getallitems";
      static  String addItem = "http://comm-app.local/api/insertitem";
      static  String editItem = "http://comm-app.local/api/updateitem";
      static  String deleteItem = "http://comm-app.local/api/deleteitem";

}