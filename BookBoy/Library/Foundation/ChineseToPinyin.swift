//
//  StringExtension.swift
//  TestFrameWork
//
//  Created by 飞流 on 2018/5/28.
//  Copyright © 2018年 飞流. All rights reserved.
//

import Foundation

private let hanziStart = 19968

private func findLetter(nCode: Int) -> String {
    var strValue = ""
    switch(nCode) {
    case 6325, 6436, 7571, 7925:
        strValue = "A"
        break
    case 6263, 6440, 7040, 7208, 7451, 7733, 7945, 8616:
        strValue = "AI"
        break
    case 5847, 5991, 6278, 6577, 6654, 7281, 7907, 8038, 8786:
        strValue = "AN"
        break
        //            strValue = "ANG"
    //            break
    case 5974, 6254, 6427, 6514, 6658, 6959, 7033, 7081, 7365, 8190, 8292, 8643, 8701, 8773:
        strValue = "AO"
        break
    case 6056, 6135, 6517, 7857, 8446, 8649, 8741:
        strValue = "BA"
        break
    case 6267, 6334, 7494:
        strValue = "BAI"
        break
    case 5870, 5964, 7851, 8103, 8113, 8418:
        strValue = "BAN"
        break
    case 6182, 6826:
        strValue = "BANG"
        break
    case 6165, 7063, 7650, 8017, 8157, 8532, 8621:
        strValue = "BAO"
        break
    case 5635, 5873, 5893, 5993, 6141, 6703, 7753, 8039, 8156, 8645, 8725:
        strValue = "BEI"
        break
    case 5946, 5948, 7458, 7928:
        strValue = "BEN"
        break
    case 6452, 7420:
        strValue = "BENG"
        break
    case 5616, 5734, 6074, 6109, 6221, 6333, 6357, 6589, 6656, 6725, 6868, 6908, 6986, 6994, 7030, 7052, 7221, 7815, 7873, 7985, 8152, 8357, 8375, 8387, 8416, 8437, 8547, 8734:
        strValue = "BI"
        break
    case 5650, 5945, 6048, 6677, 6774, 7134, 7614, 7652, 7730, 7760, 8125, 8159, 8289, 8354, 8693:
        strValue = "BIAN"
        break
    case 7027, 7084, 7609, 7613, 7958, 7980, 8106, 8149, 8707, 8752:
        strValue = "BIAO"
        break
    case 8531:
        strValue = "BIE"
        break
    case 5747, 6557, 7145, 7167, 7336, 7375, 7587, 7957, 8738, 8762:
        strValue = "BIN"
        break
    case 5787, 5891, 6280:
        strValue = "BING"
        break
    case 5781, 6403, 6636, 7362, 7502, 7771, 7864, 8030, 8404, 8543, 8559:
        strValue = "BO"
        break
    case 6318, 6945, 7419, 7446, 7848, 7863, 8519:
        strValue = "BU"
        break
    case 6474, 7769:
        strValue = "CA"
        break
        //            strValue = "CAI"
    //            break
    case 6978, 7078, 7218, 8451, 8785:
        strValue = "CAN"
        break
    case 5687:
        strValue = "CANG"
        break
    case 6448, 6878, 8309, 8429:
        strValue = "CAO"
        break
    case 6692:
        strValue = "CE"
        break
    case 6515, 6825:
        strValue = "CEN"
        break
    case 6465:
        strValue = "CENG"
        break
    case 6639, 6766, 7017, 7230, 7311, 7322, 7363, 7942, 7979, 8135:
        strValue = "CHA"
        break
    case 5713, 7846, 8091, 8218:
        strValue = "CHAI"
        break
    case 5770, 5838, 6159, 6667, 6893, 6904, 6981, 7031, 7086, 7472, 7688, 7966, 8324, 8580:
        strValue = "CHAN"
        break
    case 5686, 5943, 6041, 6137, 6660, 6568, 6749, 7029, 7047, 7438, 7509, 8680:
        strValue = "CHANG"
        break
    case 6687, 7443, 8173:
        strValue = "CHAO"
        break
    case 5969, 7726:
        strValue = "CHE"
        break
    case 5840, 5863, 6251, 6433, 6923, 7201, 7320, 7755, 8619:
        strValue = "CHEN"
        break
    case 5609, 5984, 7239, 7263, 7583, 7810, 7881, 7905, 8146, 8241, 8508:
        strValue = "CHENG"
        break
    case 5749, 6015, 6061, 6319, 6374, 6420, 6445, 6633, 7042, 7523, 7787, 8023, 8101, 8161, 8231, 8304, 8355, 8388, 8489, 8556, 8746:
        strValue = "CHI"
        break
    case 6091, 6671, 6731, 8409, 8430:
        strValue = "CHONG"
        break
    case 5717, 6492, 6716, 8112, 8637:
        strValue = "CHOU"
        break
    case 5601, 5927, 6680, 6732, 7109, 7238, 7290, 7343, 8150, 8260, 8573, 8777:
        strValue = "CHU"
        break
    case 6285, 6408, 7590, 8563:
        strValue = "CHUAI"
        break
    case 6622, 6955, 7516, 7843, 8413:
        strValue = "CHUAN"
        break
    case 6675:
        strValue = "CHUANG"
        break
    case 5879, 7302, 7319:
        strValue = "CHUI"
        break
    case 6127, 8040, 8277:
        strValue = "CHUN"
        break
    case 7401, 8554, 8626:
        strValue = "CHUO"
        break
        //            strValue = "CI"
    //            break
    case 6075, 6358, 7684, 8043, 8457:
        strValue = "4337 À≈"
        break
    case 6042, 6840, 7085, 7193, 7214, 7240:
        strValue = "CONG"
        break
    case 7308, 7403, 7577:
        strValue = "COU"
        break
    case 6180, 6562, 6607, 7367, 8501, 8530, 8577:
        strValue = "CU"
        break
    case 5764, 6305, 7664, 7973:
        strValue = "CUAN"
        break
    case 6718, 6145, 6393, 7213, 7333, 7505, 8631:
        strValue = "CUI"
        break
    case 6666, 8169:
        strValue = "CUN"
        break
    case 5640, 6547, 7566, 7917, 7983, 8078, 8526, 8567:
        strValue = "CUO"
        break
    case 6239, 6353, 6410, 6682, 7007, 8155, 8346, 8716, 8718:
        strValue = "DA"
        break
    case 6004, 6316, 6523, 6942, 7110, 7173, 8776:
        strValue = "DAI"
        break
    case 5757, 6144, 6402, 7373, 7470, 7781, 8067, 8087, 8185, 8376:
        strValue = "DAN"
        break
    case 5852, 5942, 6148, 6920, 7724, 7885, 8141:
        strValue = "DANG"
        break
    case 6322, 6665, 7514, 8478:
        strValue = "DAO"
        break
    case 7929:
        strValue = "DE"
        break
    case 6466, 6556, 7413, 7767, 7975, 8403:
        strValue = "DENG"
        break
    case 5621, 5765, 5814, 5848, 5901, 5970, 6122, 6454, 7023, 7116, 7260, 7306, 7475, 7738, 7758, 7791, 7965, 8438, 8730:
        strValue = "DI"
        break
    case 6439:
        strValue = "DIA"
        break
    case 5871, 5967, 6559, 7172, 7868, 8116, 8118, 8401, 8558:
        strValue = "DIAN"
        break
    case 7886, 8585, 8684:
        strValue = "DIAO"
        break
    case 5976, 6006, 6273, 6409, 7526, 8012, 8183, 8562, 8688:
        strValue = "DIE"
        break
    case 5674, 6404, 7164, 7575, 7754, 7814, 8059, 8184, 8490:
        strValue = "DING"
        break
    case 7891:
        strValue = "DIU"
        break
    case 5977, 6343, 6520, 6528, 7517, 7543, 7556, 7747, 8020:
        strValue = "DONG"
        break
    case 6190, 8128, 8229, 8391:
        strValue = "DOU"
        break
    case 6022, 6429, 6834, 7292, 7525, 8328, 8338, 8739, 8782:
        strValue = "DU"
        break
    case 7318, 7649, 8393:
        strValue = "DUAN"
        break
    case 7701, 7713, 7752:
        strValue = "DUI"
        break
    case 6771, 7632, 7727, 7766, 7779, 7970, 8527:
        strValue = "DUN"
        break
    case 6345, 6365, 6785, 7122, 7876, 8154, 8566:
        strValue = "DUO"
        break
    case 5612, 5832, 5844, 5949, 6035, 6113, 6164, 6332, 6721, 6977, 7025, 7378, 7581, 7916, 7941, 8042, 8206, 8689:
        strValue = "E"
        break
    case 6176, 6284:
        strValue = "EN"
        break
    case 5706, 6939, 7177, 7879, 8025, 8660:
        strValue = "ER"
        break
    case 5950, 7732:
        strValue = "FA"
        break
    case 6212, 6232, 6506, 7283, 7660, 7818, 8576:
        strValue = "FAN"
        break
    case 5890, 7242, 7853, 8419, 8648:
        strValue = "FANG"
        break
    case 6032, 6584, 6713, 6839, 6990, 7119, 7328, 7572, 7619, 7673, 7948, 8082, 8267, 8385, 8468, 8613, 8678:
        strValue = "FEI"
        break
    case 5739, 6915, 7291, 8687, 8787:
        strValue = "FEN"
        break
    case 5726, 5926, 6155, 6384, 6767, 7731:
        strValue = "FENG"
        break
        //            strValue = "FO"
    //            break
    case 8330:
        strValue = "FOU"
        break
    case 5775, 5776, 5914, 6029, 6062, 6119, 6142, 6252, 6327, 6505, 6686, 6870, 6985, 7058, 7066, 7106, 7108, 7285, 7471, 7680, 7741, 7774, 7775, 7823, 7991, 8005, 8222, 8261, 8280, 8283, 8479, 8535, 8538, 8654, 8691:
        strValue = "FU"
        break
    case 6246, 7056, 7057, 7424, 7837:
        strValue = " GA"
        break
    case 5604, 5875, 5982, 7414, 7464:
        strValue = "GAI"
        break
    case 5965, 6053, 6247, 6306, 6779, 6838, 6887, 7104, 7347, 7426, 7723, 8065, 8491:
        strValue = "GAN"
        break
    case 7716, 7824, 8364:
        strValue = "GANG"
        break
    case 5626, 5830, 5912, 6227, 7141, 7332, 7334, 7429, 7915:
        strValue = "GAO"
        break
    case 5610, 5678, 5933, 5957, 6010, 6435, 7092, 7501, 7585, 7749, 7951, 8143, 8220, 8420, 8732:
        strValue = "GE"
        break
        //            strValue = "GEI"
    //            break
    case 5608, 6102, 6371, 8462:
        strValue = "GEN"
        break
    case 6376, 6657, 7114, 8665:
        strValue = "GENG"
        break
    case 7178, 7537, 8228, 8601:
        strValue = "GONG"
        break
    case 5694, 5824, 6524, 6960, 7037, 7135, 7259, 7477, 7616, 8349, 8384, 8724:
        strValue = "GOU"
        break
    case 5637, 5812, 6152, 6536, 6773, 7284, 7379, 7484, 7486, 7591, 7617, 7813, 7825, 7860, 7932, 8019, 8083, 8233, 8494, 8593, 8681, 8729:
        strValue = "GU"
        break
    case 5652, 5820, 6341, 7273, 7550, 8027:
        strValue = "GUA"
        break
        //            strValue = "GUAI"
    //            break
    case 5736, 6124, 6272, 6842, 7834, 8057, 8170, 8704:
        strValue = "GUAN"
        break
    case 6359, 6578, 7270, 7555:
        strValue = "GUANG"
        break
    case 5648, 5659, 6649, 7003, 7277, 7433, 7448, 8007, 8394, 8657, 8712:
        strValue = "GUI"
        break
    case 5782, 7121, 7762, 8671:
        strValue = "GUN"
        break
    case 5769, 6266, 6335, 6494, 6538, 6603, 7304, 7529, 8188, 8268, 8269:
        strValue = "GUO"
        break
    case 7894:
        strValue = "HA"
        break
    case 6443, 7560, 8516:
        strValue = "HAI"
        break
    case 5885, 6153, 6294, 6759, 6911, 7447, 7642, 8192, 8205, 8232, 8793:
        strValue = "HAN"
        break
    case 6776, 7112, 8194:
        strValue = "HANG"
        break
    case 6179, 6222, 6438, 6467, 6909, 6916, 7427, 8009, 8211, 8226:
        strValue = "HAO"
        break
    case 5813, 5932, 5954, 6432, 6756, 7434, 7833, 8202, 8234, 8471:
        strValue = "HE"
        break
        //            strValue = "HEI"
        //            break
        //            strValue = "HEN"
    //            break
    case 6231, 7181, 7276:
        strValue = "HENG"
        break
    case 5768, 5774, 5807, 6106, 6214, 6216, 6740, 6792:
        strValue = "HONG"
        break
    case 6009, 6565, 6943, 8090, 8383, 8455, 8655, 8731:
        strValue = "HOU"
        break
    case 5792, 6392, 6481, 6518, 6609, 6679, 6717, 6816, 6879, 7190, 7346, 7385, 7618, 7635, 7646, 7670, 7672, 7679, 8013, 8032, 8041, 8055, 8343, 8513, 8590:
        strValue = "HU"
        break
    case 7072, 7275, 7725, 7892:
        strValue = "HUA"
        break
    case 8555:
        strValue = "HUAI"
        break
    case 5928, 6140, 6307, 6487, 6621, 6801, 6829, 6881, 6930, 6953, 7157, 7944, 8673, 8763:
        strValue = "HUAN"
        break
    case 5882, 6569, 6850, 6874, 6956, 7211, 7533, 8105, 8308, 8382, 8692:
        strValue = "HUANG"
        break
    case 5822, 6078, 6086, 6205, 6352, 6360, 6425, 6736, 6807, 6811, 6971, 7132, 7185, 7445, 7703, 8219, 8319, 8766:
        strValue = "HUI"
        break
    case 5827, 6638, 6752, 6867:
        strValue = "HUN"
        break
    case 5669, 6229, 6311, 6475, 6623, 7856, 7933, 7976, 8175, 8322:
        strValue = "HUO"
        break
    case 5629, 5632, 5662, 5705, 5742, 5952, 6024, 6033, 6193, 6210, 6265, 6320, 6350, 6383, 6507, 6553, 6809, 6976, 7087, 7160, 7165, 7314, 7374, 7410, 7411, 7469, 7473, 7487, 7620, 7722, 7831, 7990, 8002, 8104, 8217, 8337, 8339, 8463, 8550, 8611, 8661, 8674, 8757, 8768:
        strValue = "JI"
        break
    case 5704, 5903, 6171, 6521, 6804, 6940, 7176, 7409, 7546, 7702, 7882, 7956, 8072, 8142, 8244, 8353, 8434, 8542:
        strValue = "JIA"
        break
    case 5752, 5841, 5857, 6149, 6183, 6286, 6853, 6931, 6932, 7144, 7237, 7305, 7407, 7415, 7480, 7489, 7506, 7576, 7790, 7921, 8047, 8148, 8340, 8469, 8534, 8561, 8668, 8721:
        strValue = "JIAN"
        break
    case 6092, 6814, 7113, 7154, 7481, 7768, 8180, 8461, 8488:
        strValue = "JIANG"
        break
    case 5714, 5753, 6020, 6090, 6256, 6461, 6572, 7015, 7524, 8008, 8052, 8252, 8520, 8551, 8662:
        strValue = "JIAO"
        break
    case 5806, 5821, 6255, 6414, 7028, 7061, 7278, 7757, 8060, 8201, 8227, 8441, 8658, 8726:
        strValue = "JIE"
        break
    case 5865, 6103, 6132, 6468, 6643, 6659, 7138, 7210, 7340, 7465, 7478, 8138:
        strValue = "JIN"
        break
    case 5751, 5869, 6128, 6616, 6729, 6794, 6941, 6982, 7026, 7534, 7554, 7570, 7626:
        strValue = "JIANG"
        break
    case 6936, 7671:
        strValue = "JIONG"
        break
    case 5754, 6417, 6746, 7249, 7274, 8015, 8053, 8481, 8761:
        strValue = "JIU"
        break
    case 5738, 5810, 6036, 6058, 6076, 6268, 6965, 6980, 7202, 7307, 7316, 7323, 7357, 7381, 7488, 7611, 7850, 7924, 8022, 8132, 8153, 8482, 8522, 8565, 8620, 8634, 8722:
        strValue = "JU"
        break
    case 5918, 6590, 6824, 7280, 7835, 7935, 7952, 8633:
        strValue = "JUAN"
        break
    case 5642, 5667, 5860, 5939, 6207, 6421, 6457, 6469, 6540, 6617, 7062, 7169, 7286, 7351, 7663, 7967, 8574, 8591:
        strValue = "JUE"
        break
    case 6260, 8168, 8362, 8769:
        strValue = "JUN"
        break
    case 5671, 6339, 7544:
        strValue = "KA"
        break
    case 5660, 5978, 6160, 6673, 6693, 7888, 7920, 7939:
        strValue = "KAI"
        break
    case 5709, 6108, 7412, 7772, 7811:
        strValue = "KAN"
        break
    case 5688, 6742, 7854:
        strValue = "KANG"
        break
    case 6974, 7264, 7491, 7877:
        strValue = "KAO"
        break
    case 6430, 6519, 6701, 6859, 7076, 7128, 7170, 7380, 7520, 7807, 7861, 7930, 7993, 8066, 8129, 8204, 8282, 8733:
        strValue = "KE"
        break
    case 8144:
        strValue = "KEN"
        break
    case 7912:
        strValue = "KENG"
        break
    case 5737, 6539, 8377:
        strValue = "KONG"
        break
    case 6050, 6202, 6321, 7778, 8356:
        strValue = "KOU"
        break
    case 5658, 6005, 6423, 7111, 8728:
        strValue = "KU"
        break
    case 5708:
        strValue = "KUA"
        break
    case 5665, 5906, 6364, 6586, 7558:
        strValue = "KUAI"
        break
    case 8737:
        strValue = "KUAN"
        break
    case 5818, 5831, 5887, 5959, 6237, 6349, 7094, 7460:
        strValue = "KUANG"
        break
    case 5624, 5649, 5771, 6162, 6281, 6413, 6416, 6720, 6951, 7450, 7805, 8606, 8743:
        strValue = "KUI"
        break
    case 6204, 6245, 6458, 6618, 6928, 7152, 7841, 8051:
        strValue = "LIAO"
        break
    case 5793, 5988, 6270, 6354, 6803, 8483, 8581, 8764:
        strValue = "LIE"
        break
    case 6194, 6388, 6555, 6662, 6733, 6964, 7361, 7405, 7602, 7812, 8452, 8579, 8775:
        strValue = "LIN"
        break
    case 5925, 6063, 6342, 6482, 6786, 7117, 7258, 7289, 7418, 8186, 8240, 8465, 8676:
        strValue = "LING"
        break
    case 6815, 6962, 7082, 7124, 7628, 7654, 7919, 7954, 8050, 8644:
        strValue = "LIU"
        break
    case 5966, 6055, 6781, 7171, 7248, 7542, 7735, 8110:
        strValue = "LONG"
        break
    case 5745, 6168, 6422, 6548, 7946, 8092, 8179, 8287, 8735:
        strValue = "LOU"
        break
    case 6744, 7321, 7586, 7918, 7989, 8158:
        strValue = "L®π"
        break
    case 5968, 6303, 6464, 6782, 6843, 6885, 6954, 7220, 7251, 7354, 7391, 7404, 7510, 7545, 7969, 8021, 8056, 8392, 8421, 8652:
        strValue = "LU"
        break
    case 5785, 7014, 7279, 8029, 8639:
        strValue = "LUAN"
        break
        //            strValue = "L®µE"
        //            break
        //            strValue = "LUN"
    //            break
    case 5732, 5789, 6093, 6259, 6291, 6604, 6788, 6880, 7183, 7301, 7565, 7961, 8107, 8635:
        strValue = "LUO"
        break
    case 6328:
        strValue = "M"
        break
    case 6373, 6579, 7054, 7231, 8301:
        strValue = "MA"
        break
    case 5929, 6104, 8618:
        strValue = "MAI"
        break
    case 6012, 6503, 7147, 7655, 7960, 8209, 8293, 8709, 8720:
        strValue = "MAN"
        break
    case 5888, 6861, 7743, 8294:
        strValue = "MANG"
        break
    case 5783, 6066, 6525, 6787, 7203, 7436, 7483, 7503, 7624, 7714, 7806, 8317, 8754:
        strValue = "MAO"
        break
    case 6114, 6550, 6613, 6828, 6856, 7325, 7949, 8044, 8139, 8740:
        strValue = "MEI"
        break
    case 6249, 7643, 7715, 7845:
        strValue = "MEN"
        break
    case 5934, 6189, 6211, 6734, 7592, 7770, 8221, 8276, 8323, 8427, 8431:
        strValue = "MENG"
        break
    case 5634, 5855, 6234, 6368, 6455, 6608, 6772, 6921, 6984, 7563, 7682, 8445, 8767, 8771:
        strValue = "MI"
        break
    case 6770, 6837, 6847, 7579, 7777:
        strValue = "MIAN"
        break
    case 6387, 6967, 7131, 7149, 7234, 7721, 7780, 8037:
        strValue = "MIAO"
        break
    case 5631, 6367, 8326, 8390:
        strValue = "MIE"
        break
    case 6069, 6526, 6741, 6793, 7137, 7168, 7175, 7710, 8710, 8628:
        strValue = "MIN"
        break
    case 5804, 6088, 6873, 7452, 7808, 8504:
        strValue = "MING"
        break
        //            strValue = "MIU"
    //            break
    case 5851, 6052, 6175, 6641, 7038, 7366, 7950, 7987, 8102, 8182, 8586, 8588, 8765:
        strValue = "MO"
        break
    case 5716, 6372, 7788, 8254, 8290, 8642:
        strValue = "MOU"
        break
    case 5679, 5973, 6057, 6769, 7504, 7866:
        strValue = "MU"
        break
    case 6437:
        strValue = "N"
        break
    case 6264, 7539, 7953, 8136:
        strValue = "NA"
        break
    case 5630, 6021, 6133, 7245:
        strValue = "NAI"
        break
    case 6411, 6478, 6479, 7310, 7578, 8279, 8486:
        strValue = "NAN"
        break
    case 6313, 6476, 6646, 7457:
        strValue = "NANG"
        break
    case 5611, 5981, 6346, 6614, 7207, 7748, 7883, 8245:
        strValue = "NAO"
        break
    case 5811:
        strValue = "NE"
        break
        //            strValue = "NEI"
    //            break
    case 7705:
        strValue = "NEN"
        break
        //            strValue = "NENG"
    //            break
    case 5703, 5972, 6605, 6685, 7439, 7627, 7711, 7794, 7874, 8682:
        strValue = "NI"
        break
    case 5605, 5994, 7393, 8004, 8651, 8683:
        strValue = "NIAN"
        break
        //            strValue = "NIANG"
    //            break
    case 6064, 7053, 7569, 8433:
        strValue = "NIAO"
        break
    case 5877, 6233, 6431, 8208, 8411, 8570:
        strValue = "NIE"
        break
        //            strValue = "NIN"
    //            break
    case 5690, 6344, 6924, 8187:
        strValue = "NING"
        break
    case 6580, 6678, 7004:
        strValue = "NIU"
        break
    case 5715, 6370:
        strValue = "NONG"
        break
    case 8181:
        strValue = "NOU"
        break
    case 6983, 7032, 7059, 7069:
        strValue = "NU"
        break
    case 7704, 7847, 8412:
        strValue = "N®µ"
        break
        //            strValue = "NUAN"
        //            break
        //            strValue = "NUE"
    //            break
    case 5748, 6289, 6386, 7927:
        strValue = "NUO"
        break
    case 6424, 6462:
        strValue = "O"
        break
    case 5809, 6670, 7417, 8178:
        strValue = "OU"
        break
    case 6166, 7243, 8365:
        strValue = "PA"
        break
    case 5729, 6169, 6363:
        strValue = "PAI"
        break
    case 6761, 6790, 8140, 8165, 8320, 8571:
        strValue = "PAN"
        break
    case 6561, 6872, 6944, 8306:
        strValue = "PANG"
        break
    case 6243, 6583, 6650, 7567, 8069:
        strValue = "PAO"
        break
    case 6446, 6490, 7623, 7934, 8512, 8612:
        strValue = "PEI"
        break
    case 6852:
        strValue = "PEN"
        break
    case 6001, 6456, 6681, 8318:
        strValue = "PENG"
        break
    case 5607, 5682, 5880, 5892, 5915, 5960, 6017, 6037, 6308, 6472, 6647, 6836, 7039, 7102, 7233, 7422, 7802, 7828, 7875, 8117, 8166, 8223, 8271, 8589:
        strValue = "PI"
        break
    case 5850, 7073, 7490, 7561, 8470, 8568:
        strValue = "PIAN"
        break
    case 5666, 6449, 7046, 7146, 7372, 7809, 8310:
        strValue = "PIAO"
        break
    case 6054, 7513:
        strValue = "PIE"
        break
    case 7041, 6253, 7016, 7315, 7482, 8213:
        strValue = "PIN"
        break
    case 5723, 7019, 7250, 8650:
        strValue = "PING"
        break
    case 5647, 5922, 7174, 7839, 7862, 8011, 8345:
        strValue = "PO"
        break
    case 5786, 6269:
        strValue = "POU"
        break
    case 5773, 6459, 6863, 6907, 7217, 7511, 7968, 7972, 8575:
        strValue = "PU"
        break
    case 5633, 5725, 5963, 6027, 6046, 6089, 6129, 6134, 6161, 6213, 6366, 6450, 6508, 6510, 6764, 6831, 7075, 7118, 7187, 7189, 7229, 7271, 7342, 7440, 7605, 7687, 7712, 7751, 8193, 8251, 8264, 8475, 8476, 8572, 8702, 8772:
        strValue = "QI"
        break
    case 6154, 8736:
        strValue = "QIA"
        break
    case 5727, 5761, 5868, 6023, 6045, 6071, 6271, 6509, 6705, 6727, 6925, 6926, 6929, 7155, 7293, 7541, 7709, 7852, 8215, 8373:
        strValue = "QIAN"
        break
    case 6762, 7045, 7341, 7408, 7633, 7926, 7947, 7974, 8163, 8262, 8439, 8536:
        strValue = "QIANG"
        break
    case 5668, 5829, 5859, 6081, 6529, 6724, 6730, 7352, 7745, 8546, 8719:
        strValue = "QIAO"
        break
    case 5907, 6711, 7010, 7492, 7938, 8370:
        strValue = "QIE"
        break
    case 6043, 6276, 6336, 6426, 6463, 6858, 7353, 7923, 8291, 8432:
        strValue = "QIN"
        break
    case 6060, 6485, 7349, 7764, 8263, 8332, 8368, 8605, 8675, 8784:
        strValue = "QING"
        break
    case 5886, 6068, 8123, 8243, 8344, 8528, 8638:
        strValue = "QIONG"
        break
    case 5720, 5947, 6576, 6848, 6947, 6957, 7317, 7468, 8216, 8239, 8288, 8435, 8460, 8690, 8792:
        strValue = "QIU"
        break
    case 5816, 5930, 6201, 6230, 6511, 6573, 6754, 7219, 7479, 7512, 7552, 7678, 7765, 8119, 8248, 8329, 8480, 8636, 8781:
        strValue = "QU"
        break
    case 5825, 6085, 6710, 7125, 7390, 7816, 7893, 8273, 8360, 8760:
        strValue = "QUAN"
        break
    case 6755, 6758, 7708:
        strValue = "QUE"
        break
    case 6950:
        strValue = "QUN"
        break
    case 6059, 8237, 8755:
        strValue = "RAN"
        break
    case 7692, 8006:
        strValue = "RANG"
        break
    case 6073, 7012, 7267:
        strValue = "RAO"
        break
        //            strValue = "RE"
    //            break
    case 5680, 6083, 6156, 6631, 7377, 7994, 8137:
        strValue = "REN"
        break
        //            strValue = "RENG"
        //            break
        //            strValue = "RI"
    //            break
    case 6541, 6585, 7337, 7532, 8278:
        strValue = "RONG"
        break
    case 8459, 8569, 8723:
        strValue = "ROU"
        break
    case 6174, 6224, 6473, 6818, 6865, 6906, 7140, 7908, 8164, 8212:
        strValue = "RU"
        break
    case 7535:
        strValue = "RUAN"
        break
    case 6039, 6208, 7236, 7803, 8224:
        strValue = "RUI"
        break
        //            strValue = "RUN"
    //            break
    case 5728, 8372:
        strValue = "RUO"
        break
    case 5606, 5677, 7493, 7559, 7610:
        strValue = "SA"
        break
    case 6471:
        strValue = "SAI"
        break
    case 6644, 7507, 8454:
        strValue = "SAN"
        break
    case 6290, 7763, 8210:
        strValue = "SANG"
        break
    case 6003, 7150, 7156, 7593, 8094, 8694:
        strValue = "SAO"
        break
        //            strValue = "SE"
        //            break
        //            strValue = "SEN"
        //            break
        //            strValue = "SENG"
    //            break
    case 6394, 7606, 7901, 8080, 8436, 8614, 8672:
        strValue = "SHA"
        break
    case 8507:
        strValue = "SHAI"
        break
    case 5663, 5808, 5923, 5979, 6047, 6890, 7009, 7051, 7083, 7594, 7844, 8062, 8321, 8414, 8539, 8713:
        strValue = "SHAN"
        break
    case 5980, 7120, 7368, 7656, 8592:
        strValue = "SHANG"
        break
    case 5931, 6070, 6891, 7228, 8366, 8425:
        strValue = "SHAO"
        break
    case 5639, 5760, 6606, 6860, 7608, 7820, 8774:
        strValue = "SHE"
        break
    case 5837, 6123, 6351, 6841, 7309, 7547, 7982, 8255:
        strValue = "SHEN"
        break
    case 6551, 7441, 7782, 8347:
        strValue = "SHENG"
        break
    case 5854, 5985, 6110, 6173, 6317, 7388, 7459, 7634, 7870, 8307, 8334, 8363, 8525, 8669, 8685:
        strValue = "SHI"
        break
    case 6587, 7123, 8428:
        strValue = "SHOU"
        break
    case 5731, 5951, 6136, 6283, 6780, 6888, 7013, 7508, 7582, 7988:
        strValue = "SHU"
        break
    case 6407:
        strValue = "SHUA"
        break
    case 8316:
        strValue = "SHUAI"
        break
    case 6737, 6844:
        strValue = "SHUAN"
        break
    case 7055:
        strValue = "SHUANG"
        break
    case 6184, 6287, 6989, 7335, 7869:
        strValue = "SHUO"
        break
    case 5643, 5778, 5944, 6348, 6765, 6784, 6889, 7006, 7065, 7133, 7675, 7940, 8024, 8174, 8247, 8351:
        strValue = "SI"
        break
    case 5801, 6131, 6534, 6552, 6676, 6704, 6833, 8121:
        strValue = "SONG"
        break
    case 5937, 6220, 6418, 6453, 6640, 6849, 7612, 7804, 7943, 8284:
        strValue = "SOU"
        break
    case 5777, 5853, 6188, 6428, 6726, 6819, 8389, 8602, 8653:
        strValue = "SU"
        break
    case 6601:
        strValue = "SUAN"
        break
    case 5839, 6120, 6901, 6968, 7661, 7785, 7801:
        strValue = "SUI"
        break
    case 6105, 6588, 6624, 7330, 8632:
        strValue = "SUN"
        break
    case 6379, 6434, 6442, 7022, 7288, 7792, 8440:
        strValue = "SUO"
        break
    case 6743, 6866, 6961, 7329, 7719, 7872, 8533, 8703:
        strValue = "TA"
        break
    case 5902, 6223, 6330, 7070, 7536, 7638, 7849, 8544, 8656:
        strValue = "TAI"
        break
    case 5916, 6903, 7428, 7694, 7867, 7936, 8191:
        strValue = "TAN"
        break
    case 5746, 6491, 6871, 7209, 7344, 7906, 7959, 8177, 8305, 8311, 8442, 8517:
        strValue = "TANG"
        break
    case 5627, 6391, 6812, 7226, 7666:
        strValue = "TAO"
        break
        //            strValue = "1845 ≤Õ"
    //            break
    case 6315, 7693, 7911:
        strValue = "TE"
        break
    case 7588:
        strValue = "TENG"
        break
    case 5735, 6709, 6949, 7130, 8035, 8151, 8514:
        strValue = "TI"
        break
    case 6261, 6735, 6757, 7369, 7817:
        strValue = "TIAN"
        break
    case 5712, 7686, 8127, 8272, 8352, 8448, 8622, 8670, 8756:
        strValue = "TIAO"
        break
    case 6138, 8749:
        strValue = "TIE"
        break
    case 6080, 6167, 7035, 7272, 7890, 8249, 8610:
        strValue = "TING"
        break
    case 5701, 5758, 6077, 6444, 6690, 6892, 7737:
        strValue = "TONG"
        break
    case 7855, 7822, 8727:
        strValue = "TOU"
        break
    case 6002, 6117, 6143, 7842, 8509:
        strValue = "TU"
        break
    case 6250, 6972:
        strValue = "TUAN"
        break
    case 7653:
        strValue = "TUI"
        break
    case 5759, 6629, 7453, 7564:
        strValue = "TUN"
        break
    case 5617, 5702, 5971, 6653, 6791, 7256, 7262, 7350, 7740, 8374, 8502, 8541, 8630:
        strValue = "TUO"
        break
    case 5684, 7020, 7580:
        strValue = "WA"
        break
        //            strValue = "WAI"
    //            break
    case 5664, 6025, 6150, 7093, 7126, 7194, 7568, 7821, 8274:
        strValue = "WAN"
        break
    case 5672, 6244, 6715, 7394, 8745:
        strValue = "WANG"
        break
    case 5743, 5835, 5881, 5883, 6158, 6217, 6488, 6501, 6543, 6545, 6611, 6612, 6739, 6777, 6802, 6822, 6952, 7024, 7166, 7224, 7406, 7631, 7648, 8084, 8426, 8659:
        strValue = "WEI"
        break
    case 5656, 6751, 6775, 7223, 8609:
        strValue = "WEN"
        break
    case 6178, 6219:
        strValue = "WENG"
        break
    case 5733, 6111, 6502, 6855, 7531, 7750, 8627:
        strValue = "WO"
        break
    case 5603, 5685, 5867, 5889, 5956, 6044, 6377, 6648, 6668, 6672, 6820, 6927, 6935, 6992, 7036, 7080, 7227, 7485, 7641, 8036, 8045, 8077, 8258, 8640, 8789:
        strValue = "WU"
        break
    case 5750, 5766, 5884, 5913, 6130, 6163, 6191, 6241, 6381, 6567, 6630, 6750, 6827, 6832, 6979, 7050, 7184, 7356, 7456, 7474, 7604, 7668, 7689, 7691, 8010, 8122, 8265, 8303, 8312, 8410, 8424, 8443, 8449, 8466, 8521, 8791:
        strValue = "XI"
        break
    case 6340, 6582, 6958, 7206, 7252, 7744, 8093, 8333, 8779:
        strValue = "XIA"
        break
    case 5794, 5823, 6040, 6118, 6226, 6513, 6593, 6963, 7021, 7515, 7662, 7676, 8034, 8079, 8225, 8358, 8444, 8503, 8548, 8549, 8617:
        strValue = "XIAN"
        break
    case 6028, 6157, 6635, 6652, 7088, 7129, 8313, 8663, 8747:
        strValue = "XIANG"
        break
    case 6356, 6537, 6876, 6948, 7071, 7115, 7241, 7253, 8257, 8367, 8379, 8744:
        strValue = "XIAO"
        break
    case 5741, 5784, 5936, 5938, 6215, 6302, 6619, 6661, 6845, 6912, 6966, 7105, 7151, 7331, 7339, 8583:
        strValue = "XIE"
        break
    case 5622, 6016, 7431, 7607, 8646:
        strValue = "XIN"
        break
    case 5874, 6084, 6309, 6712, 7742:
        strValue = "XING"
        break
    case 6026:
        strValue = "XIONG"
        break
    case 6361, 6522, 6642, 6651, 6869, 8028, 8587, 8759:
        strValue = "XIU"
        break
    case 5828, 5935, 5955, 6203, 6810, 6851, 7179, 7282, 7667, 7776, 8167, 8458, 8515:
        strValue = "XU"
        break
    case 5756, 5846, 6170, 6279, 6789, 6854, 6886, 7215, 7324, 7449, 7637, 7651, 7759, 7871, 7964, 8071:
        strValue = "XUAN"
        break
    case 5842, 7720, 8529, 8708:
        strValue = "XUE"
        break
    case 5767, 5908, 5987, 6087, 6101, 6206, 6225, 6530, 6563, 6620, 6694, 6813, 6817, 7454, 8131, 8524, 8664:
        strValue = "XUN"
        break
    case 5683, 5975, 6275, 6512, 6934, 7011, 7180, 7266, 7518, 7728, 7793, 8073:
        strValue = "YA"
        break
    case 5641, 5645, 5718, 5740, 5780, 5861, 5917, 5919, 6030, 6146, 6535, 6691, 6738, 6753, 6846, 6857, 6991, 7044, 7192, 7360, 7444, 7557, 7645, 7827, 8359, 8506, 8742, 8748, 8790:
        strValue = "YAN"
        break
    case 6564, 6683, 7630, 7640, 7706, 8253, 8717:
        strValue = "YANG"
        break
    case 5618, 5619, 6326, 6542, 6570, 7159, 7182, 7235, 7387, 7455, 7540, 7902, 8046, 8126, 8477, 8705:
        strValue = "YAO"
        break
    case 5644, 5843, 5894, 6262, 7442, 7639, 7884:
        strValue = "YE"
        break
    case 5655, 5657, 5670, 5693, 5711, 5817, 5961, 5992, 6018, 6051, 6072, 6218, 6236, 6240, 6258, 6314, 6329, 6355, 6362, 6441, 6470, 6527, 6558, 6602, 6634, 6688, 6689, 6708, 6884, 6938, 7068, 7143, 7376, 7383, 7461, 7629, 7658, 7784, 7838, 7955, 7978, 8074, 8089, 8115, 8120, 8270, 8415, 8464, 8472, 8493, 8780:
        strValue = "YI"
        break
    case 5623, 5920, 5983, 6007, 6065, 6337, 6419, 6594, 6625, 6806, 7519, 7887, 8111, 8230, 8615, 8624:
        strValue = "YIN"
        break
    case 5788, 5911, 6067, 6094, 6126, 6151, 6186, 6292, 6451, 6663, 6862, 6875, 6913, 7188, 7212, 7326, 7584, 8048, 8108, 8203, 8331:
        strValue = "YING"
        break
    case 6401:
        strValue = "YO"
        break
    case 5724, 5953, 6013, 6415, 6728, 7163, 7962, 8014, 8711, 8751:
        strValue = "YONG"
        break
    case 5653, 5692, 5707, 6112, 6115, 6121, 6347, 6483, 6922, 7254, 7364, 7527, 7880, 8064, 8236, 8242, 8286, 8647, 8778, 8788:
        strValue = "YOU"
        break
    case 5614, 5625, 5681, 5722, 5836, 5845, 6139, 6187, 6277, 6484, 6486, 6546, 6592, 6632, 6637, 6655, 6748, 6987, 6993, 7005, 7090, 7204, 7437, 7476, 7573, 7603, 7622, 7647, 7659, 7718, 7858, 8033, 8054, 8085, 8086, 8130, 8133, 8266, 8285, 8336, 8407, 8408, 8607, 8625:
        strValue = "YU"
        break
    case 5989, 6011, 6282, 6768, 7034, 7205, 7358, 7528, 7783, 8016, 8302, 8378, 8629:
        strValue = "YUAN"
        break
    case 5763, 6914, 7348, 7530, 7865:
        strValue = "YUE"
        break
    case 5909, 6031, 6581, 6702, 6719, 7101, 7225, 7370, 7432, 7521, 7657:
        strValue = "YUN"
        break
    case 6257, 6338:
        strValue = "ZA"
        break
    case 6544, 7162:
        strValue = "ZAI"
        break
    case 7222, 7435, 8402, 8456, 8485, 8641:
        strValue = "ZAN"
        break
    case 6242, 7064, 7416:
        strValue = "ZANG"
        break
    case 6380:
        strValue = "ZAO"
        break
    case 5638, 8369, 5651, 6385, 6493, 6937, 7430, 8348, 8423:
        strValue = "ZE"
        break
        //            strValue = "ZEI"
    //            break
    case 5858:
        strValue = "ZEN"
        break
    case 7153, 7421, 7832, 7913:
        strValue = "ZENG"
        break
    case 6610, 6274, 6324, 6369, 6378, 7736, 8068, 8238, 8794:
        strValue = "ZHA"
        break
    case 7746, 8109:
        strValue = "ZHAI"
        break
    case 5862, 6288, 7625:
        strValue = "ZHAN"
        break
    case 5675, 5921, 6504, 6554, 6615, 7049, 7216, 8315:
        strValue = "ZHANG"
        break
    case 5815, 7294, 7840, 8341:
        strValue = "ZHAO"
        break
    case 5856, 6301, 7247, 7392, 7761, 8049, 8162, 8256, 8487:
        strValue = "ZHE"
        break
    case 5958, 6172, 6805, 7139, 7269, 7327, 7384, 7466, 7551, 7562, 7685, 7819, 8001, 8018, 8380:
        strValue = "ZHEN"
        break
    case 5826, 6531, 6571, 7859, 7903, 8361:
        strValue = "ZHENG"
        break
    case 5620, 5876, 5904, 5990, 6038, 6293, 6489, 6669, 6973, 6975, 7079, 7246, 7255, 7257, 7268, 7382, 7389, 7462, 7553, 7589, 7677, 7683, 7773, 7984, 8026, 8075, 8246, 8474, 8505, 8537, 8557, 8560, 8584, 8603:
        strValue = "ZHI"
        break
    case 5803, 7981, 8314, 8417, 8564:
        strValue = "ZHONG"
        break
    case 6107, 6390, 7008, 7091, 7107, 7548, 7756, 8406, 8492:
        strValue = "ZHOU"
        break
    case 5689, 5710, 5905, 6049, 6079, 6808, 6830, 6883, 7244, 7338, 7345, 7636, 7889, 8070, 8081, 8335, 8371, 8422, 8467, 8578, 8770:
        strValue = "ZHU"
        break
        //            strValue = "ZHUA"
        //            break
        //            strValue = "ZHUAI"
    //            break
    case 6389, 6645, 8207:
        strValue = "ZHUAN"
        break
    case 5755:
        strValue = "ZHUANG"
        break
    case 6723, 7077, 7136:
        strValue = "ZHUI"
        break
    case 7538, 8124:
        strValue = "ZHUN"
        break
    case 5730, 5834, 6310, 6823, 6835, 6910, 7644, 7690, 7729, 7977:
        strValue = "ZHUO"
        break
    case 5849, 6549, 7002, 7060, 7127, 7287, 7402, 7463, 7707, 7786, 7937, 7986, 8172, 8342, 8450, 8484, 8594, 8604, 8623, 8686, 8758:
        strValue = "ZI"
        break
    case 5744, 7574, 8453:
        strValue = "ZONG"
        break
    case 5833, 5878, 5924, 7067, 8677:
        strValue = "ZOU"
        break
    case 5762, 6147, 7963:
        strValue = "ZU"
        break
    case 6312, 7158, 8582:
        strValue = "ZUAN"
        break
    case 6209:
        strValue = "ZUI"
        break
    case 6304, 7355, 8714:
        strValue = "ZUN"
        break
    case 5872, 6382, 6460, 6684, 7549, 7681:
        strValue = "ZUO"
        break
    default:
        if(nCode >= 1601 && nCode <= 1602)
        {
            strValue = "A"
            break
        }
        if(nCode >= 1603 && nCode <= 1615)
        {
            strValue = "AI"
            break
        }
        if(nCode >= 1616 && nCode <= 1624)
        {
            strValue = "AN"
            break
        }
        if(nCode >= 1625 && nCode <= 1627)
        {
            strValue = "ANG"
            break
        }
        if(nCode >= 1628 && nCode <= 1636)
        {
            strValue = "AO"
            break
        }
        if(nCode >= 1637 && nCode <= 1654)
        {
            strValue = "BA"
            break
        }
        if(nCode >= 1655 && nCode <= 1662)
        {
            strValue = "BAI"
            break
        }
        if(nCode >= 1663 && nCode <= 1677)
        {
            strValue = "BAN"
            break
        }
        if(nCode >= 1678 && nCode <= 1689)
        {
            strValue = "BANG"
            break
        }
        if(nCode >= 1690 && nCode <= 1712)
        {
            strValue = "BAO"
            break
        }
        if(nCode >= 1713 && nCode <= 1727)
        {
            strValue = "BEI"
            break
        }
        if(nCode >= 1728 && nCode <= 1731)
        {
            strValue = "BEN"
            break
        }
        if(nCode >= 1732 && nCode <= 1737)
        {
            strValue = "BENG"
            break
        }
        if(nCode>1738 && nCode <= 1761)
        {
            strValue = "BI"
            break
        }
        if(nCode >= 1762 && nCode <= 1773)
        {
            strValue = "BIAN"
            break
        }
        if(nCode >= 1774 && nCode <= 1777)
        {
            strValue = "BIAO"
            break
        }
        if(nCode >= 1778 && nCode <= 1781)
        {
            strValue = "BIE"
            break
        }
        if(nCode >= 1782 && nCode <= 1787)
        {
            strValue = "BIN"
            break
        }
        if(nCode >= 1788 && nCode <= 1794)
        {
            strValue = "BING"
            break
        }
        if(nCode >= 1801 && nCode <= 1802)
        {
            strValue = "BING"
            break
        }
        if(nCode >= 1803 && nCode <= 1821)
        {
            strValue = "BO"
            break
        }
        if(nCode >= 1822 && nCode <= 1832)
        {
            strValue = "BU"
            break
        }
        if(nCode==1833)
        {
            strValue = "CA"
            break
        }
        if(nCode >= 1834 && nCode <= 1844)
        {
            strValue = "CAI"
            break
        }
        if(nCode >= 1845 && nCode <= 1851)
        {
            strValue = "CAN"
            break
        }
        if(nCode >= 1852 && nCode <= 1856)
        {
            strValue = "CANG"
            break
        }
        if(nCode >= 1857 && nCode <= 1861)
        {
            strValue = "CAO"
            break
        }
        if(nCode >= 1862 && nCode <= 1866)
        {
            strValue = "CE"
            break
        }
        if(nCode >= 1867 && nCode <= 1868)
        {
            strValue = "CENG"
            break
        }
        if(nCode >= 1869 && nCode <= 1879)
        {
            strValue = "CHA"
            break
        }
        if(nCode >= 1880 && nCode <= 1882)
        {
            strValue = "CHAI"
            break
        }
        if(nCode >= 1883 && nCode <= 1892)
        {
            strValue = "CHAN"
            break
        }
        if(nCode >= 1893 && nCode <= 1911)
        {
            strValue = "CHANG"
            break
        }
        if(nCode >= 1912 && nCode <= 1920)
        {
            strValue = "CHAO"
            break
        }
        if(nCode >= 1921 && nCode <= 1926)
        {
            strValue = "CHE"
            break
        }
        if(nCode >= 1927 && nCode <= 1936)
        {
            strValue = "CHEN"
            break
        }
        if(nCode >= 1937 && nCode <= 1951)
        {
            strValue = "CHENG"
            break
        }
        if(nCode >= 1952 && nCode <= 1967)
        {
            strValue = "CHI"
            break
        }
        if(nCode >= 1968 && nCode <= 1972)
        {
            strValue = "CHONG"
            break
        }
        if(nCode >= 1973 && nCode <= 1984)
        {
            strValue = "CHOU"
            break
        }
        if(nCode >= 1985 && nCode <= 2006)
        {
            strValue = "CHU"
            break
        }
        if(nCode==2007)
        {
            strValue = "CHUAI"
            break
        }
        if(nCode >= 2008 && nCode <= 2014)
        {
            strValue = "CHUAN"
            break
        }
        if(nCode >= 2015 && nCode <= 2020)
        {
            strValue = "CHUANG"
            break
        }
        if(nCode >= 2021 && nCode <= 2025)
        {
            strValue = "CHUI"
            break
        }
        if(nCode >= 2026 && nCode <= 2032)
        {
            strValue = "CHUN"
            break
        }
        if(nCode >= 2033 && nCode <= 2034)
        {
            strValue = "CHUO"
            break
        }
        if(nCode >= 2035 && nCode <= 2046)
        {
            strValue = "CI"
            break
        }
        if(nCode >= 2047 && nCode <= 2052)
        {
            strValue = "CONG"
            break
        }
        if(nCode >= 2054 && nCode <= 2057)
        {
            strValue = "CU"
            break
        }
        if(nCode >= 2058 && nCode <= 2060)
        {
            strValue = "CUAN"
            break
        }
        if(nCode >= 2061 && nCode <= 2068)
        {
            strValue = "CUI"
            break
        }
        if(nCode >= 2069 && nCode <= 2071)
        {
            strValue = "CUN"
            break
        }
        if(nCode >= 2072 && nCode <= 2077)
        {
            strValue = "CUO"
            break
        }
        if(nCode >= 2078 && nCode <= 2083)
        {
            strValue = "DA"
            break
        }
        if(nCode >= 2084 && nCode <= 2094)
        {
            strValue = "DAI"
            break
        }
        if(nCode >= 2102 && nCode <= 2116)
        {
            strValue = "DAN"
            break
        }
        if(nCode >= 2117 && nCode <= 2121)
        {
            strValue = "DANG"
            break
        }
        if(nCode >= 2122 && nCode <= 2133)
        {
            strValue = "DAO"
            break
        }
        if(nCode >= 2134 && nCode <= 2136)
        {
            strValue = "DE"
            break
        }
        if(nCode >= 2137 && nCode <= 2143)
        {
            strValue = "DENG"
            break
        }
        if(nCode >= 2144 && nCode <= 2162)
        {
            strValue = "DI"
            break
        }
        if(nCode >= 2163 && nCode <= 2178)
        {
            strValue = "DIAN"
            break
        }
        if(nCode >= 2179 && nCode <= 2187)
        {
            strValue = "DIAO"
            break
        }
        if(nCode >= 2188 && nCode <= 2194)
        {
            strValue = "DIE"
            break
        }
        if(nCode >= 2201 && nCode <= 2209)
        {
            strValue = "DING"
            break
        }
        if(nCode==2210)
        {
            strValue = "DIU"
            break
        }
        if(nCode >= 2211 && nCode <= 2220)
        {
            strValue = "DONG"
            break
        }
        if(nCode >= 2221 && nCode <= 2227)
        {
            strValue = "DOU"
            break
        }
        if(nCode >= 2228 && nCode <= 2242)
        {
            strValue = "DU"
            break
        }
        if(nCode >= 2243 && nCode <= 2248)
        {
            strValue = "DUAN"
            break
        }
        if(nCode >= 2249 && nCode <= 2252)
        {
            strValue = "DUI"
            break
        }
        if(nCode >= 2253 && nCode <= 2261)
        {
            strValue = "DUN"
            break
        }
        if(nCode >= 2262 && nCode <= 2273)
        {
            strValue = "DUO"
            break
        }
        if(nCode >= 2274 && nCode <= 2286)
        {
            strValue = "E"
            break
        }
        if(nCode==2287)
        {
            strValue = "EN"
            break
        }
        if(nCode >= /* DISABLES CODE */ (2288) && nCode <= 2231)
        {
            strValue = "ER"
            break
        }
        if(nCode >= 2302 && nCode <= 2309)
        {
            strValue = "FA"
            break
        }
        if(nCode >= 2310 && nCode <= 2326)
        {
            strValue = "FAN"
            break
        }
        if(nCode >= 2327 && nCode <= 2337)
        {
            strValue = "FANG"
            break
        }
        if(nCode >= 2338 && nCode <= 2349)
        {
            strValue = "FEI"
            break
        }
        if(nCode >= 2350 && nCode <= 2364)
        {
            strValue = "FEN"
            break
        }
        if(nCode >= 2365 && nCode <= 2379)
        {
            strValue = "FENG"
            break
        }
        if(nCode==2380)
        {
            strValue = "FO"
            break
        }
        if(nCode==2381)
        {
            strValue = "FOU"
            break
        }
        if(nCode >= 2382 && nCode <= 2432)
        {
            strValue = "FU"
            break
        }
        if(nCode >= 2435 && nCode <= 2440)
        {
            strValue = "GAI"
            break
        }
        if(nCode >= 2441 && nCode <= 2451)
        {
            strValue = "GAN"
            break
        }
        if(nCode >= 2452 && nCode <= 2460)
        {
            strValue = "GANG"
            break
        }
        if(nCode >= 2461 && nCode <= 2470)
        {
            strValue = "GAO"
            break
        }
        if(nCode >= 2471 && nCode <= 2487)
        {
            strValue = "GE"
            break
        }
        if(nCode==2488)
        {
            strValue = "GEI"
            break
        }
        if(nCode >= 2489 && nCode <= 2490)
        {
            strValue = "GEN"
            break
        }
        if(nCode >= 2491 && nCode <= 2503)
        {
            strValue = "GENG"
            break
        }
        if(nCode >= 2504 && nCode <= 2518)
        {
            strValue = "GONG"
            break
        }
        if(nCode >= 2519 && nCode <= 2527)
        {
            strValue = "GOU"
            break
        }
        if(nCode >= 2528 && nCode <= 2545)
        {
            strValue = "GU"
            break
        }
        if(nCode >= 2546 && nCode <= 2551)
        {
            strValue = "GUA"
            break
        }
        if(nCode >= 2552 && nCode <= 2554)
        {
            strValue = "GUAI"
            break
        }
        if(nCode >= 2555 && nCode <= 2565)
        {
            strValue = "GUAN"
            break
        }
        if(nCode >= 2566 && nCode <= 2568)
        {
            strValue = "GUANG"
            break
        }
        if(nCode >= 2569 && nCode <= 2584)
        {
            strValue = "GUI"
            break
        }
        if(nCode >= 2585 && nCode <= 2587)
        {
            strValue = "GUN"
            break
        }
        if(nCode >= 2588 && nCode <= 2593)
        {
            strValue = "GUO"
            break
        }
        if(nCode==2594)
        {
            strValue = "HA"
            break
        }
        if(nCode >= 2601 && nCode <= 2607)
        {
            strValue = "HAI"
            break
        }
        if(nCode >= 2608 && nCode <= 2626)
        {
            strValue = "HAN"
            break
        }
        if(nCode >= 2627 && nCode <= 2629)
        {
            strValue = "HANG"
            break
        }
        if(nCode >= 2630 && nCode <= 2638)
        {
            strValue = "HAO"
            break
        }
        if(nCode >= 2639 && nCode <= 2656)
        {
            strValue = "HE"
            break
        }
        if(nCode >= 2657 && nCode <= 2658)
        {
            strValue = "HEI"
            break
        }
        if(nCode >= 2659 && nCode <= 2662)
        {
            strValue = "HEN"
            break
        }
        if(nCode >= 2663 && nCode <= 2667)
        {
            strValue = "HENG"
            break
        }
        if(nCode >= 2668 && nCode <= 2676)
        {
            strValue = "HONG"
            break
        }
        if(nCode >= 2677 && nCode <= 2683)
        {
            strValue = "HOU"
            break
        }
        if(nCode >= 2684 && nCode <= 2707)
        {
            strValue = "HU"
            break
        }
        if(nCode >= 2708 && nCode <= 2716)
        {
            strValue = "HUA"
            break
        }
        if(nCode >= 2717 && nCode <= 2721)
        {
            strValue = "HUAI"
            break
        }
        if(nCode >= 2722 && nCode <= 2735)
        {
            strValue = "HUAN"
            break
        }
        if(nCode >= 2736 && nCode <= 2749)
        {
            strValue = "HUANG"
            break
        }
        if(nCode >= 2750 && nCode <= 2770)
        {
            strValue = "HUI"
            break
        }
        if(nCode >= 2771 && nCode <= 2776)
        {
            strValue = "HUN"
            break
        }
        if(nCode >= 2777 && nCode <= 2786)
        {
            strValue = "HUO"
            break
        }
        if(nCode >= 2787 && nCode <= 2845)
        {
            strValue = "JI"
            break
        }
        if(nCode >= 2846 && nCode <= 2862)
        {
            strValue = "JIA"
            break
        }
        if(nCode >= 2863 && nCode <= 2908)
        {
            strValue = "JIAN"
            break
        }
        if(nCode >= 2909 && nCode <= 2921)
        {
            strValue = "JIANG"
            break
        }
        if(nCode >= 2922 && nCode <= 2949)
        {
            strValue = "JIAO"
            break
        }
        if(nCode >= 2950 && nCode <= 2976)
        {
            strValue = "JIE"
            break
        }
        if(nCode >= 2977 && nCode <= 3002)
        {
            strValue = "JIN"
            break
        }
        if(nCode >= 3003 && nCode <= 3027)
        {
            strValue = "JING"
            break
        }
        if(nCode >= 3028 && nCode <= 3029)
        {
            strValue = "JIONG"
            break
        }
        if(nCode >= 3030 && nCode <= 3046)
        {
            strValue = "JIU"
            break
        }
        if(nCode >= 3047 && nCode <= 3071)
        {
            strValue = "JU"
            break
        }
        if(nCode >= 3072 && nCode <= 3078)
        {
            strValue = "JUAN"
            break
        }
        if(nCode >= 3079 && nCode <= 3088)
        {
            strValue = "JUE"
            break
        }
        if(nCode >= 3089 && nCode <= 3105)
        {
            strValue = "JUN"
            break
        }
        if(nCode >= 3106 && nCode <= 3109)
        {
            strValue = "KA"
            break
        }
        if(nCode >= 3110 && nCode <= 3114)
        {
            strValue = "KAI"
            break
        }
        if(nCode >= 3115 && nCode <= 3120)
        {
            strValue = "KAN"
            break
        }
        if(nCode >= 3121 && nCode <= 3127)
        {
            strValue = "KANG"
            break
        }
        if(nCode >= 3128 && nCode <= 3131)
        {
            strValue = "KAO"
            break
        }
        if(nCode >= 3132 && nCode <= 3146)
        {
            strValue = "KE"
            break
        }
        if(nCode >= 3147 && nCode <= 3150)
        {
            strValue = "KEN"
            break
        }
        if(nCode >= 3151 && nCode <= 3152)
        {
            strValue = "KENG"
            break
        }
        if(nCode >= 3153 && nCode <= 3156)
        {
            strValue = "KONG"
            break
        }
        if(nCode >= 3157 && nCode <= 3160)
        {
            strValue = "KOU"
            break
        }
        if(nCode >= 3161 && nCode <= 3167)
        {
            strValue = "KU"
            break
        }
        if(nCode >= 3168 && nCode <= 3172)
        {
            strValue = "KUA"
            break
        }
        if(nCode >= 3173 && nCode <= 3176)
        {
            strValue = "KUAI"
            break
        }
        if(nCode >= 3177 && nCode <= 3178)
        {
            strValue = "KUAN"
            break
        }
        if(nCode >= 3179 && nCode <= 3186)
        {
            strValue = "KUANG"
            break
        }
        if(nCode >= 3187 && nCode <= 3203)
        {
            strValue = "KUI"
            break
        }
        if(nCode >= 3204 && nCode <= 3207)
        {
            strValue = "KUN"
            break
        }
        if(nCode >= 3208 && nCode <= 3211)
        {
            strValue = "KUO"
            break
        }
        if(nCode >= 3212 && nCode <= 3218)
        {
            strValue = "LA"
            break
        }
        if(nCode >= 3219 && nCode <= 3221)
        {
            strValue = "LAI"
            break
        }
        if(nCode >= 3222 && nCode <= 3236)
        {
            strValue = "LAN"
            break
        }
        if(nCode >= 3237 && nCode <= 3243)
        {
            strValue = "LANG"
            break
        }
        if(nCode >= 3244 && nCode <= 3252)
        {
            strValue = "LAO"
            break
        }
        if(nCode >= 3253 && nCode <= 3254)
        {
            strValue = "LE"
            break
        }
        if(nCode >= 3255 && nCode <= 3265)
        {
            strValue = "LEI"
            break
        }
        if(nCode >= 3266 && nCode <= 3268)
        {
            strValue = "LENG"
            break
        }
        if(nCode >= 3269 && nCode <= 3308)
        {
            strValue = "LI"
        }
        if(nCode==3309)
        {
            strValue = "LIA"
            break
        }
        if(nCode >= 3310 && nCode <= 3323)
        {
            strValue = "LIAN"
            break
        }
        if(nCode >= 3324 && nCode <= 3334)
        {
            strValue = "LIANG"
            break
        }
        if(nCode >= 3335 && nCode <= 3347)
        {
            strValue = "LIAO"
            break
        }
        if(nCode >= 3348 && nCode <= 3352)
        {
            strValue = "LIE"
            break
        }
        if(nCode >= 3353 && nCode <= 3363)
        {
            strValue = "LIN"
            break
        }
        if(nCode >= 3364 && nCode <= 3378)
        {
            strValue = "LING"
            break
        }
        if(nCode >= 3379 && nCode <= 3389)
        {
            strValue = "LIU"
            break
        }
        if(nCode >= 3390 && nCode <= 3404)
        {
            strValue = "LONG"
            break
        }
        if(nCode >= 3405 && nCode <= 3410)
        {
            strValue = "LOU"
            break
        }
        if(nCode >= 3411 && nCode <= 3444)
        {
            strValue = "LU"
            break
        }
        if(nCode >= 3445 && nCode <= 3450)
        {
            strValue = "LUAN"
            break
        }
        if(nCode >= 3451 && nCode <= 3452)
        {
            strValue = "LUE"
            break
        }
        if(nCode >= 3453 && nCode <= 3459)
        {
            strValue = "LUN"
            break
        }
        if(nCode >= 3460 && nCode <= 3471)
        {
            strValue = "LUO"
            break
        }
        if(nCode >= 3472 && nCode <= 3480)
        {
            strValue = "MA"
            break
        }
        if(nCode >= 3481 && nCode <= 3486)
        {
            strValue = "MAI"
            break
        }
        if(nCode >= 3487 && nCode <= 3501)
        {
            strValue = "MAN"
            break
        }
        if(nCode >= 3502 && nCode <= 3507)
        {
            strValue = "MANG"
            break
        }
        if(nCode >= 3508 && nCode <= 3519)
        {
            strValue = "MAO"
            break
        }
        if(nCode==3520)
        {
            strValue = "ME"
            break
        }
        if(nCode >= 3521 && nCode <= 3536)
        {
            strValue = "MEI"
            break
        }
        if(nCode >= 3537 && nCode <= 3539)
        {
            strValue = "MEN"
            break
        }
        if(nCode >= 3540 && nCode <= 3547)
        {
            strValue = "MENG"
            break
        }
        if(nCode >= 3548 && nCode <= 3561)
        {
            strValue = "MI"
        }
        if(nCode >= 3562 && nCode <= 3570)
        {
            strValue = "MIAN"
            break
        }
        if(nCode >= 3571 && nCode <= 3578)
        {
            strValue = "MIAO"
            break
        }
        if(nCode >= 3579 && nCode <= 3580)
        {
            strValue = "MIE"
            break
        }
        if(nCode >= 3581 && nCode <= 3586)
        {
            strValue = "MIN"
            break
        }
        if(nCode >= 3587 && nCode <= 3592)
        {
            strValue = "MING"
            break
        }
        if(nCode==3593)
        {
            strValue = "MIU"
            break
        }
        if(nCode >= 3594 && nCode <= 3616)
        {
            strValue = "MO"
            break
        }
        if(nCode >= 3617 && nCode <= 3619)
        {
            strValue = "MOU"
            break
        }
        if(nCode >= 3620 && nCode <= 3634)
        {
            strValue = "MU"
            break
        }
        if(nCode >= 3635 && nCode <= 3641)
        {
            strValue = "NA"
            break
        }
        if(nCode >= 3642 && nCode <= 3646)
        {
            strValue = "NAI"
            break
        }
        if(nCode >= 3647 && nCode <= 3649)
        {
            strValue = "NAN"
            break
        }
        if(nCode==3650)
        {
            strValue = "NANG"
            break
        }
        if(nCode >= 3651 && nCode <= 3655)
        {
            strValue = "NAO"
            break
        }
        if(nCode==3656)
        {
            strValue = "NE"
            break
        }
        if(nCode >= 3657 && nCode <= 3658)
        {
            strValue = "NEI"
            break
        }
        if(nCode==3659)
        {
            strValue = "NEN"
            break
        }
        if(nCode==3660)
        {
            strValue = "NENG"
            break
        }
        if(nCode >= 3661 && nCode <= 3671)
        {
            strValue = "NI"
            break
        }
        if(nCode >= 3672 && nCode <= 3678)
        {
            strValue = "NIAN"
            break
        }
        if(nCode >= 3679 && nCode <= 3680)
        {
            strValue = "NIANG"
            break
        }
        if(nCode >= 3681 && nCode <= 3682)
        {
            strValue = "NIAO"
            break
        }
        if(nCode >= 3683 && nCode <= 3689)
        {
            strValue = "NIE"
            break
        }
        if(nCode==3690)
        {
            strValue = "NIN"
            break
        }
        if(nCode >= 3691 && nCode <= 3702)
        {
            strValue = "NING"
            break
        }
        if(nCode >= 3703 && nCode <= 3706)
        {
            strValue = "NIU"
            break
        }
        if(nCode >= 3707 && nCode <= 3710)
        {
            strValue = "NONG"
            break
        }
        if(nCode >= 3711 && nCode <= 3714)
        {
            strValue = "NU"
            break
        }
        if(nCode==3715)
        {
            strValue = "NUAN"
            break
        }
        if(nCode >= 3716 && nCode <= 3717)
        {
            strValue = "NUE"
            break
        }
        if(nCode >= 3718 && nCode <= 3721)
        {
            strValue = "NUO"
            break
        }
        if(nCode==3722)
        {
            strValue = "O"
            break
        }
        if(nCode >= 3723 && nCode <= 3729)
        {
            strValue = "OU"
            break
        }
        if(nCode >= 3730 && nCode <= 3735)
        {
            strValue = "PA"
            break
        }
        if(nCode >= 3736 && nCode <= 3741)
        {
            strValue = "PAI"
            break
        }
        if(nCode >= 3742 && nCode <= 3749)
        {
            strValue = "PAN"
            break
        }
        if(nCode >= 3750 && nCode <= 3754)
        {
            strValue = "PANG"
            break
        }
        if(nCode >= 3755 && nCode <= 3761)
        {
            strValue = "PAO"
            break
        }
        if(nCode >= 3762 && nCode <= 3770)
        {
            strValue = "PEI"
            break
        }
        if(nCode >= 3771 && nCode <= 3772)
        {
            strValue = "PEN"
            break
        }
        if(nCode >= 3773 && nCode <= 3786)
        {
            strValue = "PENG"
            break
        }
        if(nCode >= 3787 && nCode <= 3809)
        {
            strValue = "PI"
            break
        }
        if(nCode >= 3810 && nCode <= 3813)
        {
            strValue = "PIAN"
            break
        }
        if(nCode >= 3814 && nCode <= 3817)
        {
            strValue = "PIAO"
            break
        }
        if(nCode >= 3818 && nCode <= 3819)
        {
            strValue = "PIE"
            break
        }
        if(nCode >= 3820 && nCode <= 3824)
        {
            strValue = "PIN"
            break
        }
        if(nCode >= 3825 && nCode <= 3833)
        {
            strValue = "PING"
            break
        }
        if(nCode >= 3834 && nCode <= 3841)
        {
            strValue = "PO"
            break
        }
        if(nCode==3842)
        {
            strValue = "POU"
            break
        }
        if(nCode >= 3843 && nCode <= 3857)
        {
            strValue = "PU"
            break
        }
        if(nCode >= 3858 && nCode <= 3893)
        {
            strValue = "QI"
            break
        }
        if(nCode==3894||(nCode >= 3901 && nCode <= 3902))
        {
            strValue = "QIA"
            break
        }
        if(nCode >= 3903 && nCode <= 3924)
        {
            strValue = "QIAN"
            break
        }
        if(nCode >= 3925 && nCode <= 3932)
        {
            strValue = "QIANG"
            break
        }
        if(nCode >= 3933 && nCode <= 3947)
        {
            strValue = "QIAO"
            break
        }
        if(nCode >= 3948 && nCode <= 3952)
        {
            strValue = "QIE"
            break
        }
        if(nCode >= 3953 && nCode <= 3963)
        {
            strValue = "QIN"
            break
        }
        if(nCode >= 3964 && nCode <= 3976)
        {
            strValue = "QING"
            break
        }
        if(nCode >= 3977 && nCode <= 3978)
        {
            strValue = "QIONG"
            break
        }
        if(nCode >= 3979 && nCode <= 3986)
        {
            strValue = "QIU"
            break
        }
        if(nCode >= 3987 && nCode <= 4005)
        {
            strValue = "QU"
            break
        }
        if(nCode >= 4006 && nCode <= 4016)
        {
            strValue = "QUAN"
            break
        }
        if(nCode >= 4017 && nCode <= 4024)
        {
            strValue = "QUE"
            break
        }
        if(nCode >= 4025 && nCode <= 4026)
        {
            strValue = "QUN"
            break
        }
        if(nCode >= 4027 && nCode <= 4030)
        {
            strValue = "RAN"
            break
        }
        if(nCode >= 4031 && nCode <= 4035)
        {
            strValue = "RANG"
        }
        if(nCode >= 4036 && nCode <= 4038)
        {
            strValue = "RAO"
            break
        }
        if(nCode >= 4039 && nCode <= 4040)
        {
            strValue = "RE"
            break
        }
        if(nCode >= 4041 && nCode <= 4050)
        {
            strValue = "REN"
            break
        }
        if(nCode >= 4051 && nCode <= 4052)
        {
            strValue = "RENG"
            break
        }
        if(nCode==4053)
        {
            strValue = "RI"
            break
        }
        if(nCode >= 4054 && nCode <= 4063)
        {
            strValue = "RONG"
            break
        }
        if(nCode >= 4064 && nCode <= 4066)
        {
            strValue = "ROU"
            break
        }
        if(nCode >= 4067 && nCode <= 4076)
        {
            strValue = "RU"
            break
        }
        if(nCode >= 4077 && nCode <= 4078)
        {
            strValue = "RUAN"
            break
        }
        if(nCode >= 4079 && nCode <= 4081)
        {
            strValue = "RUI"
            break
        }
        if(nCode >= 4082 && nCode <= 4083)
        {
            strValue = "RUN"
            break
        }
        if(nCode >= 4084 && nCode <= 4085)
        {
            strValue = "RUO"
            break
        }
        if(nCode >= 4086 && nCode <= 4088)
        {
            strValue = "SA"
            break
        }
        if(nCode >= 4089 && nCode <= 4092)
        {
            strValue = "SAI"
            break
        }
        if(nCode >= 4093 && nCode <= 4094)
        {
            strValue = "SAN"
            break
        }
        if(nCode >= 4101 && nCode <= 4102)
        {
            strValue = "SAN"
            break
        }
        if(nCode >= 4103 && nCode <= 4105)
        {
            strValue = "SANG"
            break
        }
        if(nCode >= 4106 && nCode <= 4109)
        {
            strValue = "SAO"
            break
        }
        if(nCode >= 4110 && nCode <= 4112)
        {
            strValue = "SE"
            break
        }
        if(nCode==4113)
        {
            strValue = "SEN"
        }
        if(nCode==4114)
        {
            strValue = "SENG"
            break
        }
        if(nCode >= 4115 && nCode <= 4123)
        {
            strValue = "SHA"
            break
        }
        if(nCode >= 4124 && nCode <= 4125)
        {
            strValue = "SHAI"
            break
        }
        if(nCode >= 4126 && nCode <= 4141)
        {
            strValue = "SHAN"
            break
        }
        if(nCode >= 4142 && nCode <= 4149)
        {
            strValue = "SHANG"
            break
        }
        if(nCode >= 4150 && nCode <= 4160)
        {
            strValue = "SHAO"
            break
        }
        if(nCode >= 4161 && nCode <= 4172)
        {
            strValue = "SHE"
            break
        }
        if(nCode >= 4173 && nCode <= 4188)
        {
            strValue = "SHEN"
            break
        }
        if(nCode >= 4189 && nCode <= 4205)
        {
            strValue = "SHENG"
            break
        }
        if(nCode >= 4206 && nCode <= 4252)
        {
            strValue = "SHI"
            break
        }
        if(nCode >= 4253 && nCode <= 4262)
        {
            strValue = "SHOU"
            break
        }
        if(nCode >= 4263 && nCode <= 4301)
        {
            strValue = "SHU"
            break
        }
        if(nCode >= 4302 && nCode <= 4303)
        {
            strValue = "SHUA"
            break
        }
        if(nCode >= 4304 && nCode <= 4307)
        {
            strValue = "SHUAI"
            break
        }
        if(nCode >= 4308 && nCode <= 4309)
        {
            strValue = "SHUAN"
            break
        }
        if(nCode >= 4310 && nCode <= 4312)
        {
            strValue = "SHUANG"
            break
        }
        if(nCode >= 4313 && nCode <= 4316)
        {
            strValue = "SHUI"
            break
        }
        if(nCode >= 4317 && nCode <= 4320)
        {
            strValue = "SHUN"
            break
        }
        if(nCode >= 4321 && nCode <= 4324)
        {
            strValue = "SHUO"
            break
        }
        if(nCode >= 4325 && nCode <= 4340)
        {
            strValue = "SI"
            break
        }
        if(nCode >= 4341 && nCode <= 4348)
        {
            strValue = "SONG"
            break
        }
        if(nCode >= 4349 && nCode <= 4352)
        {
            strValue = "SOU"
            break
        }
        if(nCode >= 4353 && nCode <= 4364)
        {
            strValue = "SU"
            break
        }
        if(nCode >= 4365 && nCode <= 4367)
        {
            strValue = "SUAN"
            break
        }
        if(nCode >= 4368 && nCode <= 4378)
        {
            strValue = "SUI"
            break
        }
        if(nCode >= 4379 && nCode <= 4381)
        {
            strValue = "SUN"
            break
        }
        if(nCode >= 4382 && nCode <= 4389)
        {
            strValue = "SUO"
            break
        }
        if(nCode >= 4390 && nCode <= 4404)
        {
            strValue = "TA"
            break
        }
        if(nCode >= 4405 && nCode <= 4413)
        {
            strValue = "TAI"
            break
        }
        if(nCode >= 4414 && nCode <= 4431)
        {
            strValue = "TAN"
            break
        }
        if(nCode >= 4432 && nCode <= 4444)
        {
            strValue = "TANG"
            break
        }
        if(nCode >= 4445 && nCode <= 4455)
        {
            strValue = "TAO"
            break
        }
        if(nCode==4456)
        {
            strValue = "TE"
            break
        }
        if(nCode >= 4457 && nCode <= 4460)
        {
            strValue = "TENG"
            break
        }
        if(nCode >= 4461 && nCode <= 4475)
        {
            strValue = "TI"
            break
        }
        if(nCode >= 4476 && nCode <= 4483)
        {
            strValue = "TIAN"
            break
        }
        if(nCode >= 4484 && nCode <= 4488)
        {
            strValue = "TIAO"
            break
        }
        if(nCode >= 4489 && nCode <= 4491)
        {
            strValue = "TIE"
            break
        }
        if(nCode >= 4492 && nCode <= 4507)
        {
            strValue = "TING"
            break
        }
        if(nCode >= 4508 && nCode <= 4520)
        {
            strValue = "TONG"
            break
        }
        if(nCode >= 4521 && nCode <= 4524)
        {
            strValue = "TOU"
            break
        }
        if(nCode >= 4525 && nCode <= 4535)
        {
            strValue = "TU"
            break
        }
        if(nCode >= 4536 && nCode <= 4537)
        {
            strValue = "TUAN"
            break
        }
        if(nCode >= 4538 && nCode <= 4543)
        {
            strValue = "TUI"
            break
        }
        if(nCode >= 4544 && nCode <= 4546)
        {
            strValue = "TUN"
            break
        }
        if(nCode >= 4547 && nCode <= 4557)
        {
            strValue = "TUO"
            break
        }
        if(nCode >= 4558 && nCode <= 4564)
        {
            strValue = "WA"
            break
        }
        if(nCode >= 4565 && nCode <= 4566)
        {
            strValue = "WAI"
            break
        }
        if(nCode >= 4567 && nCode <= 4583)
        {
            strValue = "WAN"
            break
        }
        if(nCode >= 4584 && nCode <= 4593)
        {
            strValue = "WANG"
            break
        }
        if(nCode >= 4594 && nCode <= 4632)
        {
            strValue = "WEI"
            break
        }
        if(nCode >= 4633 && nCode <= 4642)
        {
            strValue = "WEN"
            break
        }
        if(nCode >= 4643 && nCode <= 4645)
        {
            strValue = "WENG"
            break
        }
        if(nCode >= 4646 && nCode <= 4654)
        {
            strValue = "WO"
            break
        }
        if(nCode >= 4655 && nCode <= 4683)
        {
            strValue = "WU"
            break
        }
        if(nCode >= 4684 && nCode <= 4724)
        {
            strValue = "XI"
            break
        }
        if(nCode >= 4725 && nCode <= 4737)
        {
            strValue = "XIA"
            break
        }
        if(nCode >= 4738 && nCode <= 4763)
        {
            strValue = "XIAN"
            break
        }
        if(nCode >= 4764 && nCode <= 4783)
        {
            strValue = "XIANG"
            break
        }
        if(nCode >= 4784 && nCode <= 4807)
        {
            strValue = "XIAO"
            break
        }
        if(nCode >= 4809 && nCode <= 4828)
        {
            strValue = "XIE"
            break
        }
        if(nCode >= 4829 && nCode <= 4838)
        {
            strValue = "XIN"
            break
        }
        if(nCode >= 4839 && nCode <= 4853)
        {
            strValue = "XING"
            break
        }
        if(nCode >= 4854 && nCode <= 4860)
        {
            strValue = "XIONG"
            break
        }
        if(nCode >= 4861 && nCode <= 4869)
        {
            strValue = "XIU"
            break
        }
        if(nCode >= 4870 && nCode <= 4888)
        {
            strValue = "XU"
            break
        }
        if(nCode >= 4889 && nCode <= 4904)
        {
            strValue = "XUAN"
            break
        }
        if(nCode >= 4905 && nCode <= 4910)
        {
            strValue = "XUE"
            break
        }
        if(nCode >= 4911 && nCode <= 4924)
        {
            strValue = "XUN"
            break
        }
        if(nCode >= 4925 && nCode <= 4940)
        {
            strValue = "YA"
            break
        }
        if(nCode >= 4941 && nCode <= 4973)
        {
            strValue = "YAN"
            break
        }
        if(nCode >= 4974 && nCode <= 4990)
        {
            strValue = "YANG"
            break
        }
        if(nCode >= 4991 && nCode <= 5011)
        {
            strValue = "YAO"
            break
        }
        if(nCode >= 5012 && nCode <= 5026)
        {
            strValue = "YE"
            break
        }
        if(nCode >= 5027 && nCode <= 5079)
        {
            strValue = "YI"
            break
        }
        if(nCode >= 5080 && nCode <= 5101)
        {
            strValue = "YIN"
            break
        }
        if(nCode >= 5102 && nCode <= 5119)
        {
            strValue = "YING"
            break
        }
        if(nCode==5120)
        {
            strValue = "YO"
            break
        }
        if(nCode >= 5121 && nCode <= 5135)
        {
            strValue = "YONG"
            break
        }
        if(nCode >= 5136 && nCode <= 5155)
        {
            strValue = "YOU"
            break
        }
        if(nCode >= 5156 && nCode <= 5206)
        {
            strValue = "YU"
            break
        }
        if(nCode >= 5207 && nCode <= 5226)
        {
            strValue = "YUAN"
            break
        }
        if(nCode >= 5227 && nCode <= 5236)
        {
            strValue = "YUE"
            break
        }
        if(nCode >= 5237 && nCode <= 5248)
        {
            strValue = "YUN"
            break
        }
        if(nCode >= 5249 && nCode <= 5251)
        {
            strValue = "ZA"
            break
        }
        if(nCode >= 5252 && nCode <= 5258)
        {
            strValue = "ZAI"
            break
        }
        if(nCode >= 5259 && nCode <= 5262)
        {
            strValue = "ZAN"
            break
        }
        if(nCode >= 5263 && nCode <= 5265)
        {
            strValue = "ZANG"
            break
        }
        if(nCode >= 5266 && nCode <= 5279)
        {
            strValue = "ZAO"
            break
        }
        if(nCode >= 5280 && nCode <= 5283)
        {
            strValue = "ZE"
            break
        }
        if(nCode==5284)
        {
            strValue = "ZEI"
            break
        }
        if(nCode==5285)
        {
            strValue = "ZEN"
            break
        }
        if(nCode >= 5286 && nCode <= 5289)
        {
            strValue = "ZENG"
            break
        }
        if(nCode >= 5290 && nCode <= 5309)
        {
            strValue = "ZHA"
            break
        }
        if(nCode >= 5310 && nCode <= 5315)
        {
            strValue = "ZHAI"
            break
        }
        if(nCode >= 5316 && nCode <= 5332)
        {
            strValue = "ZHAN"
            break
        }
        if(nCode >= 5333 && nCode <= 5347)
        {
            strValue = "ZHANG"
            break
        }
        if(nCode >= 5348 && nCode <= 5357)
        {
            strValue = "ZHAO"
            break
        }
        if(nCode >= 5358 && nCode <= 5367)
        {
            strValue = "ZHE"
            break
        }
        if(nCode >= 5368 && nCode <= 5383)
        {
            strValue = "ZHEN"
            break
        }
        if(nCode >= 5384 && nCode <= 5404)
        {
            strValue = "ZHENG"
            break
        }
        if(nCode >= 5405 && nCode <= 5447)
        {
            strValue = "ZHI"
            break
        }
        if(nCode >= 5448 && nCode <= 5458)
        {
            strValue = "ZHONG"
            break
        }
        if(nCode >= 5459 && nCode <= 5472)
        {
            strValue = "ZHOU"
            break
        }
        if(nCode >= 5473 && nCode <= 5504)
        {
            strValue = "ZHU"
            break
        }
        if(nCode >= 5505 && nCode <= 5506)
        {
            strValue = "ZHUA"
            break
        }
        if(nCode==5507)
        {
            strValue = "ZHUAI"
            break
        }
        if(nCode >= 5508 && nCode <= 5513)
        {
            strValue = "ZHUAN"
            break
        }
        if(nCode >= 5514 && nCode <= 5520)
        {
            strValue = "ZHUANG"
            break
        }
        if(nCode >= 5521 && nCode <= 5526)
        {
            strValue = "ZHUI"
            break
        }
        if(nCode >= 5527 && nCode <= 5528)
        {
            strValue = "ZHUN"
            break
        }
        if(nCode >= 5529 && nCode <= 5539)
        {
            strValue = "ZHUO"
            break
        }
        if(nCode >= 5540 && nCode <= 5554)
        {
            strValue = "ZI"
            break
        }
        if(nCode >= 5555 && nCode <= 5561)
        {
            strValue = "ZONG"
            break
        }
        if(nCode >= 5562 && nCode <= 5565)
        {
            strValue = "ZOU"
            break
        }
        if(nCode >= 5566 && nCode <= 5573)
        {
            strValue = "ZU"
            break
        }
        if(nCode >= 5574 && nCode <= 5575)
        {
            strValue = "ZUAN"
            break
        }
        if(nCode >= 5576 && nCode <= 5579)
        {
            strValue = "ZUI"
            break
        }
        if(nCode >= 5580 && nCode <= 5581)
        {
            strValue = "ZUN"
            break
        }
        if(nCode >= 5582 && nCode <= 5589)
        {
            strValue = "ZUO"
            break
        }
    }
    return strValue
}

