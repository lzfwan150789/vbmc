function [K,out2] = MIDAS_cov_fn(hp,flag)  
    
latlongs = [60.1550   -2.0720;
   59.5270   -1.6280;
   59.8790   -1.2970;
   60.1390   -1.1830;
   60.7590   -0.8860;
   58.8740   -3.3850;
   58.9540   -2.9000;
   58.4540   -3.0890;
   58.2890   -5.0730;
   58.6260   -5.0010;
   58.1680   -4.7280;
   58.0190   -4.4070;
   58.5240   -4.2730;
   58.2310   -3.9210;
   58.2140   -6.3250;
   58.5160   -6.2680;
   57.5790   -5.6950;
   57.7740   -5.6000;
   58.0680   -5.2690;
   57.3370   -5.6560;
   57.6130   -5.3080;
   58.0320   -5.0730;
   57.6000   -4.4450;
   57.5740   -4.0930;
   57.6870   -4.1670;
   57.4750   -7.3830;
   57.8720   -6.7060;
   57.0140   -6.2870;
   56.8720   -5.6730;
   57.2390   -5.8980;
   57.1990   -5.6330;
   56.7200   -5.2260;
   56.8300   -5.0770;
   57.4270   -4.4970;
   57.1440   -4.6780;
   57.4600   -4.3730;
   56.9400   -4.2380;
   57.2060   -3.8270;
   57.4870   -4.2210;
   57.5420   -4.0620;
   57.1330   -3.6680;
   57.3390   -4.0060;
   57.5870   -3.8930;
   57.6150   -3.6090;
   57.3360   -3.6050;
   57.6460   -3.5620;
   57.6450   -3.3770;
   57.5320   -3.1940;
   57.7120   -3.3220;
   57.3540   -3.3440;
   57.5530   -2.9480;
   57.6610   -2.5190;
   57.0060   -3.3970;
   57.0370   -3.2190;
   57.0470   -3.0420;
   57.3570   -2.7650;
   57.2740   -2.3670;
   57.4430   -2.3880;
   57.1870   -2.2130;
   57.2050   -2.2040;
   57.1290   -2.1380;
   57.3260   -2.0020;
   57.5070   -1.8420;
   57.0280   -2.4030;
   56.9460   -2.2100;
   56.4570   -3.0720;
   56.4700   -2.9380;
   56.6830   -2.9270;
   56.9070   -2.9050;
   56.5610   -2.5710;
   56.7460   -2.4790;
   56.2290   -4.2620;
   56.3550   -4.3970;
   56.5280   -4.1110;
   56.3380   -3.8750;
   56.7070   -4.0100;
   56.7180   -3.7690;
   56.9010   -3.6280;
   56.7480   -3.5460;
   56.3510   -3.4740;
   56.4370   -3.3710;
   56.2150   -3.4110;
   56.0430   -3.3180;
   56.3190   -3.0320;
   56.3770   -2.8610;
   56.2400   -2.8060;
   56.2790   -2.5850;
   55.8770   -3.5430;
   55.9510   -3.3470;
   55.9480   -3.3050;
   55.8230   -3.2260;
   55.8600   -3.2060;
   55.9230   -3.1880;
   55.9670   -3.2110;
   55.9210   -2.6510;
   55.9600   -2.7500;
   56.0040   -2.5270;
   55.7370   -2.6610;
   55.9170   -2.1380;
   55.5520   -3.3910;
   55.7030   -3.3670;
   55.7540   -3.3550;
   55.6460   -3.1380;
   55.5410   -2.9050;
   55.6210   -2.8270;
   55.5670   -2.6360;
   55.3580   -2.5170;
   55.6030   -2.4670;
   55.6040   -2.4190;
   55.2340   -2.5790;
   55.2530   -2.2610;
   54.9760   -2.2520;
   55.3010   -1.8050;
   54.9770   -1.5970;
   55.2130   -1.6860;
   55.0180   -1.4150;
   55.4210   -1.6000;
   54.6550   -1.7380;
   54.7680   -1.5850;
   55.0030   -1.4170;
   54.5600   -1.3710;
   54.9030   -1.3930;
   54.5210   -1.8160;
   54.0450   -1.2500;
   54.2810   -0.5670;
   54.3590   -0.6700;
   54.4810   -0.6240;
   54.2730   -0.4210;
   54.4900   -0.6040;
   54.1050   -0.6410;
   53.7560   -0.3560;
   53.3070   -0.5460;
   53.1750   -0.5210;
   53.0310   -0.5020;
   52.9360   -0.0660;
   53.0940   -0.1710;
   53.2490    0.0800;
   53.4490    0.0350;
   53.1480    0.3490;
   53.2220   -0.5030;
   52.7450    0.2910;
   52.5830    0.3490;
   52.6250    1.3020;
   52.6510    0.5690;
   52.9520    0.5020;
   52.4590    0.6740;
   52.7710    0.7810;
   52.3840    1.0620;
   52.5540    1.0430;
   52.9330    1.2960;
   52.7560    1.3560;
   52.6860    1.6930;
   52.2600    0.5690;
   52.0900    0.6310;
   52.3400    0.7740;
   51.9590    1.0270;
   52.1230    0.9610;
   52.0120    1.2690;
   52.2470    1.6260;
   52.4890    1.7500;
   52.2510   -0.0300;
   52.4210    0.1020;
   52.5490    0.0950;
   52.1930    0.1320;
   52.2450    0.1030;
   52.4010   -0.2350;
   52.3530   -0.1140;
   52.0140   -0.5940;
   52.2270   -0.4630;
   52.0090   -0.4080;
   51.6620   -0.3260;
   51.8060   -0.3580;
   51.7690    0.0190;
   51.9540    0.0890;
   51.6630    0.0440;
   51.8800    0.2250;
   51.7330    0.4320;
   51.6400    0.5880;
   51.9460    0.6480;
   51.5540    0.8300;
   51.7850    1.1520;
   53.5320   -1.8550;
   53.9870   -2.4330;
   54.1000   -2.1620;
   53.8110   -1.8650;
   53.8130   -1.7720;
   53.6130   -1.6640;
   53.8000   -1.5600;
   54.0150   -1.5380;
   53.3810   -1.4900;
   53.8360   -1.1970;
   53.8690   -1.3170;
   53.8270   -1.1470;
   53.9230   -1.1610;
   53.2580   -1.9120;
   53.0090   -1.7230;
   52.9350   -1.5040;
   53.1620   -1.4780;
   53.1940   -1.4340;
   52.8360   -1.2500;
   53.0050   -1.2500;
   52.8780   -1.0770;
   53.2230   -1.1140;
   53.4820   -1.0070;
   53.0640   -0.9610;
   53.3960   -0.9300;
   53.3400   -0.8990;
   52.6800   -1.2160;
   52.7310   -0.9940;
   52.5290   -0.7250;
   52.7270   -0.6540;
   52.2730   -0.8790;
   52.3380   -0.5450;
   52.6030   -0.3090;
   52.6110   -0.4590;
   52.4540   -1.9230;
   52.1920   -1.7600;
   52.4520   -1.7410;
   52.2060   -1.6030;
   52.4140   -1.5190;
   52.3690   -1.2550;
   51.7580   -1.5760;
   51.7610   -1.2620;
   52.0720   -1.3320;
   51.6670   -0.9940;
   51.6200   -1.0970;
   51.8880   -1.0150;
   52.9990   -2.2690;
   52.8860   -2.1810;
   52.7020   -2.1180;
   53.0400   -2.0840;
   52.6060   -1.9160;
   52.4330   -3.1060;
   52.5900   -2.9480;
   52.8560   -3.0620;
   52.6730   -2.8900;
   52.7240   -2.8400;
   52.3670   -2.7210;
   52.7940   -2.6630;
   52.7790   -2.4280;
   52.1130   -2.3070;
   52.2110   -2.2280;
   52.1000   -2.0590;
   52.2480   -1.9340;
   52.4370   -2.0750;
   52.0310   -2.8410;
   52.2130   -2.9740;
   52.2140   -2.5860;
   52.1210   -2.3050;
   51.9110   -2.5840;
   52.1240   -2.6370;
   51.4520   -2.5990;
   51.7400   -2.4030;
   51.7620   -2.2450;
   51.8940   -2.0780;
   51.7080   -1.9940;
   51.9860   -1.9300;
   51.6060   -2.2190;
   51.5600   -0.1780;
   51.5040   -0.1290;
   51.4800   -0.0020;
   51.4790   -0.4490;
   51.5480   -0.4150;
   51.6120   -0.4190;
   51.6790   -0.0540;
   51.6450   -0.0450;
   51.2740   -0.6160;
   51.3100   -0.4750;
   51.2600   -0.3190;
   51.4820   -0.2900;
   51.1510   -0.1910;
   51.2030    0.1370;
   51.2050    1.0190;
   51.2230    0.3330;
   51.0770    0.4620;
   51.1330    1.3480;
   51.2870    0.4510;
   51.1960    0.6400;
   51.1970    0.7860;
   51.2970    0.8810;
   51.1850    0.9480;
   51.0880    1.1640;
   51.3580    1.1390;
   51.2990    1.2490;
   51.3460    1.3400;
   51.3800    1.4250;
   50.7810   -0.6750;
   50.8200   -0.5160;
   50.8190   -0.3530;
   50.8240   -0.1110;
   50.9050   -0.0690;
   50.9090    0.1470;
   50.7620    0.2860;
   50.8650    0.3390;
   50.8380    0.4670;
   50.9380    0.5960;
   50.8550    0.5730;
   51.5330   -1.4880;
   51.6030   -1.1110;
   51.4100   -0.9110;
   51.4410   -0.9370;
   51.3900   -0.7840;
   50.7790   -1.8350;
   50.7340   -1.8220;
   50.7440   -1.7820;
   50.7420   -1.5740;
   51.1490   -1.5690;
   50.8980   -1.4080;
   50.9010   -1.4030;
   51.0840   -1.3900;
   51.1240   -1.4400;
   51.0080   -1.3340;
   50.8080   -1.2090;
   51.1020   -1.2610;
   50.7870   -1.0960;
   51.2390   -0.9430;
   50.7850   -0.9850;
   50.9630   -0.9800;
   50.9820   -0.9760;
   51.2120   -0.9290;
   51.1780   -0.8490;
   51.2790   -0.7710;
   50.6900   -1.4460;
   50.5750   -1.2950;
   50.5920   -1.2120;
   50.6230   -1.1790;
   50.6570   -1.1450;
   50.7310   -1.1550;
   51.2440   -1.7650;
   51.4310   -2.1130;
   51.5030   -1.9910;
   51.1610   -1.7530;
   51.4160   -1.7340;
   55.6740   -6.5170;
   56.0690   -6.2000
   56.5360   -5.9860
   56.7590   -6.0520
   55.4410   -5.7000
   56.0340   -5.4300
   56.4500   -5.4420
   56.3060   -5.2460
   56.0280   -4.9860
   56.0460   -4.9150
   56.5450   -4.7970
   55.5920   -5.1560
   55.8390   -5.0650
   55.7480   -4.9100
   56.0160   -4.7240
   56.0930   -4.5490
   55.9730   -4.3300
   56.1190   -3.9180
   56.1490   -3.9070
   56.0180   -3.7620
   56.0130   -3.6960
   55.9620   -4.7940
   55.7650   -4.5010
   55.8450   -4.4310
   55.8690   -4.4310
   55.6270   -4.2010
   55.8900   -4.2270
   55.7550   -4.1710
   55.7860   -4.0200
   55.4160   -3.7590
   55.7000   -3.6330
   55.4870   -3.5880
   55.2430   -4.8580
   55.7230   -4.8940
   55.4770   -4.5650
   55.5010   -4.5840
   55.7180   -4.7200
   55.4530   -4.2740
   55.6010   -4.2260
   55.0540   -3.6440
   55.0560   -3.5940
   55.3290   -3.4810
   55.3120   -3.2060
   55.0770   -4.5690
   55.0750   -4.2660
   55.0990   -4.1840
   54.9600   -3.9810
   54.9250   -3.9500
   55.0080   -5.1620
   54.9830   -4.9300
   54.9600   -4.4750
   54.7030   -4.4180
   54.0850   -4.6320
   54.1680   -4.4810
   54.4140   -4.3700
   54.4250   -3.5060
   54.3250   -3.4070
   54.6460   -3.5240
   54.7680   -3.3150
   54.9340   -2.9620
   54.6690   -2.7040
   54.6700   -2.7860
   54.6630   -2.2820
   53.6220   -3.0260
   53.7760   -3.0370
   53.3600   -2.9260
   53.5500   -2.9150
   54.3380   -3.0200
   54.0140   -2.7740
   53.7740   -2.7030
   53.8540   -2.7650
   53.6000   -2.4170
   53.4000   -3.0740
   53.2710   -3.0450
   53.2360   -2.7060
   53.0850   -2.5260
   53.3010   -2.3660
   53.3560   -2.2790
   53.2640   -2.1350
   53.3410   -3.4110
   53.2190   -3.2090
   53.2170   -3.0280
   53.2520   -4.5370
   53.3810   -4.3570
   53.0970   -3.7890
   53.2910   -3.7140
   53.1160   -3.2960
   53.1500   -3.1960
   52.8860   -3.2550
   52.8510   -4.5820
   53.1260   -4.1110
   53.2100   -4.1540
   53.2380   -4.0150
   52.7170   -4.0140
   52.9320   -3.9420
   52.7540   -3.6290
   52.9950   -4.0820
   52.9070   -3.5830
   52.9510   -3.4060
   52.6220   -3.8420
   52.4750   -3.7040
   52.6410   -3.2820
   52.7490   -3.4690
   52.5000   -3.3390
   52.1390   -4.5710
   52.1320   -4.3010
   52.5500   -4.0690
   52.2720   -3.9150
   52.4320   -4.0200
   52.3580   -3.8020
   51.7020   -5.1530
   51.7080   -5.0540
   51.8800   -5.1250
   51.6530   -4.9610
   51.8590   -4.9220
   51.6680   -4.7080
   51.9880   -4.6790
   51.8320   -4.4930
   52.0130   -4.3700
   51.8030   -4.3130
   51.8650   -4.2650
   51.9640   -3.6280
   52.0990   -3.8240
   52.2150   -3.4510
   52.0250   -3.1860
   52.3320   -3.1320
   52.2830   -3.0510
   51.8720   -3.4780
   51.9130   -3.3230
   51.8590   -3.1020
   52.3420   -3.4830
   51.5650   -3.9810
   51.5790   -4.1210
   51.6120   -3.9620
   51.6460   -3.8580
   51.4800   -3.6970
   51.4000   -3.3430
   51.6350   -3.3010
   51.7460   -3.3310
   51.4780   -3.1780
   51.4880   -3.1870
   51.8650   -2.8030
   51.7290   -2.7450
   51.0820   -3.6040
   51.1400   -3.7420
   51.2010   -3.4660
   51.2010   -3.5310
   51.1170   -3.3480
   51.1300   -3.3490
   51.1490   -3.0800
   51.3640   -2.9070
   50.8890   -2.7850
   51.0060   -2.6410
   51.2480   -2.7330
   51.4250   -2.6670
   51.0790   -2.5030
   51.2550   -2.4950
   51.3720   -2.3570
   50.6150   -2.4790
   50.5220   -2.4540
   50.6820   -2.2550
   50.9500   -2.1840
   50.6130   -1.9570
   50.7430   -1.9920
   51.0150   -4.4910
   51.1610   -4.6560
   50.3540   -4.1210
   50.4900   -4.1960
   50.6860   -4.2340
   51.1180   -4.2210
   51.0890   -4.1480
   51.2100   -4.1200
   50.5480   -4.0010
   50.7680   -3.9030
   50.9320   -3.9860
   50.2920   -3.6510
   50.5920   -3.7160
   50.4640   -3.5400
   50.6290   -3.4540
   50.6220   -3.3930
   50.7300   -3.4160
   50.6790   -3.2390
   50.8280   -3.0080
   50.9080   -3.2260
   50.8600   -3.2390
   49.9280   -6.3080
   50.0360   -5.6840
   50.2180   -5.4790
   50.0840   -5.2590
   50.2180   -5.3290
   49.9620   -5.2100
   49.9580   -5.2040
   50.1510   -5.0790
   50.4090   -5.0680
   50.4380   -4.9990
   50.3450   -4.7550
   50.3380   -4.6440
   50.4110   -4.4180
   50.5610   -4.4810
   50.8280   -4.5460
   55.0200   -7.3040
   55.0220   -7.2130
   54.8850   -6.9660
   55.0730   -6.9460
   54.8330   -6.8470
   54.7210   -6.8140
   55.1540   -6.6770
   54.7880   -6.5350
   54.7430   -6.5170
   54.9860   -6.5690
   54.6640   -6.2240
   54.6970   -6.2060
   55.0480   -6.2540
   55.0420   -5.9670
   54.9840   -5.9920
   55.0190   -6.1180
   54.9890   -6.1430
   54.5770   -5.9730
   54.6270   -5.9480
   54.5530   -5.9670
   54.6820   -5.8840
   54.5610   -5.9420
   54.7440   -5.8760
   54.8520   -5.8300
   54.2060   -6.3500
   54.4530   -6.0710
   54.4850   -6.0970
   54.1270   -6.0000
   54.2060   -6.0050
   54.3990   -5.9280
   54.2280   -5.9350
   54.5840   -5.9080
   54.2450   -5.8300
   54.4470   -5.8280
   54.6030   -5.8280
   54.3590   -6.1950
   54.3300   -5.6880
   54.3260   -5.7100
   54.5720   -5.6550
   54.6390   -5.6800
   54.6690   -5.7460
   54.4140   -5.5370
   54.3520   -6.6480
   54.4080   -6.6030
   54.4590   -6.6020
   54.5010   -6.3420
   54.3680   -6.4260
   54.5980   -7.6010
   54.6960   -7.4210
   54.8290   -7.4510
   54.6750   -7.3260
   54.5930   -7.2820
   54.3770   -7.3180
   54.6150   -6.7370
   54.4860   -6.7530
   54.4120   -6.7430
   54.4220   -8.0860
   54.4400   -8.0540
   54.4390   -7.9000
   54.4820   -7.7080
   54.2640   -7.4770
   49.4320   -2.5980
   49.4970   -2.5340
   49.2080   -2.1960
   49.2000   -2.1000
   49.2390   -2.0930
   36.1500   -5.3500
   -7.9670  -14.4000
  -15.9330   -5.6670
  -51.8170  -58.4500
   54.0760   -2.8580
   56.6790   -4.2960
   53.0620   -3.5530
   53.4970   -3.0560
   54.2970   -1.5310
   56.5000   -6.8890
   51.5210   -0.1100
   55.8690   -4.4320];

