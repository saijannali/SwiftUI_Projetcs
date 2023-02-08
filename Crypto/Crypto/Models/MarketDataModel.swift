//
//  MarketDataModel.swift
//  Crypto
//
//  Created by Sai Jannali on 2/5/23.
//

import Foundation

//JSON data:
/*
 URL: https://api.coingecko.com/api/v3/global
 
 JSON:
 {
 "data": {
   "active_cryptocurrencies": 12351,
   "upcoming_icos": 0,
   "ongoing_icos": 49,
   "ended_icos": 3376,
   "markets": 650,
   "total_market_cap": {
     "btc": 48166205.03807568,
     "eth": 678316433.4621834,
     "ltc": 11466135738.225216,
     "bch": 8223713186.165752,
     "bnb": 3388087745.627518,
     "eos": 1012633696235.6056,
     "xrp": 2758588550396.7886,
     "xlm": 12188369127150.582,
     "link": 158353248185.2509,
     "dot": 165612018947.93396,
     "yfi": 145399557.88190207,
     "usd": 1102661852086.547,
     "aed": 4050187248899.1025,
     "ars": 207276941494821.94,
     "aud": 1588083371245.055,
     "bdt": 119950113342809.62,
     "bhd": 421217930158.9137,
     "bmd": 1102661852086.547,
     "brl": 5681906257616.788,
     "cad": 1477875627114.5618,
     "chf": 1020370198065.328,
     "clp": 878628968045620,
     "cny": 7474834429109.518,
     "czk": 24275431472241.004,
     "dkk": 7603180960706.811,
     "eur": 1021230274309.9591,
     "gbp": 914366903576.8422,
     "hkd": 8653712268412.295,
     "huf": 396500052310537.5,
     "idr": 16591143633490512,
     "ils": 3769173875894.8457,
     "inr": 90908457992118.19,
     "jpy": 145238024728781.12,
     "krw": 1376034000090879.8,
     "kwd": 336366997979.0015,
     "lkr": 407847082312382.44,
     "mmk": 2346518152849566,
     "mxn": 20987956529092.027,
     "myr": 4695134166184.523,
     "ngn": 513993504514595.56,
     "nok": 11265493671192.254,
     "nzd": 1742275193993.4282,
     "php": 59803964901780.555,
     "pkr": 276218999271384.9,
     "pln": 4819622483961.376,
     "rub": 77899116731131.72,
     "sar": 4137959132325.194,
     "sek": 11631148470624.523,
     "sgd": 1458725698729.3726,
     "thb": 36903886865632.61,
     "try": 20766140660278.88,
     "twd": 33008733873136.9,
     "uah": 41269279928907.336,
     "vef": 110409531249.42592,
     "vnd": 25899283358035770,
     "zar": 19277340962195.703,
     "xdr": 823216464235.9587,
     "xag": 49012646701.5173,
     "xau": 587211542.7101698,
     "bits": 48166205038075.68,
     "sats": 4816620503807568
   },
   "total_volume": {
     "btc": 2855858.765328888,
     "eth": 40218570.89713123,
     "ltc": 679847295.9739231,
     "bch": 487598376.65634197,
     "bnb": 200885664.09591293,
     "eos": 60040827696.01112,
     "xrp": 163561552863.85675,
     "xlm": 722669780177.2188,
     "link": 9389041787.507557,
     "dot": 9819427035.665146,
     "yfi": 8620994.772656985,
     "usd": 65378754937.94478,
     "aed": 240142704762.56537,
     "ars": 12289813360853.47,
     "aud": 94160248088.01161,
     "bdt": 7112052575482.337,
     "bhd": 24974749765.04988,
     "bmd": 65378754937.94478,
     "brl": 336890186319.7368,
     "cad": 87625837668.2289,
     "chf": 60499538456.925964,
     "clp": 52095452358793.67,
     "cny": 443196041848.83527,
     "czk": 1439332903585.3384,
     "dkk": 450805932787.34576,
     "eur": 60550533885.77777,
     "gbp": 54214417229.72171,
     "hkd": 513093776328.0913,
     "huf": 23509183439909.434,
     "idr": 983718001762412.5,
     "ils": 223480929066.63013,
     "inr": 5390121899661.623,
     "jpy": 8611417188729.271,
     "krw": 81587469003290.02,
     "kwd": 19943789193.820076,
     "lkr": 24181968747898.76,
     "mmk": 139129176349296.08,
     "mxn": 1244412748992.1047,
     "myr": 278382738525.7692,
     "ngn": 30475576268251.63,
     "nok": 667950875955.4303,
     "nzd": 103302551663.51399,
     "php": 3545881956678.1167,
     "pkr": 16377508869465.084,
     "pln": 285763869200.75244,
     "rub": 4618775241938.154,
     "sar": 245346853655.6259,
     "sek": 689631190259.157,
     "sgd": 86490404831.22148,
     "thb": 2188096170263.139,
     "try": 1231260897133.7676,
     "twd": 1957145718444.85,
     "uah": 2446927980533.511,
     "vef": 6546374731.936409,
     "vnd": 1535613929627910.2,
     "zar": 1142987352140.369,
     "xdr": 48809947831.53138,
     "xag": 2906045775.951137,
     "xau": 34816802.15465311,
     "bits": 2855858765328.8877,
     "sats": 285585876532888.8
   },
   "market_cap_percentage": {
     "btc": 40.033735239794964,
     "eth": 17.774951722900326,
     "usdt": 6.166910465344047,
     "bnb": 3.983551896655512,
     "usdc": 3.8037363445715187,
     "xrp": 1.8439822698113113,
     "busd": 1.4725893538211041,
     "ada": 1.248734558061055,
     "doge": 1.1525906613096195,
     "okb": 0.9967643362607679
   },
   "market_cap_change_percentage_24h_usd": -1.763239994249905,
   "updated_at": 1675659566
 }
}
 */

// MARK: - Welcome
struct GlobalData: Codable {
    let data: MarketData?
}

// MARK: - DataClass
struct MarketData: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    /// alternate
    ///```
///    if let item = totalMarketCap.first(where: { (key, value) -> Bool in
///        return key == "usd"
///    }) {
///        return String(item.value)
///    }
    ///```
    ///
    var marketCap: String {
        if let item = totalMarketCap.first(where: {$0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: {$0.key == "btc"}){
            return item.value.asPercentString()
        }
        return ""
    }
    
}