private let kFirstLetters = """
ydkqsxnwzssxjbymgcczqpssqbycdscdqldylybssjgyqzjjfgcclzznwdwzjljpfyynnjjtmynzwzhflzppqhgccyynmjqyxxgd
nnsnsjnjnsnnmlnrxyfsngnnnnqzggllyjlnyzssecykyyhqwjssggyxyqyjtwktjhychmnxjtlhjyqbyxdldwrrjnwysrldzjpc
bzjjbrcfslnczstzfxxchtrqggddlyccssymmrjcyqzpwwjjyfcrwfdfzqpyddwyxkyjawjffxjbcftzyhhycyswccyxsclcxxwz
cxnbgnnxbxlzsqsbsjpysazdhmdzbqbscwdzzyytzhbtsyyfzgntnxjywqnknphhlxgybfmjnbjhhgqtjcysxstkzglyckglysmz
xyalmeldccxgzyrjxjzlnjzcqkcnnjwhjczccqljststbnhbtyxceqxkkwjyflzqlyhjxspsfxlmpbysxxxytccnylllsjxfhjxp
jbtffyabyxbcczbzyclwlczggbtssmdtjcxpthyqtgjjxcjfzkjzjqnlzwlslhdzbwjncjzyzsqnycqynzcjjwybrtwpyftwexcs
kdzctbyhyzqyyjxzcfbzzmjyxxsdczottbzljwfckscsxfyrlrygmbdthjxsqjccsbxyytswfbjdztnbcnzlcyzzpsacyzzsqqcs
hzqydxlbpjllmqxqydzxsqjtzpxlcglqdcwzfhctdjjsfxjejjtlbgxsxjmyjjqpfzasyjnsydjxkjcdjsznbartcclnjqmwnqnc
lllkbdbzzsyhqcltwlccrshllzntylnewyzyxczxxgdkdmtcedejtsyyssdqdfmxdbjlkrwnqlybglxnlgtgxbqjdznyjsjyjcjm
rnymgrcjczgjmzmgxmmryxkjnymsgmzzymknfxmbdtgfbhcjhkylpfmdxlxjjsmsqgzsjlqdldgjycalcmzcsdjllnxdjffffjcn
fnnffpfkhkgdpqxktacjdhhzdddrrcfqyjkqccwjdxhwjlyllzgcfcqjsmlzpbjjblsbcjggdckkdezsqcckjgcgkdjtjllzycxk
lqccgjcltfpcqczgwbjdqyzjjbyjhsjddwgfsjgzkcjctllfspkjgqjhzzljplgjgjjthjjyjzccmlzlyqbgjwmljkxzdznjqsyz
mljlljkywxmkjlhskjhbmclyymkxjqlbmllkmdxxkwyxwslmlpsjqqjqxyqfjtjdxmxxllcrqbsyjbgwynnggbcnxpjtgpapfgdj
qbhbncfjyzjkjkhxqfgqckfhygkhdkllsdjqxpqyaybnqsxqnszswhbsxwhxwbzzxdmndjbsbkbbzklylxgwxjjwaqzmywsjqlsj
xxjqwjeqxnchetlzalyyyszzpnkyzcptlshtzcfycyxyljsdcjqagyslcllyyysslqqqnldxzsccscadycjysfsgbfrsszqsbxjp
sjysdrckgjlgtkzjzbdktcsyqpyhstcldjnhmymcgxyzhjdctmhltxzhylamoxyjcltyfbqqjpfbdfehthsqhzywwcncxcdwhowg
yjlegmdqcwgfjhcsntmydolbygnqwesqpwnmlrydzszzlyqpzgcwxhnxpyxshmdqjgztdppbfbhzhhjyfdzwkgkzbldnzsxhqeeg
zxylzmmzyjzgszxkhkhtxexxgylyapsthxdwhzydpxagkydxbhnhnkdnjnmyhylpmgecslnzhkxxlbzzlbmlsfbhhgsgyyggbhsc
yajtxglxtzmcwzydqdqmngdnllszhngjzwfyhqswscelqajynytlsxthaznkzzsdhlaxxtwwcjhqqtddwzbcchyqzflxpslzqgpz
sznglydqtbdlxntctajdkywnsyzljhhdzckryyzywmhychhhxhjkzwsxhdnxlyscqydpslyzwmypnkxyjlkchtyhaxqsyshxasmc
hkdscrsgjpwqsgzjlwwschsjhsqnhnsngndantbaalczmsstdqjcjktscjnxplggxhhgoxzcxpdmmhldgtybynjmxhmrzplxjzck
zxshflqxxcdhxwzpckczcdytcjyxqhlxdhypjqxnlsyydzozjnhhqezysjyayxkypdgxddnsppyzndhthrhxydpcjjhtcnnctlhb
ynyhmhzllnnxmylllmdcppxhmxdkycyrdltxjchhznxclcclylnzsxnjzzlnnnnwhyqsnjhxynttdkyjpychhyegkcwtwlgjrlgg
tgtygyhpyhylqyqgcwyqkpyyettttlhyylltyttsylnyzwgywgpydqqzzdqnnkcqnmjjzzbxtqfjkdffbtkhzkbxdjjkdjjtlbwf
zpptkqtztgpdwntpjyfalqmkgxbcclzfhzcllllanpnxtjklcclgyhdzfgyddgcyyfgydxkssendhykdndknnaxxhbpbyyhxccga
pfqyjjdmlxcsjzllpcnbsxgjyndybwjspcwjlzkzddtacsbkzdyzypjzqsjnkktknjdjgyepgtlnyqnacdntcyhblgdzhbbydmjr
egkzyheyybjmcdtafzjzhgcjnlghldwxjjkytcyksssmtwcttqzlpbszdtwcxgzagyktywxlnlcpbclloqmmzsslcmbjcsdzkydc
zjgqjdsmcytzqqlnzqzxssbpkdfqmddzzsddtdmfhtdycnaqjqkypbdjyyxtljhdrqxlmhkydhrnlklytwhllrllrcxylbnsrnzz
symqzzhhkyhxksmzsyzgcxfbnbsqlfzxxnnxkxwymsddyqnggqmmyhcdzttfgyyhgsbttybykjdnkyjbelhdypjqnfxfdnkzhqks
byjtzbxhfdsbdaswpawajldyjsfhblcnndnqjtjnchxfjsrfwhzfmdrfjyxwzpdjkzyjympcyznynxfbytfyfwygdbnzzzdnytxz
emmqbsqehxfznbmflzzsrsyqjgsxwzjsprytjsjgskjjgljjynzjjxhgjkymlpyyycxycgqzswhwlyrjlpxslcxmnsmwklcdnkny
npsjszhdzeptxmwywxyysywlxjqcqxzdclaeelmcpjpclwbxsqhfwrtfnjtnqjhjqdxhwlbyccfjlylkyynldxnhycstyywncjtx
ywtrmdrqnwqcmfjdxzmhmayxnwmyzqtxtlmrspwwjhanbxtgzypxyyrrclmpamgkqjszycymyjsnxtplnbappypylxmyzkynldgy
jzcchnlmzhhanqnbgwqtzmxxmllhgdzxnhxhrxycjmffxywcfsbssqlhnndycannmtcjcypnxnytycnnymnmsxndlylysljnlxys
sqmllyzlzjjjkyzzcsfbzxxmstbjgnxnchlsnmcjscyznfzlxbrnnnylmnrtgzqysatswryhyjzmgdhzgzdwybsscskxsyhytsxg
cqgxzzbhyxjscrhmkkbsczjyjymkqhzjfnbhmqhysnjnzybknqmcjgqhwlsnzswxkhljhyybqcbfcdsxdldspfzfskjjzwzxsddx
jseeegjscssygclxxnwwyllymwwwgydkzjggggggsycknjwnjpcxbjjtqtjwdsspjxcxnzxnmelptfsxtllxcljxjjljsxctnswx
lennlyqrwhsycsqnybyaywjejqfwqcqqcjqgxaldbzzyjgkgxbltqyfxjltpydkyqhpmatlcndnkxmtxynhklefxdllegqtymsaw
hzmljtkynxlyjzljeeyybqqffnlyxhdsctgjhxywlkllxqkcctnhjlqmkkzgcyygllljdcgydhzwypysjbzjdzgyzzhywyfqdtyz
szyezklymgjjhtsmqwyzljyywzcsrkqyqltdxwcdrjalwsqzwbdcqyncjnnszjlncdcdtlzzzacqqzzddxyblxcbqjylzllljddz
jgyqyjzyxnyyyexjxksdaznyrdlzyyynjlslldyxjcykywnqcclddnyyynycgczhjxcclgzqjgnwnncqqjysbzzxyjxjnxjfzbsb
dsfnsfpzxhdwztdmpptflzzbzdmyypqjrsdzsqzsqxbdgcpzswdwcsqzgmdhzxmwwfybpngphdmjthzsmmbgzmbzjcfzhfcbbnmq
dfmbcmcjxlgpnjbbxgyhyyjgptzgzmqbqdcgybjxlwnkydpdymgcftpfxyztzxdzxtgkptybbclbjaskytssqyymscxfjhhlslls
jpqjjqaklyldlycctsxmcwfgngbqxllllnyxtyltyxytdpjhnhgnkbyqnfjyyzbyyessessgdyhfhwtcqbsdzjtfdmxhcnjzymqw
srxjdzjqbdqbbsdjgnfbknbxdkqhmkwjjjgdllthzhhyyyyhhsxztyyyccbdbpypzyccztjpzywcbdlfwzcwjdxxhyhlhwczxjtc
nlcdpxnqczczlyxjjcjbhfxwpywxzpcdzzbdccjwjhmlxbqxxbylrddgjrrctttgqdczwmxfytmmzcwjwxyywzzkybzcccttqnhx
nwxxkhkfhtswoccjybcmpzzykbnnzpbthhjdlszddytyfjpxyngfxbyqxzbhxcpxxtnzdnnycnxsxlhkmzxlthdhkghxxsshqyhh
cjyxglhzxcxnhekdtgqxqypkdhentykcnymyyjmkqyyyjxzlthhqtbyqhxbmyhsqckwwyllhcyylnneqxqwmcfbdccmljggxdqkt
lxkknqcdgcjwyjjlyhhqyttnwchhxcxwherzjydjccdbqcdgdnyxzdhcqrxcbhztqcbxwgqwyybxhmbymykdyecmqkyaqyngyzsl
fnkkqgyssqyshngjctxkzycssbkyxhyylstycxqthysmnscpmmgcccccmnztasmgqzjhklosjylswtmqzyqkdzljqqyplzycztcq
qpbbcjzclpkhqcyyxxdtdddsjcxffllchqxmjlwcjcxtspycxndtjshjwhdqqqckxyamylsjhmlalygxcyydmamdqmlmcznnyybz
xkyflmcncmlhxrcjjhsylnmtjggzgywjxsrxcwjgjqhqzdqjdcjjskjkgdzcgjjyjylxzxxcdqhhheslmhlfsbdjsyyshfyssczq
lpbdrfnztzdkykhsccgkwtqzckmsynbcrxqbjyfaxpzzedzcjykbcjwhyjbqzzywnyszptdkzpfpbaztklqnhbbzptpptyzzybhn
ydcpzmmcycqmcjfzzdcmnlfpbplngqjtbttajzpzbbdnjkljqylnbzqhksjznggqstzkcxchpzsnbcgzkddzqanzgjkdrtlzldwj
njzlywtxndjzjhxnatncbgtzcsskmljpjytsnwxcfjwjjtkhtzplbhsnjssyjbhbjyzlstlsbjhdnwqpslmmfbjdwajyzccjtbnn
nzwxxcdslqgdsdpdzgjtqqpsqlyyjzlgyhsdlctcbjtktyczjtqkbsjlgnnzdncsgpynjzjjyyknhrpwszxmtncszzyshbyhyzax
ywkcjtllckjjtjhgcssxyqyczbynnlwqcglzgjgqyqcczssbcrbcskydznxjsqgxssjmecnstjtpbdlthzwxqwqczexnqczgwesg
ssbybstscslccgbfsdqnzlccglllzghzcthcnmjgyzazcmsksstzmmzckbjygqljyjppldxrkzyxccsnhshhdznlzhzjjcddcbcj
xlbfqbczztpqdnnxljcthqzjgylklszzpcjdscqjhjqkdxgpbajynnsmjtzdxlcjyryynhjbngzjkmjxltbsllrzpylssznxjhll
hyllqqzqlsymrcncxsljmlzltzldwdjjllnzggqxppskyggggbfzbdkmwggcxmcgdxjmcjsdycabxjdlnbcddygskydqdxdjjyxh
saqazdzfslqxxjnqzylblxxwxqqzbjzlfbblylwdsljhxjyzjwtdjcyfqzqzzdzsxzzqlzcdzfxhwspynpqzmlpplffxjjnzzyls
jnyqzfpfzgsywjjjhrdjzzxtxxglghtdxcskyswmmtcwybazbjkshfhgcxmhfqhyxxyzftsjyzbxyxpzlchmzmbxhzzssyfdmncw
dabazlxktcshhxkxjjzjsthygxsxyyhhhjwxkzxssbzzwhhhcwtzzzpjxsyxqqjgzyzawllcwxznxgyxyhfmkhydwsqmnjnaycys
pmjkgwcqhylajgmzxhmmcnzhbhxclxdjpltxyjkdyylttxfqzhyxxsjbjnayrsmxyplckdnyhlxrlnllstycyyqygzhhsccsmcct
zcxhyqfpyyrpbflfqnntszlljmhwtcjqyzwtlnmlmdwmbzzsnzrbpdddlqjjbxtcsnzqqygwcsxfwzlxccrszdzmcyggdyqsgtnn
nlsmymmsyhfbjdgyxccpshxczcsbsjyygjmpbwaffyfnxhydxzylremzgzzyndsznlljcsqfnxxkptxzgxjjgbmyyssnbtylbnlh
bfzdcyfbmgqrrmzszxysjtznnydzzcdgnjafjbdknzblczszpsgcycjszlmnrznbzzldlnllysxsqzqlcxzlsgkbrxbrbzcycxzj
zeeyfgklzlnyhgzcgzlfjhgtgwkraajyzkzqtsshjjxdzyznynnzyrzdqqhgjzxsszbtkjbbfrtjxllfqwjgclqtymblpzdxtzag
bdhzzrbgjhwnjtjxlkscfsmwlldcysjtxkzscfwjlbnntzlljzllqblcqmqqcgcdfpbphzczjlpyyghdtgwdxfczqyyyqysrclqz
fklzzzgffcqnwglhjycjjczlqzzyjbjzzbpdcsnnjgxdqnknlznnnnpsntsdyfwwdjzjysxyyczcyhzwbbyhxrylybhkjksfxtjj
mmchhlltnyymsxxyzpdjjycsycwmdjjkqyrhllngpngtlyycljnnnxjyzfnmlrgjjtyzbsyzmsjyjhgfzqmsyxrszcytlrtqzsst
kxgqkgsptgxdnjsgcqcqhmxggztqydjjznlbznxqlhyqgggthqscbyhjhhkyygkggcmjdzllcclxqsftgjslllmlcskctbljszsz
mmnytpzsxqhjcnnqnyexzqzcpshkzzyzxxdfgmwqrllqxrfztlystctmjcsjjthjnxtnrztzfqrhcgllgcnnnnjdnlnnytsjtlny
xsszxcgjzyqpylfhdjsbbdczgjjjqzjqdybssllcmyttmqnbhjqmnygjyeqyqmzgcjkpdcnmyzgqllslnclmholzgdylfzslncnz
lylzcjeshnyllnxnjxlyjyyyxnbcljsswcqqnnyllzldjnllzllbnylnqchxyyqoxccqkyjxxxyklksxeyqhcqkkkkcsnyxxyqxy
gwtjohthxpxxhsnlcykychzzcbwqbbwjqcscszsslcylgddsjzmmymcytsdsxxscjpqqsqylyfzychdjynywcbtjsydchcyddjlb
djjsodzyqyskkyxdhhgqjyohdyxwgmmmazdybbbppbcmnnpnjzsmtxerxjmhqdntpjdcbsnmssythjtslmltrcplzszmlqdsdmjm
qpnqdxcfrnnfsdqqyxhyaykqyddlqyyysszbydslntfgtzqbzmchdhczcwfdxtmqqsphqwwxsrgjcwnntzcqmgwqjrjhtqjbbgwz
fxjhnqfxxqywyyhyccdydhhqmrmtmwctbszppzzglmzfollcfwhmmsjzttdhlmyffytzzgzyskjjxqyjzqbhmbzclyghgfmshpcf
zsnclpbqsnjyzslxxfpmtyjygbxlldlxpzjyzjyhhzcywhjylsjexfszzywxkzjlnadymlymqjpwxxhxsktqjezrpxxzghmhwqpw
qlyjjqjjzszcnhjlchhnxjlqwzjhbmzyxbdhhypylhlhlgfwlcfyytlhjjcwmscpxstkpnhjxsntyxxtestjctlsslstdlllwwyh
dnrjzsfgxssyczykwhtdhwjglhtzdqdjzxxqgghltzphcsqfclnjtclzpfstpdynylgmjllycqhynspchylhqyqtmzymbywrfqyk
jsyslzdnjmpxyyssrhzjnyqtqdfzbwwdwwrxcwggyhxmkmyyyhmxmzhnksepmlqqmtcwctmxmxjpjjhfxyyzsjzhtybmstsyjznq
jnytlhynbyqclcycnzwsmylknjxlggnnpjgtysylymzskttwlgsmzsylmpwlcwxwqcssyzsyxyrhssntsrwpccpwcmhdhhxzdzyf
jhgzttsbjhgyglzysmyclllxbtyxhbbzjkssdmalhhycfygmqypjyjqxjllljgclzgqlycjcctotyxmtmshllwlqfxymzmklpszz
cxhkjyclctyjcyhxsgyxnnxlzwpyjpxhjwpjpwxqqxlxsdhmrslzzydwdtcxknstzshbsccstplwsscjchjlcgchssphylhfhhxj
sxallnylmzdhzxylsxlmzykcldyahlcmddyspjtqjzlngjfsjshctsdszlblmssmnyymjqbjhrzwtyydchjljapzwbgqxbkfnbjd
llllyylsjydwhxpsbcmljpscgbhxlqhyrljxyswxhhzlldfhlnnymjljyflyjycdrjlfsyzfsllcqyqfgqyhnszlylmdtdjcnhbz
llnwlqxygyyhbmgdhxxnhlzzjzxczzzcyqzfngwpylcpkpykpmclgkdgxzgxwqbdxzzkzfbddlzxjtpjpttbythzzdwslcpnhslt
jxxqlhyxxxywzyswttzkhlxzxzpyhgzhknfsyhntjrnxfjcpjztwhplshfcrhnslxxjxxyhzqdxqwnnhyhmjdbflkhcxcwhjfyjc
fpqcxqxzyyyjygrpynscsnnnnchkzdyhflxxhjjbyzwttxnncyjjymswyxqrmhxzwfqsylznggbhyxnnbwttcsybhxxwxyhhxyxn
knyxmlywrnnqlxbbcljsylfsytjzyhyzawlhorjmnsczjxxxyxchcyqryxqzddsjfslyltsffyxlmtyjmnnyyyxltzcsxqclhzxl
wyxzhnnlrxkxjcdyhlbrlmbrdlaxksnlljlyxxlynrylcjtgncmtlzllcyzlpzpzyawnjjfybdyyzsepckzzqdqpbpsjpdyttbdb
bbyndycncpjmtmlrmfmmrwyfbsjgygsmdqqqztxmkqwgxllpjgzbqrdjjjfpkjkcxbljmswldtsjxldlppbxcwkcqqbfqbccajzg
mykbhyhhzykndqzybpjnspxthlfpnsygyjdbgxnhhjhzjhstrstldxskzysybmxjlxyslbzyslzxjhfybqnbylljqkygzmcyzzym
ccslnlhzhwfwyxzmwyxtynxjhbyymcysbmhysmydyshnyzchmjjmzcaahcbjbbhblytylsxsnxgjdhkxxtxxnbhnmlngsltxmrhn
lxqqxmzllyswqgdlbjhdcgjyqyymhwfmjybbbyjyjwjmdpwhxqldyapdfxxbcgjspckrssyzjmslbzzjfljjjlgxzgyxyxlszqkx
bexyxhgcxbpndyhwectwwcjmbtxchxyqqllxflyxlljlssnwdbzcmyjclwswdczpchqekcqbwlcgydblqppqzqfnqdjhymmcxtxd
rmzwrhxcjzylqxdyynhyyhrslnrsywwjjymtltllgtqcjzyabtckzcjyccqlysqxalmzynywlwdnzxqdllqshgpjfjljnjabcqzd
jgthhsstnyjfbswzlxjxrhgldlzrlzqzgsllllzlymxxgdzhgbdphzpbrlwnjqbpfdwonnnhlypcnjccndmbcpbzzncyqxldomzb
lzwpdwyygdstthcsqsccrsssyslfybnntyjszdfndpdhtqzmbqlxlcmyffgtjjqwftmnpjwdnlbzcmmcngbdzlqlpnfhyymjylsd
chdcjwjcctljcldtljjcbddpndsszycndbjlggjzxsxnlycybjjxxcbylzcfzppgkcxqdzfztjjfjdjxzbnzyjqctyjwhdyczhym
djxttmpxsplzcdwslshxypzgtfmlcjtacbbmgdewycyzxdszjyhflystygwhkjyylsjcxgywjcbllcsnddbtzbsclyzczzssqdll
mjyyhfllqllxfdyhabxggnywyypllsdldllbjcyxjznlhljdxyyqytdlllbngpfdfbbqbzzmdpjhgclgmjjpgaehhbwcqxajhhhz
chxyphjaxhlphjpgpzjqcqzgjjzzgzdmqyybzzphyhybwhazyjhykfgdpfqsdlzmljxjpgalxzdaglmdgxmmzqwtxdxxpfdmmssy
mpfmdmmkxksyzyshdzkjsysmmzzzmdydyzzczxbmlstmdyemxckjmztyymzmzzmsshhdccjewxxkljsthwlsqlyjzllsjssdppmh
nlgjczyhmxxhgncjmdhxtkgrmxfwmckmwkdcksxqmmmszzydkmsclcmpcjmhrpxqpzdsslcxkyxtwlkjyahzjgzjwcjnxyhmmbml
gjxmhlmlgmxctkzmjlyscjsyszhsyjzjcdajzhbsdqjzgwtkqxfkdmsdjlfmnhkzqkjfeypzyszcdpynffmzqykttdzzefmzlbnp
plplpbpszalltnlkckqzkgenjlwalkxydpxnhsxqnwqnkxqclhyxxmlnccwlymqyckynnlcjnszkpyzkcqzqljbdmdjhlasqlbyd
wqlwdgbqcryddztjybkbwszdxdtnpjdtcnqnfxqqmgnseclstbhpwslctxxlpwydzklnqgzcqapllkqcylbqmqczqcnjslqzdjxl
ddhpzqdljjxzqdjyzhhzlkcjqdwjppypqakjyrmpzbnmcxkllzllfqpylllmbsglzysslrsysqtmxyxzqzbscnysyztffmzzsmzq
hzssccmlyxwtpzgxzjgzgsjzgkddhtqggzllbjdzlsbzhyxyzhzfywxytymsdnzzyjgtcmtnxqyxjscxhslnndlrytzlryylxqht
xsrtzcgyxbnqqzfhykmzjbzymkbpnlyzpblmcnqyzzzsjztjctzhhyzzjrdyzhnfxklfzslkgjtctssyllgzrzbbjzzklpkbczys
nnyxbjfbnjzzxcdwlzyjxzzdjjgggrsnjkmsmzjlsjywqsnyhqjsxpjztnlsnshrnynjtwchglbnrjlzxwjqxqkysjycztlqzybb
ybyzjqdwgyzcytjcjxckcwdkkzxsnkdnywwyyjqyytlytdjlxwkcjnklccpzcqqdzzqlcsfqchqqgssmjzzllbjjzysjhtsjdysj
qjpdszcdchjkjzzlpycgmzndjxbsjzzsyzyhgxcpbjydssxdzncglqmbtsfcbfdzdlznfgfjgfsmpnjqlnblgqcyyxbqgdjjqsrf
kztjdhczklbsdzcfytplljgjhtxzcsszzxstjygkgckgynqxjplzbbbgcgyjzgczqszlbjlsjfzgkqqjcgycjbzqtldxrjnbsxxp
zshszycfwdsjjhxmfczpfzhqhqmqnknlyhtycgfrzgnqxcgpdlbzcsczqlljblhbdcypscppdymzzxgyhckcpzjgslzlnscnsldl
xbmsdlddfjmkdqdhslzxlsznpqpgjdlybdskgqlbzlnlkyyhzttmcjnqtzzfszqktlljtyyllnllqyzqlbdzlslyyzxmdfszsnxl
xznczqnbbwskrfbcylctnblgjpmczzlstlxshtzcyzlzbnfmqnlxflcjlyljqcbclzjgnsstbrmhxzhjzclxfnbgxgtqncztmsfz
kjmssncljkbhszjntnlzdntlmmjxgzjyjczxyhyhwrwwqnztnfjscpyshzjfyrdjsfscjzbjfzqzchzlxfxsbzqlzsgyftzdcszx
zjbjpszkjrhxjzcgbjkhcggtxkjqglxbxfgtrtylxqxhdtsjxhjzjjcmzlcqsbtxwqgxtxxhxftsdkfjhzyjfjxnzldlllcqsqqz
qwqxswqtwgwbzcgcllqzbclmqjtzgzyzxljfrmyzflxnsnxxjkxrmjdzdmmyxbsqbhgzmwfwygmjlzbyytgzyccdjyzxsngnyjyz
nbgpzjcqsyxsxrtfyzgrhztxszzthcbfclsyxzlzqmzlmplmxzjssfsbysmzqhxxnxrxhqzzzsslyflczjrcrxhhzxqndshxsjjh
qcjjbcynsysxjbqjpxzqplmlxzkyxlxcnlcycxxzzlxdlllmjyhzxhyjwkjrwyhcpsgnrzlfzwfzznsxgxflzsxzzzbfcsyjdbrj
krdhhjxjljjtgxjxxstjtjxlyxqfcsgswmsbctlqzzwlzzkxjmltmjyhsddbxgzhdlbmyjfrzfcgclyjbpmlysmsxlszjqqhjzfx
gfqfqbphngyyqxgztnqwyltlgwgwwhnlfmfgzjmgmgbgtjflyzzgzyzaflsspmlbflcwbjztljjmzlpjjlymqtmyyyfbgygqzgly
zdxqyxrqqqhsxyyqxygjtyxfsfsllgnqcygycwfhcccfxpylypllzqxxxxxqqhhsshjzcftsczjxspzwhhhhhapylqnlpqafyhxd
ylnkmzqgggddesrenzltzgchyppcsqjjhclljtolnjpzljlhymhezdydsqycddhgznndzclzywllznteydgnlhslpjjbdgwxpcnn
tycklkclwkllcasstknzdnnjttlyyzssysszzryljqkcgdhhyrxrzydgrgcwcgzqffbppjfzynakrgywyjpqxxfkjtszzxswzddf
bbqtbgtzkznpzfpzxzpjszbmqhkyyxyldkljnypkyghgdzjxxeaxpnznctzcmxcxmmjxnkszqnmnlwbwwqjjyhclstmcsxnjcxxt
pcnfdtnnpglllzcjlspblpgjcdtnjjlyarscffjfqwdpgzdwmrzzcgodaxnssnyzrestyjwjyjdbcfxnmwttbqlwstszgybljpxg
lbnclgpcbjftmxzljylzxcltpnclcgxtfzjshcrxsfysgdkntlbyjcyjllstgqcbxnhzxbxklylhzlqzlnzcqwgzlgzjncjgcmnz
zgjdzxtzjxycyycxxjyyxjjxsssjstsstdppghtcsxwzdcsynptfbchfbblzjclzzdbxgcjlhpxnfzflsyltnwbmnjhszbmdnbcy
sccldnycndqlyjjhmqllcsgljjsyfpyyccyltjantjjpwycmmgqyysxdxqmzhszxbftwwzqswqrfkjlzjqqyfbrxjhhfwjgzyqac
myfrhcyybynwlpexcczsyyrlttdmqlrkmpbgmyyjprkznbbsqyxbhyzdjdnghpmfsgbwfzmfqmmbzmzdcgjlnnnxyqgmlrygqccy
xzlwdkcjcggmcjjfyzzjhycfrrcmtznzxhkqgdjxccjeascrjthpljlrzdjrbcqhjdnrhylyqjsymhzydwcdfryhbbydtssccwbx
glpzmlzjdqsscfjmmxjcxjytycghycjwynsxlfemwjnmkllswtxhyyyncmmcyjdqdjzglljwjnkhpzggflccsczmcbltbhbqjxqd
jpdjztghglfjawbzyzjltstdhjhctcbchflqmpwdshyytqwcnntjtlnnmnndyyyxsqkxwyyflxxnzwcxypmaelyhgjwzzjbrxxaq
jfllpfhhhytzzxsgqjmhspgdzqwbwpjhzjdyjcqwxkthxsqlzyymysdzgnqckknjlwpnsyscsyzlnmhqsyljxbcxtlhzqzpcycyk
pppnsxfyzjjrcemhszmnxlxglrwgcstlrsxbygbzgnxcnlnjlclynymdxwtzpalcxpqjcjwtcyyjlblxbzlqmyljbghdslssdmxm
bdczsxyhamlczcpjmcnhjyjnsykchskqmczqdllkablwjqsfmocdxjrrlyqchjmybyqlrhetfjzfrfksryxfjdwtsxxywsqjysly
xwjhsdlxyyxhbhawhwjcxlmyljcsqlkydttxbzslfdxgxsjkhsxxybssxdpwncmrptqzczenygcxqfjxkjbdmljzmqqxnoxslyxx
lylljdzptymhbfsttqqwlhsgynlzzalzxclhtwrrqhlstmypyxjjxmnsjnnbryxyjllyqyltwylqyfmlkljdnlltfzwkzhljmlhl
jnljnnlqxylmbhhlnlzxqchxcfxxlhyhjjgbyzzkbxscqdjqdsndzsygzhhmgsxcsymxfepcqwwrbpyyjqryqcyjhqqzyhmwffhg
zfrjfcdbxntqyzpcyhhjlfrzgpbxzdbbgrqstlgdgylcqmgchhmfywlzyxkjlypjhsywmqqggzmnzjnsqxlqsyjtcbehsxfszfxz
wfllbcyyjdytdthwzsfjmqqyjlmqsxlldttkghybfpwdyysqqrnqwlgwdebzwcyygcnlkjxtmxmyjsxhybrwfymwfrxyymxysctz
ztfykmldhqdlgyjnlcryjtlpsxxxywlsbrrjwxhqybhtydnhhxmmywytycnnmnssccdalwztcpqpyjllqzyjswjwzzmmglmxclmx
nzmxmzsqtzppjqblpgxjzhfljjhycjsrxwcxsncdlxsyjdcqzxslqyclzxlzzxmxqrjmhrhzjbhmfljlmlclqnldxzlllfyprgjy
nxcqqdcmqjzzxhnpnxzmemmsxykynlxsxtljxyhwdcwdzhqyybgybcyscfgfsjnzdrzzxqxrzrqjjymcanhrjtldbpyzbstjhxxz
ypbdwfgzzrpymnnkxcqbyxnbnfyckrjjcmjegrzgyclnnzdnkknsjkcljspgyyclqqjybzssqlllkjftbgtylcccdblsppfylgyd
tzjqjzgkntsfcxbdkdxxhybbfytyhbclnnytgdhryrnjsbtcsnyjqhklllzslydxxwbcjqsbxnpjzjzjdzfbxxbrmladhcsnclbj
dstblprznswsbxbcllxxlzdnzsjpynyxxyftnnfbhjjjgbygjpmmmmsszljmtlyzjxswxtyledqpjmpgqzjgdjlqjwjqllsdgjgy
gmscljjxdtygjqjjjcjzcjgdzdshqgzjggcjhqxsnjlzzbxhsgzxcxyljxyxyydfqqjhjfxdhctxjyrxysqtjxyefyyssyxjxncy
zxfxcsxszxyyschshxzzzgzzzgfjdldylnpzgsjaztyqzpbxcbdztzczyxxyhhscjshcggqhjhgxhsctmzmehyxgebtclzkkwytj
zrslekestdbcyhqqsayxcjxwwgsphjszsdncsjkqcxswxfctynydpccczjqtcwjqjzzzqzljzhlsbhpydxpsxshhezdxfptjqyzc
xhyaxncfzyyhxgnqmywntzsjbnhhgymxmxqcnssbcqsjyxxtyyhybcqlmmszmjzzllcogxzaajzyhjmchhcxzsxsdznleyjjzjbh
zwjzsqtzpsxzzdsqjjjlnyazphhyysrnqzthzhnyjyjhdzxzlswclybzyecwcycrylchzhzydzydyjdfrjjhtrsqtxyxjrjhojyn
xelxsfsfjzghpzsxzszdzcqzbyyklsgsjhczshdgqgxyzgxchxzjwyqwgyhksseqzzndzfkwyssdclzstsymcdhjxxyweyxczayd
mpxmdsxybsqmjmzjmtjqlpjyqzcgqhyjhhhqxhlhdldjqcfdwbsxfzzyyschtytyjbhecxhjkgqfxbhyzjfxhwhbdzfyzbchpnpg
dydmsxhkhhmamlnbyjtmpxejmcthqbzyfcgtyhwphftgzzezsbzegpbmdskftycmhbllhgpzjxzjgzjyxzsbbqsczzlzscstpgxm
jsfdcczjzdjxsybzlfcjsazfgszlwbczzzbyztzynswyjgxzbdsynxlgzbzfygczxbzhzftpbgzgejbstgkdmfhyzzjhzllzzgjq
zlsfdjsscbzgpdlfzfzszyzyzsygcxsnxxchczxtzzljfzgqsqqxcjqccccdjcdszzyqjccgxztdlgscxzsyjjqtcclqdqztqchq
qyzynzzzpbkhdjfcjfztypqyqttynlmbdktjcpqzjdzfpjsbnjlgyjdxjdcqkzgqkxclbzjtcjdqbxdjjjstcxnxbxqmslyjcxnt
jqwwcjjnjjlllhjcwqtbzqqczczpzzdzyddcyzdzccjgtjfzdprntctjdcxtqzdtjnplzbcllctdsxkjzqdmzlbznbtjdcxfczdb
czjjltqqpldckztbbzjcqdcjwynllzlzccdwllxwzlxrxntqjczxkjlsgdnqtddglnlajjtnnynkqlldzntdnycygjwyxdxfrsqs
tcdenqmrrqzhhqhdldazfkapbggpzrebzzykyqspeqjjglkqzzzjlysyhyzwfqznlzzlzhwcgkypqgnpgblplrrjyxcccgyhsfzf
wbzywtgzxyljczwhncjzplfflgskhyjdeyxhlpllllcygxdrzelrhgklzzyhzlyqszzjzqljzflnbhgwlczcfjwspyxzlzlxgccp
zbllcxbbbbnbbcbbcrnnzccnrbbnnldcgqyyqxygmqzwnzytyjhyfwtehznjywlccntzyjjcdedpwdztstnjhtymbjnyjzlxtsst
phndjxxbyxqtzqddtjtdyztgwscszqflshlnzbcjbhdlyzjyckwtydylbnydsdsycctyszyyebgexhqddwnygyclxtdcystqnygz
ascsszzdzlcclzrqxyywljsbymxshzdembbllyyllytdqyshymrqnkfkbfxnnsbychxbwjyhtqbpbsbwdzylkgzskyghqzjxhxjx
gnljkzlyycdxlfwfghljgjybxblybxqpqgntzplncybxdjyqydymrbeyjyyhkxxstmxrczzjwxyhybmcflyzhqyzfwxdbxbcwzms
lpdmyckfmzklzcyqycclhxfzlydqzpzygyjyzmdxtzfnnyttqtzhgsfcdmlccytzxjcytjmkslpzhysnwllytpzctzccktxdhxxt
qcyfksmqccyyazhtjplylzlyjbjxtfnyljyynrxcylmmnxjsmybcsysslzylljjgyldzdlqhfzzblfndsqkczfyhhgqmjdsxyctt
xnqnjpyybfcjtyyfbnxejdgyqbjrcnfyyqpghyjsyzngrhtknlnndzntsmgklbygbpyszbydjzsstjztsxzbhbscsbzczptqfzlq
flypybbjgszmnxdjmtsyskkbjtxhjcegbsmjyjzcstmljyxrczqscxxqpyzhmkyxxxjcljyrmyygadyskqlnadhrskqxzxztcggz
dlmlwxybwsyctbhjhcfcwzsxwwtgzlxqshnyczjxemplsrcgltnzntlzjcyjgdtclglbllqpjmzpapxyzlaktkdwczzbncctdqqz
qyjgmcdxltgcszlmlhbglkznnwzndxnhlnmkydlgxdtwcfrjerctzhydxykxhwfzcqshknmqqhzhhymjdjskhxzjzbzzxympajnm
ctbxlsxlzynwrtsqgscbptbsgzwyhtlkssswhzzlyytnxjgmjrnsnnnnlskztxgxlsammlbwldqhylakqcqctmycfjbslxclzjcl
xxknbnnzlhjphqplsxsckslnhpsfqcytxjjzljldtzjjzdlydjntptnndskjfsljhylzqqzlbthydgdjfdbyadxdzhzjnthqbykn
xjjqczmlljzkspldsclbblnnlelxjlbjycxjxgcnlcqplzlznjtsljgyzdzpltqcssfdmnycxgbtjdcznbgbqyqjwgkfhtnbyqzq
gbkpbbyzmtjdytblsqmbsxtbnpdxklemyycjynzdtldykzzxtdxhqshygmzsjycctayrzlpwltlkxslzcggexclfxlkjrtlqjaqz
ncmbqdkkcxglczjzxjhptdjjmzqykqsecqzdshhadmlzfmmzbgntjnnlhbyjbrbtmlbyjdzxlcjlpldlpcqdhlhzlycblcxccjad
qlmzmmsshmybhbnkkbhrsxxjmxmdznnpklbbrhgghfchgmnklltsyyycqlcskymyehywxnxqywbawykqldnntndkhqcgdqktgpkx
hcpdhtwnmssyhbwcrwxhjmkmzngwtmlkfghkjyldyycxwhyyclqhkqhtdqkhffldxqwytyydesbpkyrzpjfyyzjceqdzzdlattpb
fjllcxdlmjsdxegwgsjqxcfbssszpdyzcxznyxppzydlyjccpltxlnxyzyrscyyytylwwndsahjsygyhgywwaxtjzdaxysrltdps
syxfnejdxyzhlxlllzhzsjnyqyqyxyjghzgjcyjchzlycdshhsgczyjscllnxzjjyyxnfsmwfpyllyllabmddhwzxjmcxztzpmlq
chsfwzynctlndywlslxhymmylmbwwkyxyaddxylldjpybpwnxjmmmllhafdllaflbnhhbqqjqzjcqjjdjtffkmmmpythygdrjrdd
wrqjxnbysrmzdbyytbjhpymyjtjxaahggdqtmystqxkbtzbkjlxrbyqqhxmjjbdjntgtbxpgbktlgqxjjjcdhxqdwjlwrfmjgwqh
cnrxswgbtgygbwhswdwrfhwytjjxxxjyzyslphyypyyxhydqpxshxyxgskqhywbdddpplcjlhqeewjgsyykdpplfjthkjltcyjhh
jttpltzzcdlyhqkcjqysteeyhkyzyxxyysddjkllpymqyhqgxqhzrhbxpllnqydqhxsxxwgdqbshyllpjjjthyjkyphthyyktyez
yenmdshlzrpqfbnfxzbsftlgxsjbswyysksflxlpplbbblnsfbfyzbsjssylpbbffffsscjdstjsxtryjcyffsyzyzbjtlctsbsd
hrtjjbytcxyyeylycbnebjdsysyhgsjzbxbytfzwgenhhhthjhhxfwgcstbgxklstyymtmbyxjskzscdyjrcythxzfhmymcxlzns
djtxtxrycfyjsbsdyerxhljxbbdeynjghxgckgscymblxjmsznskgxfbnbbthfjyafxwxfbxmyfhdttcxzzpxrsywzdlybbktyqw
qjbzypzjznjpzjlztfysbttslmptzrtdxqsjehbnylndxljsqmlhtxtjecxalzzspktlzkqqyfsyjywpcpqfhjhytqxzkrsgtksq
czlptxcdyyzsslzslxlzmacpcqbzyxhbsxlzdltztjtylzjyytbzypltxjsjxhlbmytxcqrblzssfjzztnjytxmyjhlhpblcyxqj
qqkzzscpzkswalqsplczzjsxgwwwygyatjbbctdkhqhkgtgpbkqyslbxbbckbmllndzstbklggqkqlzbkktfxrmdkbftpzfrtppm
ferqnxgjpzsstlbztpszqzsjdhljqlzbpmsmmsxlqqnhknblrddnhxdkddjcyyljfqgzlgsygmjqjkhbpmxyxlytqwlwjcpbmjxc
yzydrjbhtdjyeqshtmgsfyplwhlzffnynnhxqhpltbqpfbjwjdbygpnxtbfzjgnnntjshxeawtzylltyqbwjpgxghnnkndjtmszs
qynzggnwqtfhclssgmnnnnynzqqxncjdqgzdlfnykljcjllzlmzznnnnsshthxjlzjbbhqjwwycrdhlyqqjbeyfsjhthnrnwjhwp
slmssgzttygrqqwrnlalhmjtqjsmxqbjjzjqzyzkxbjqxbjxshzssfglxmxnxfghkzszggslcnnarjxhnlllmzxelglxydjytlfb
kbpnlyzfbbhptgjkwetzhkjjxzxxglljlstgshjjyqlqzfkcgnndjsszfdbctwwseqfhqjbsaqtgypjlbxbmmywxgslzhglsgnyf
ljbyfdjfngsfmbyzhqffwjsyfyjjphzbyyzffwotjnlmftwlbzgyzqxcdjygzyyryzynyzwegazyhjjlzrthlrmgrjxzclnnnljj
yhtbwjybxxbxjjtjteekhwslnnlbsfazpqqbdlqjjtyyqlyzkdksqjnejzldqcgjqnnjsncmrfqthtejmfctyhypymhydmjncfgy
yxwshctxrljgjzhzcyyyjltkttntmjlzclzzayyoczlrlbszywjytsjyhbyshfjlykjxxtmzyyltxxypslqyjzyzyypnhmymdyyl
blhlsyygqllnjjymsoycbzgdlyxylcqyxtszegxhzglhwbljheyxtwqmakbpqcgyshhegqcmwyywljyjhyyzlljjylhzyhmgsljl
jxcjjyclycjbcpzjzjmmwlcjlnqljjjlxyjmlszljqlycmmgcfmmfpqqmfxlqmcffqmmmmhnznfhhjgtthxkhslnchhyqzxtmmqd
cydyxyqmyqylddcyaytazdcymdydlzfffmmycqcwzzmabtbyctdmndzggdftypcgqyttssffwbdttqssystwnjhjytsxxylbyyhh
whxgzxwznnqzjzjjqjccchykxbzszcnjtllcqxynjnckycynccqnxyewyczdcjycchyjlbtzyycqwlpgpyllgktltlgkgqbgychj
xy
""".replacingOccurrences(of: "\n", with: "")

