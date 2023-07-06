class Targets {
  double fam_cramp;
  bool fam_bloated;
  double am_eat_cramp;
  double am_ibsd_intensity;
  double am_ibsd_duration;
  double pm_ibsd_intensity;
  double pm_ibsd_duration;
  bool nausea;

  Targets({
    required this.fam_cramp,
    required this.fam_bloated,
    required this.am_eat_cramp,
    required this.am_ibsd_intensity,
    required this.am_ibsd_duration,
    required this.pm_ibsd_intensity,
    required this.pm_ibsd_duration,
    required this.nausea
  });

  Targets.fromJson(Map<String, dynamic> json)
      : fam_cramp = json['fam_cramp'],
        fam_bloated = json['fam_bloated'],
        am_eat_cramp = json['am_eat_cramp'],
        am_ibsd_intensity = json['am_ibsd_intensity'],
        am_ibsd_duration = json['am_ibsd_duration'],
        pm_ibsd_intensity = json['pm_ibsd_intensity'],
        pm_ibsd_duration = json['pm_ibsd_duration'],
        nausea = json['nausea'];

  Map<String, dynamic> toJson() => {
        'fam_cramp': fam_cramp,
        'fam_bloated':fam_bloated,
        'am_eat_cramp':am_eat_cramp,
        'am_ibsd_intensity':am_ibsd_intensity,
        'am_ibsd_duration':am_ibsd_duration,
        'pm_ibsd_intensity':pm_ibsd_intensity,
        'pm_ibsd_duration':pm_ibsd_duration,
        'nausea': nausea
      };
}

class Features {
  bool am_overwhelmed;
  bool pm_overwhelmed;
  
  Features({
    required this.am_overwhelmed,
    required this.pm_overwhelmed
  });

  Features.fromJson(Map<String, dynamic> json)
      : am_overwhelmed = json['am_overwhelmed'],
        pm_overwhelmed = json['pm_overwhelme'];

  Map<String, dynamic> toJson() => {
        'am_overwhelmed': am_overwhelmed,
        'pm_overwhelmed': pm_overwhelmed
      };

}

class RecordObj {
  DateTime date;
  Targets targets;
  Features features;

  RecordObj({
    required this.date,
    required this.targets,
    required this.features
  });

  RecordObj.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        targets = json['targets'],
        features = json['features'];

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'targets': targets.toJson(),
        'features': features.toJson(),
      };
}