T=exp(hp(3));
L=exp(hp(4));
H=exp(hp(5));

type1 = 'ratquad';
type2 = 'ratquad';

nanny = nan(length(latlongs),1);
% the use of nanny is necessary because of an annoying matlab bug
lats = [latlongs(:,1),nanny];
longs = [latlongs(:,2),nanny];

K=@(as,bs) matrify(@(al,at,bl,bt)...
    fcov(type1,{T,H},at,bt)...
    .*fcov({type2,'great-circle'},{L,1},lats(al),longs(al),...
                                        lats(bl),longs(bl)),...
                                        as,bs);


if nargin<2
    flag='deriv inputs';
end

if strcmpi(flag,'deriv hyperparams')               
    out2=@(Xs1,Xs2) Dhps_K(Xs1,Xs2,type1,type2,T,L,H,lats,longs);
end

function DK = Dhps_K(Xs1,Xs2,type1,type2,T,L,H,lats,longs)
S1 = size(Xs1,1);
S2 = size(Xs2,1);
num_hps = 5;

K_time = matrify(@(al,at,bl,bt) fcov(type1,{T,H},at,bt),Xs1,Xs2);
K_space = matrify(@(al,at,bl,bt) ...
    fcov({type2,'great-circle'},{L,1},lats(al),longs(al),...
                                        lats(bl),longs(bl)),...
                                        Xs1,Xs2);


DK = mat2cell2d(zeros(num_hps*S1,S2),S1*ones(num_hps,1),S2);
DK(3) = cellfun(@(mat) mat.*K_space,...
    matrify(@(al,at,bl,bt) gTcov(type1,{T,H},at,bt),Xs1,Xs2),...
    'UniformOutput',false);
DK(4) = cellfun(@(mat) mat.*K_time,...
    matrify(@(al,at,bl,bt) ...
    gTcov({type2,'great-circle'},{L,1},lats(al),longs(al),...
                                        lats(bl),longs(bl)),...
                                        Xs1,Xs2),...
    'UniformOutput',false);
DK{5} = ...
    2*K_time.*K_space;
                
