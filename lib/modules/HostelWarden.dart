class HostelWarden {
  HostelWarden({
    required this.hostelname,
    required this.fullName,
    required this.address,
    required this.HostelAddress,
    required this.HostelRegistrationNumber,
    required this.HostelRegisterDate,
    required this.phonenumber,
    required this.email,
    required this.HostelType,
  });
  late final String hostelname;
  late final String fullName;
  late final String address;
  late final String HostelAddress;
  late final String HostelRegistrationNumber;
  late final String HostelRegisterDate;
  late final String phonenumber;
  late final String email;
  late final String HostelType;

  HostelWarden.fromJson(Map<String, dynamic> json){
    hostelname = json['hostelname'] ?? '';
    fullName = json['full_name'] ?? '';
    address = json['address'] ?? '';
    HostelAddress = json['Hostel_Address'];
    HostelRegistrationNumber = json['Hostel_registration_Number'] ?? '';
    HostelRegisterDate = json['Hostel_Register_Date'] ?? '';
    phonenumber = json['phone number'] ?? '';
    email = json['email'] ?? '';
    HostelType = json['Hostel_Type'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['hostelname'] = hostelname;
    data['full_name'] = fullName;
    data['address'] = address;
    data['Hostel_Address'] = HostelAddress;
    data['Hostel_registration_Number'] = HostelRegistrationNumber;
    data['Hostel_Register_Date'] = HostelRegisterDate;
    data['phone number'] = phonenumber;
    data['email'] = email;
    data['Hostel_Type'] = HostelType;
    return data;
  }
}