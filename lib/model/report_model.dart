class ReportModel {
  String mainComplaint;
  String howLong;
  String progressedOverTime;
  String associatedProblems;
  String durationOfAssociatedProblems;
  String associatedWith;
  String exacerbation;
  String coMorbites;
  String family;
  String doctor;
  String medicine;
  String longTermMedicine;
  String investigations;
  String diagnosedWith;
  String diagnosedInvestigation;
  String reportID;
  String generatedAt;

  ReportModel({
      required this.mainComplaint,
      required this.howLong,
      required this.progressedOverTime,
      required this.associatedProblems,
      required this.durationOfAssociatedProblems,
      required this.associatedWith,
      required this.exacerbation,
      required this.coMorbites,
      required this.family,
      required this.doctor,
      required this.medicine,
      required this.longTermMedicine,
      required this.investigations,
      required this.diagnosedWith,
      required this.diagnosedInvestigation,
      required this.reportID,
      required this.generatedAt
  });

  factory ReportModel.fromMap(Map<String, dynamic> map) {
    return ReportModel(
        mainComplaint: map["mainComplaint"] ?? "",
        howLong: map["howLong"] ?? "",
        progressedOverTime: map["progressedOverTime"] ?? "",
        associatedProblems: map["associatedProblems"] ?? "",
        durationOfAssociatedProblems: map["durationOfAssociatedProblems"] ?? "",
        associatedWith: map["associatedWith"] ?? "",
        exacerbation: map["exacerbation"] ?? "",
        coMorbites: map["coMorbites"] ?? "",
        family: map["family"] ?? "",
        doctor: map["doctor"] ?? "",
        medicine: map["medicine"] ?? "",
        longTermMedicine: map["longTermMedicine"] ?? "",
        investigations: map["investigations"] ?? "",
        diagnosedWith: map["diagnosedWith"] ?? "",
        diagnosedInvestigation: map["diagnosedInvestigation"] ?? "",
        reportID: map["reportID"] ?? "",
        generatedAt: map["generatedAt"] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "mainComplaint": mainComplaint,
      "howLong": howLong,
      "progressedOverTime": progressedOverTime,
      "associatedProblems": associatedProblems,
      "durationOfAssociatedProblems": durationOfAssociatedProblems,
      "associatedWith": associatedWith,
      "exacerbation": exacerbation,
      "coMorbites": coMorbites,
      "family": family,
      "doctor": doctor,
      "medicine": medicine,
      "longTermMedicine": longTermMedicine,
      "investigations": investigations,
      "diagnosedWith": diagnosedWith,
      "diagnosedInvestigation": diagnosedInvestigation,
      "reportID": reportID,
      "generatedAt": generatedAt,
    };
  }
}
