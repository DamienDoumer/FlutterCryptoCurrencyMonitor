class DetailedCryptoCurrency {
    String id;
    String symbol;
    String name;
    dynamic assetPlatformId;
    Platforms platforms;
    DetailPlatforms detailPlatforms;
    int blockTimeInMinutes;
    String hashingAlgorithm;
    List<String> categories;
    dynamic publicNotice;
    List<dynamic> additionalNotices;
    Tion localization;
    Tion description;
    Links links;
    Image image;
    String countryOrigin;
    DateTime genesisDate;
    double sentimentVotesUpPercentage;
    double sentimentVotesDownPercentage;
    int watchlistPortfolioUsers;
    int marketCapRank;
    int coingeckoRank;
    double coingeckoScore;
    double developerScore;
    double communityScore;
    double liquidityScore;
    double publicInterestScore;
    MarketData marketData;
    PublicInterestStats publicInterestStats;
    List<dynamic> statusUpdates;
    DateTime lastUpdated;

    DetailedCryptoCurrency({
        required this.id,
        required this.symbol,
        required this.name,
        required this.assetPlatformId,
        required this.platforms,
        required this.detailPlatforms,
        required this.blockTimeInMinutes,
        required this.hashingAlgorithm,
        required this.categories,
        required this.publicNotice,
        required this.additionalNotices,
        required this.localization,
        required this.description,
        required this.links,
        required this.image,
        required this.countryOrigin,
        required this.genesisDate,
        required this.sentimentVotesUpPercentage,
        required this.sentimentVotesDownPercentage,
        required this.watchlistPortfolioUsers,
        required this.marketCapRank,
        required this.coingeckoRank,
        required this.coingeckoScore,
        required this.developerScore,
        required this.communityScore,
        required this.liquidityScore,
        required this.publicInterestScore,
        required this.marketData,
        required this.publicInterestStats,
        required this.statusUpdates,
        required this.lastUpdated,
    });
}

class Tion {
    String en;
    String fr;

    Tion({
        required this.en,
        required this.fr,
    });

}

class DetailPlatforms {
    Empty empty;

    DetailPlatforms({
        required this.empty,
    });

}

class Empty {
    dynamic decimalPlace;
    String contractAddress;

    Empty({
        required this.decimalPlace,
        required this.contractAddress,
    });

}

class Image {
    String thumb;
    String small;
    String large;

    Image({
        required this.thumb,
        required this.small,
        required this.large,
    });

}

class Links {
    List<String> homepage;
    List<String> blockchainSite;
    List<String> officialForumUrl;
    List<String> chatUrl;
    List<String> announcementUrl;
    String twitterScreenName;
    String facebookUsername;
    dynamic bitcointalkThreadIdentifier;
    String telegramChannelIdentifier;
    String subredditUrl;
    ReposUrl reposUrl;

    Links({
        required this.homepage,
        required this.blockchainSite,
        required this.officialForumUrl,
        required this.chatUrl,
        required this.announcementUrl,
        required this.twitterScreenName,
        required this.facebookUsername,
        required this.bitcointalkThreadIdentifier,
        required this.telegramChannelIdentifier,
        required this.subredditUrl,
        required this.reposUrl,
    });

}

class ReposUrl {
    List<String> github;
    List<dynamic> bitbucket;

    ReposUrl({
        required this.github,
        required this.bitbucket,
    });

}

class MarketData {
    Map<String, double> currentPrice;
    dynamic totalValueLocked;
    dynamic mcapToTvlRatio;
    dynamic fdvToTvlRatio;
    dynamic roi;
    Map<String, double> ath;
    Date athDate;
    Map<String, double> atl;
    Date atlDate;
    Map<String, double> marketCap;
    int marketCapRank;
    Map<String, double> fullyDilutedValuation;
    Map<String, double> totalVolume;
    int totalSupply;
    int maxSupply;
    int circulatingSupply;
    DateTime lastUpdated;

    MarketData({
        required this.currentPrice,
        required this.totalValueLocked,
        required this.mcapToTvlRatio,
        required this.fdvToTvlRatio,
        required this.roi,
        required this.ath,
        required this.athDate,
        required this.atl,
        required this.atlDate,
        required this.marketCap,
        required this.marketCapRank,
        required this.fullyDilutedValuation,
        required this.totalVolume,
        required this.totalSupply,
        required this.maxSupply,
        required this.circulatingSupply,
        required this.lastUpdated,
    });

}

class Date {
    DateTime eth;
    DateTime eur;
    DateTime gbp;
    DateTime usd;

    Date({
        required this.eth,
        required this.eur,
        required this.gbp,
        required this.usd,
    });

}

class Platforms {
    String empty;

    Platforms({
        required this.empty,
    });

}

class PublicInterestStats {
    int alexaRank;
    dynamic bingMatches;

    PublicInterestStats({
        required this.alexaRank,
        required this.bingMatches,
    });

}
