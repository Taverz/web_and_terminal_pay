enum PaymentObjectCheck {
  commodity,
  excise,
  job,
  service,
  gamblingBet,
  gamblingPrize,
  lottery,
  lotteryPrize,
  intellectualActivity,
  payment,
  agentCommission,
  composite,
  another;

  static PaymentObjectCheck? fromString(String value) {
    switch (value) {
      case 'commodity':
        return PaymentObjectCheck.commodity;
      case 'excise':
        return PaymentObjectCheck.excise;
      case 'job':
        return PaymentObjectCheck.job;
      case 'service':
        return PaymentObjectCheck.service;
      case 'gambling_bet':
        return PaymentObjectCheck.gamblingBet;
      case 'gambling_prize':
        return PaymentObjectCheck.gamblingPrize;
      case 'lottery':
        return PaymentObjectCheck.lottery;
      case 'lottery_prize':
        return PaymentObjectCheck.lotteryPrize;
      case 'intellectual_activity':
        return PaymentObjectCheck.intellectualActivity;
      case 'payment':
        return PaymentObjectCheck.payment;
      case 'agent_commission':
        return PaymentObjectCheck.agentCommission;
      case 'composite':
        return PaymentObjectCheck.composite;
      case 'another':
        return PaymentObjectCheck.another;
      default:
        return null;
    }
  }

  static PaymentObjectCheck? from(String value) {
    switch (value) {
      case 'commodity':
        return PaymentObjectCheck.commodity;
      case 'excise':
        return PaymentObjectCheck.excise;
      case 'job':
        return PaymentObjectCheck.job;
      case 'service':
        return PaymentObjectCheck.service;
      case 'gambling_bet':
        return PaymentObjectCheck.gamblingBet;
      case 'gambling_prize':
        return PaymentObjectCheck.gamblingPrize;
      case 'lottery':
        return PaymentObjectCheck.lottery;
      case 'lottery_prize':
        return PaymentObjectCheck.lotteryPrize;
      case 'intellectual_activity':
        return PaymentObjectCheck.intellectualActivity;
      case 'payment':
        return PaymentObjectCheck.payment;
      case 'agent_commission':
        return PaymentObjectCheck.agentCommission;
      case 'composite':
        return PaymentObjectCheck.composite;
      case 'another':
        return PaymentObjectCheck.another;
      default:
        return null;
    }
  }
}

extension PaymentObjectExtension on PaymentObjectCheck {
  String get totext {
    switch (this) {
      case PaymentObjectCheck.commodity:
        return 'commodity';
      case PaymentObjectCheck.excise:
        return 'excise';
      case PaymentObjectCheck.job:
        return 'job';
      case PaymentObjectCheck.service:
        return 'service';
      case PaymentObjectCheck.gamblingBet:
        return 'gambling_bet';
      case PaymentObjectCheck.gamblingPrize:
        return 'gambling_prize';
      case PaymentObjectCheck.lottery:
        return 'lottery';
      case PaymentObjectCheck.lotteryPrize:
        return 'lottery_prize';
      case PaymentObjectCheck.intellectualActivity:
        return 'intellectual_activity';
      case PaymentObjectCheck.payment:
        return 'payment';
      case PaymentObjectCheck.agentCommission:
        return 'agent_commission';
      case PaymentObjectCheck.composite:
        return 'composite';
      case PaymentObjectCheck.another:
        return 'another';
    }
  }
}