private func pinyinFirstLetter(hanzi: unichar) -> String {
    let index = Int(hanzi) - hanziStart
    if index >= 0 && index < kFirstLetters.count {
        let startIndex = kFirstLetters.index(kFirstLetters.startIndex, offsetBy: index)
        return String(kFirstLetters[startIndex])
    } else {
        return "#"
    }
}

extension String {
    public func getJianpin() -> String {
        return self.reduce("") { (rst, c) in
            let cLetter = (String(c) as NSString).character(at: 0)
            return rst + pinyinFirstLetter(hanzi: cLetter)
        }
    }
    
    public func getPinyin() -> String {
        if self.isEmpty { return "" }
        let enc = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))
        guard let gb2312_data = self.data(using: String.Encoding(rawValue: enc)) else { return "" }
        var ucHigh: UniChar = 0
        var ucLow: UniChar = 0
        var ncode = 0
        var strValue = ""
        let iLen = gb2312_data.count
        let gb2312String = [UInt8](gb2312_data)
        var i = 0
        while i < iLen {
            let c = gb2312String[i]
            if UniChar(c) < 0x80 {
                strValue += String(format: "%c", c > 95 ? c - 32 : c)
                i += 1
                continue
            }
            ucHigh = UniChar(gb2312String[i])
            if i + 1 < iLen {
                ucLow = UniChar(gb2312String[i + 1])
            }
            if ucHigh < 0xa1 || ucLow < 0xa1 {
                i += 1
                continue
            } else {
                ncode = Int((ucHigh - 0xa0) * 100 + (ucLow - 0xa0))
            }
            let strRes = findLetter(nCode: ncode)
            strValue += strRes
            i += 2
        }
        return strValue.lowercased()
    }
    
    public func getFirstLetter() -> String {
        if self.count == 0 { return "#" }
        var cLetter: UniChar = 0
        let firstC = (self as NSString).character(at: 0)
        if (firstC > 64 && firstC < 91) || (firstC > 96 && firstC < 123) {
            cLetter = firstC
        } else {
            cLetter = (pinyinFirstLetter(hanzi: firstC) as NSString).character(at: 0)
        }
        if cLetter > 95 {
            cLetter -= 32
        }
        return String(format: "%c", cLetter)
    }
}
