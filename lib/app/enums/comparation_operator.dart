enum ComparisonOperator {
  equals,
  notEquals,
  moreThan,
  lessThan,
  moreThanOrEqual,
  lessThanOrEqual,
}

extension ComparisonOperatorExtension on ComparisonOperator {
  String get name {
    switch (this) {
      case ComparisonOperator.equals:
        return 'equals';
      case ComparisonOperator.notEquals:
        return 'notEquals';
      case ComparisonOperator.moreThan:
        return 'moreThan';
      case ComparisonOperator.lessThan:
        return 'lessThan';
      case ComparisonOperator.moreThanOrEqual:
        return 'moreThanOrEqual';
      case ComparisonOperator.lessThanOrEqual:
        return 'lessThanOrEqual';
      default:
        return '';
    }
  }

  String get symbol {
    switch (this) {
      case ComparisonOperator.equals:
        return '=';
      case ComparisonOperator.notEquals:
        return '!=';
      case ComparisonOperator.moreThan:
        return '>';
      case ComparisonOperator.lessThan:
        return '<';
      case ComparisonOperator.moreThanOrEqual:
        return '>=';
      case ComparisonOperator.lessThanOrEqual:
        return '<=';
      default:
        return '';
    }
  }
}
