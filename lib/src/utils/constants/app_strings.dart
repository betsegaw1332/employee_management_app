abstract class AppStrings {
  static const String primaryColor = '#1DA1F2';
  static const String secondaryColor = '#b8b8b8';
  static const String appBackgroundColor = '#f7f8ff';
  static const String appShadowColor = '#F6F7FF';
  static const String greyColor = '#949C9E';
  static const String greyLighterColor = '#E5E5E5';
  static const String primaryColorLighter = "#EDF8FF";
  static const String lightBlackColor = "#323238";

  static const String employeeTableName = 'employees';
  static const String databaseName = 'app_database.db';

  static const String homePageTitle = 'Employee List';
  static const String addEmployeeTitle = 'Add Employee Details';
  static const String editEmployeeTitle='Edit Employee Details';
  static const String employeeNameText = 'Employee name';
  static const String selectRoleText = 'Select role';
  static const String todayText = 'Today';
  static const String noDateText = 'No date';
  static const String nextMondayText = 'Next Monday';
  static const String nextTuesdayText = 'Next Tuesday';
  static const String afterOneWeekText = 'After 1 week';
  static const String cancelText = 'Cancel';
  static const String saveText = 'Save';

  static const String fetchFailureMessage='Failed to fetch employees data from local';
  static const String noRecordFoundText='No employee records found';

   static const String noCurrentEmployeeRecordFoundText='No current employee records found';
  static const String noPreviousEmployeeRecordFoundText='No previous employee records found';

  static const String currentEmployeesText='Current Employees';
  static const String previousEmployeesText='Previous Employees';
  static const String employeAddedMessage='Employee Added Successfully';
  static const String employeeDeletedMessage="Employee deleted";
  static const String swipeLeftText='Swipe left to delete';
  static const String undoText='Undo';
  
  static const List<String> selectRoles = [
    "Product Designer",
    "Flutter developer",
    "QA Tester",
    "Product Owner"
  ];
}
