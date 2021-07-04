class Regex {
  static const fiscalCode = r'^[A-Z]{6}\d{2}[A-Z]\d{2}[A-Z]\d{3}[A-Z]$';
  static const zipCode = r'^[0-9]{5}(?:-[0-9]{4})?$';
  static const passwordLettersNumber = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
  static const passwordLettersNumberSpecial = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&"£/()=?^])[A-Za-z\d@$!%*#?&"£/()=?^]{8,}$';
  static const passwordUpperLowerNumber = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$';
  static const passwordUpperLowerNumberSpecial = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&"£/()=?^])[A-Za-z\d@$!%*?&"£/()=?^]{8,}$';
  static const dateDym = r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$';
}
