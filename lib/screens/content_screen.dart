import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  final List<String> flowerImages = [
    'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/541092496_3787945468157954_3224403287258737462_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeF7khjIsYezTs4Eg8EXf1ZaSSek-VUJYNhJJ6T5VQlg2NPy9XA4Xh2NN7nSiClM34PlYexVwRBnIto-lDCwowDl&_nc_ohc=zG25vXMHwr8Q7kNvwHej2VU&_nc_oc=Adk3c8PUZDg2xbx1OGaFH7OrTVzTehbc_ZI-FQYV_Jzzgfrh4eUsBNHCjJPC3BUPqfY&_nc_zt=23&_nc_ht=scontent.fdad1-4.fna&_nc_gid=O0avZfWuUEk0iNntNIXJEQ&oh=00_AfeIQvwTWXFNQZICe2zwSv6pio8WEvXhSvpcMZoV7D2d2Q&oe=68FB1D6F',
    'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/540731353_3787945478157953_855664780081733624_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=103&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHq21azvIZTGPu2ucd2QSAjtkLZ0W6BVKm2QtnRboFUqZINFBvH5il_hBIkN3eGpyTkHl_Ftd4Q_gQcVE2WBqWF&_nc_ohc=Ak27-lEugOwQ7kNvwG9oegn&_nc_oc=Adn0QZi3wCsaMQHmkAm542OqY-YZMHxIsSSkR0-DDvtOER7EWimna0KORTCF73-nHao&_nc_zt=23&_nc_ht=scontent.fdad1-4.fna&_nc_gid=32A3kLM1QQ9QkjBlDqkQuA&oh=00_AfdH_Dq9UvS0wl-U49VpXBB_i5xmrcrreoBt0jRDMO399A&oe=68FB2085',
    'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/540763136_3787945418157959_7163203921672582061_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=100&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFf0UffpWnHKvZPSUKn-xDyJJ7q3V05Sd8knurdXTlJ35kuKxpGtEQqILrdoGFamRB4ukVm74Fq2rh4se7VD_C2&_nc_ohc=ebmjs0Kme8IQ7kNvwFLGt1I&_nc_oc=AdlU4RwrMLlzaz8vs1Ijd55czGk5R9ywPdgMXUwC0rtLXNDDXdEs9NIfvyrffl1NNYE&_nc_zt=23&_nc_ht=scontent.fdad1-4.fna&_nc_gid=wunuw3il-uQgmpRCKN8bVw&oh=00_AfcXYKpogqfmHzo9VSFLWbK6RgLIsIYwvclxCqJ_nHIBOQ&oe=68FB1A2C',
    'https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-6/540466865_3787945424824625_3765388159604168381_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeE-NaCnUwT87kD7G1RB-nPomz8p-DH9BYibPyn4Mf0FiJv-64mzanl3BDD4zQfuzSULgNkOpzTKTs7SPRoCVLES&_nc_ohc=Bd3BkfgrnzcQ7kNvwEIxqg6&_nc_oc=AdmnXkpzbcoF6BWwy-P3ZYFd_JHBGFteO-v-KyH937BTG1m_fPM6IpvqOurUHykq5kA&_nc_zt=23&_nc_ht=scontent.fdad1-2.fna&_nc_gid=C2j1V_Rt9ciZtNnrBGOZgg&oh=00_AfdvvhDU-2w-bIMVe__BzTK-0OR3xe7905b5Um9KJn2CYA&oe=68FB131C',
    'https://scontent.fdad1-3.fna.fbcdn.net/v/t39.30808-6/542747350_3787945508157950_1630594159858614605_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=110&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeGj9roYkbc0bCWVDIg-T9Z4J8z9w4yhWfAnzP3DjKFZ8Ki4Y54-V5Lxexovlu55rQiSVqcT96MjoBs-ShdpFdi0&_nc_ohc=W6_FIvG0ld4Q7kNvwEbbTWa&_nc_oc=Adm81u9-ZFFO2L3fImyFPVzg5KX9UyOzalZAt509X8H-AJL2QjWApI8qOFf2L2S-UnY&_nc_zt=23&_nc_ht=scontent.fdad1-3.fna&_nc_gid=LTSZ2k8-H713p2E6oAwNJw&oh=00_AfdSwls79lqzuTy7e-MFMKJNIMUgOkNT_tLoLE7KvVXclQ&oe=68FB0EBC',
    'https://scontent.fdad1-3.fna.fbcdn.net/v/t39.30808-6/540788393_3787945364824631_2327177101995921932_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=111&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFLtAnny7t4IhSlG5AxrqffIGaUCJPN_oUgZpQIk83-hS1vV1UUtA4tC7P2wJcYJfExFU7vjMOgANkvVq7p3c5S&_nc_ohc=29YEqn4kCWAQ7kNvwEzRjQE&_nc_oc=AdkQGJm8DPWyaKOuVJTc57kY3Uxbhbbul6QPdPstFxBcBfmrm5Ztwync3W7ZJS1K5Ng&_nc_zt=23&_nc_ht=scontent.fdad1-3.fna&_nc_gid=RnAKJ-GV6zNkI7nhrnKCsQ&oh=00_AffeJN4VTmiK4I-EbBzVP7eDaE3Jz6bwBQqBZjUjC6kjYg&oe=68FAF5C3',
    'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/512991638_3728872787398556_6015685367872210717_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeEtAD9Oiz3WxiXC5oGyzWpYNdA0Y_YSkM010DRj9hKQzXPPXJiBnyd4GsuigMHMVjinsecn_HF7hHYzDA478cdK&_nc_ohc=_V-Pd0F6pDQQ7kNvwFikncq&_nc_oc=AdnLpMMMVmPxCDvjpG0AW5VuCX89D34a8V6w9D3ZANhAcoQLW32d4QzItInzpzzNehE&_nc_zt=23&_nc_ht=scontent.fdad1-4.fna&_nc_gid=qfgf2UX2nlykhRmxgkX0VA&oh=00_AfcbdTvgnr1ZJHS9ObI6C6CqiuyD9MESSd4dwCYHJzNV0A&oe=68FB26A8',
    'https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/494637504_3681410825478086_6894106717463614792_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=108&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHxKvk734X_5ck8oiXvpVFZb7tqvXBbXEZvu2q9cFtcRkfYM7pW_wE-4lc02Owzjz8E52IGGNeYe3a_voZgCnqH&_nc_ohc=LRndfPKnXhkQ7kNvwEe2SwH&_nc_oc=AdkycpODyN8jD6kVPuDZuk0fJwZEwsnR_zXgH4Npx5zo692Jq1RJlVErcSyProw7CgQ&_nc_zt=23&_nc_ht=scontent.fdad2-1.fna&_nc_gid=UdwySVwLpj_1oxEMTMDtcw&oh=00_Afe5KnjUsrsbRYc4Na-Bld8TILJvhNyw49YYb9lQ2w26Kw&oe=68FAF351',
    'https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/495489827_3681410815478087_8548603293764609113_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=107&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeGNxfUVMEP_QdATuGxQxyIMtfnGKaXYaiy1-cYppdhqLJ-EtgYBvgQlivAnX2v2rBk9g68w4JML1hptgUbS15t2&_nc_ohc=qseMd7jegMQQ7kNvwFklZ3H&_nc_oc=AdnjEMbKWQwNVjbRu3nLRw038IQu4NZF0KyIEY5fsCFDRFilIFHD6eemvPqAJIIFjyU&_nc_zt=23&_nc_ht=scontent.fdad2-1.fna&_nc_gid=LyZZNh94Nfk-uAcosrWF8g&oh=00_AfdosoVpD7ZJhuu0BwWel4bdP-lU2oMeoj6WKOqWO6FPeA&oe=68FAF827',
    'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/495289047_3681410818811420_5281178546748641803_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=105&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFHIQ7k4vhL3ZXgU72Mgazdy86ymjm3qoLLzrKaObeqgujjHNzDGitRy0UySJ2u_FX9imV6bMZmoVppAXNGB4l9&_nc_ohc=NC1BmNJ_MVkQ7kNvwFvLcT3&_nc_oc=Admyp8gx4MtQZXy0LvQj4Ma5xhFuGagmtUhENAq5O4eOso0Y7DyXndkcR9b6WF6pT7E&_nc_zt=23&_nc_ht=scontent.fdad1-4.fna&_nc_gid=qm4QN8Mj9HHc9Pf-AqU5VA&oh=00_Affd95ffi3bxqYoi70kzIsYp4g2-IwWVD8FgoiMyVWuMJQ&oe=68FB2A6F',
    'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/495278307_3681410698811432_8103218732713123411_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=103&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeF6_sjXA4VavsW-naJI-nQYTh-Zm2foyotOH5mbZ-jKi40a7dSFkBP-cz7Ouk166Q6IQPb3-VTm5HH0f6mtxBQ2&_nc_ohc=4SGlqBdZhUcQ7kNvwG9Zkju&_nc_oc=AdkgR-B7NhSDOc1PtfFeXpnS0RCBD0jUfK47wwFbjfJUf_KUZnv75KF8ch76OcJfBAU&_nc_zt=23&_nc_ht=scontent.fdad1-4.fna&_nc_gid=6eKy5-N6u2SU8N0KRDLi_A&oh=00_AffJkvg4yKl6i8aSgqqBD-LvY1oKUO822ApCzj2CxVq4qg&oe=68FB21CA',
    'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/494643305_3681410598811442_7528744274779977730_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=103&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFAMEKid9yx1lcjN88GudTxdD19cSF1-EJ0PX1xIXX4QlQSa-x4ze3aeecQmpQVqq2oeKQfISxNNqe6_X2zfPoL&_nc_ohc=VVxx4uk-4n4Q7kNvwHr02Le&_nc_oc=AdnRDd0Wap1dgRrf_DCyOM4SB85_VJS1WNDuJm4reHmgLjqUWzaTE1YMoGyZajgLerE&_nc_zt=23&_nc_ht=scontent.fdad1-4.fna&_nc_gid=4VHOj66bpjIVSAx1Ai2JOA&oh=00_AffOoDqdNC2W6PK34OoC2N5N43WD-qSImA3iboP8D0JIVQ&oe=68FB11FB',
    'https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-6/494356026_3681410872144748_3991170178109514150_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHPn5PD7k86PBzXrthFTdGBEbvzXE1ad9kRu_NcTVp32abhoDSKc8K9kN78ziAWuaUhowxWiXy3awyZ0RaZ6RWU&_nc_ohc=Y_xMfN-H4ecQ7kNvwEYX-XV&_nc_oc=AdmrvdvKn35BeQ-11KdZxcVfxVdpTr8WLKGH4QjSUQ86UOwqlUMFWOlRk_0jmtq3ZFg&_nc_zt=23&_nc_ht=scontent.fdad1-2.fna&_nc_gid=4MKtoXecy2UYdtP_cFn_dQ&oh=00_AfcfgnFS00OO_ajzxJYN1BmaiwFipbtSLgvIT4Dce0DZVQ&oe=68FB268A',
    'https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-6/495538471_3681410812144754_1913057369593791091_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeE-88pg3RBvIhSloxQTbOvJZ68D_ZxualtnrwP9nG5qW6_E_WgVpE_GVV7GVp92D666DfXSWuyzT75iB4oqfXUg&_nc_ohc=K4dRjAZzyk0Q7kNvwEsfw8g&_nc_oc=Admp14hEwIMcuDsT2bgfWAtQNeGa8-w5hDSOZkfLDUQ91Q4cNlhOcr9h-wPnA23C2IU&_nc_zt=23&_nc_ht=scontent.fdad1-2.fna&_nc_gid=7_GgxHuBeyXcHkKzsSe-3w&oh=00_AffDMNcCZpneP7XHCyTYUoryzCHzLmd4e9wIZR5GTcUjfw&oe=68FAF648',
    'https://scontent.fdad1-1.fna.fbcdn.net/v/t39.30808-6/495147157_3681360435483125_3160534830057387145_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=104&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFr5Fk7NasMqlDVQBGAoS_KuTGKt3Ea97O5MYq3cRr3sz2YFChS_HHZUMANyaeyop7wU4NuToVsBo4EBAdXcEqp&_nc_ohc=uO_vv796jroQ7kNvwG80_e9&_nc_oc=AdmGT9Zom1Fp1Dkng9nswfzLPujTqicRNYuqkWLmsCDGkhzU8mlelE8cd74abbypxzA&_nc_zt=23&_nc_ht=scontent.fdad1-1.fna&_nc_gid=sPLYJ-B01z2ySkZPlRNgzg&oh=00_AffUG_MXhcIrw40axDsjDt-Fp3qh_DInqYP8Jz2hx3MEIQ&oe=68FB28F9',
    'https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-6/495361977_3681360238816478_7402667487186649705_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHndtmBLEjcHrNUI2DsnhEvlGpy4aQkFHqUanLhpCQUegQJLzCn9E2jrSSPiDocNmfAQKT1l7RBF73VSsEMTJhj&_nc_ohc=MlL7KsOoOtUQ7kNvwE3nSDT&_nc_oc=AdkNmmFn9locnHVqYCUCQQEnzWZleX_ApKsYcFSgszGNAT1qXSx6G_HjZN0hX2qcOaE&_nc_zt=23&_nc_ht=scontent.fdad1-2.fna&_nc_gid=h2tef3EXljPeH4QAnYh2eg&oh=00_AffxLGOdc4Lfwp2hHSHh1BGcTx-gLCI6uINzZE6wcIGaaA&oe=68FB0C19',
    'https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/494644970_3681360345483134_4643024042796438280_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHDLDMJxr63MTe2o2y-UnldiSQXDoHGL7WJJBcOgcYvtehS9dBX09GPkHxkNAXq9rLJ7gNgrUTMyYdSH37Z9WvM&_nc_ohc=-YBjwBhXhdQQ7kNvwFg0Wk4&_nc_oc=Adnmax14YOUENq34f2xxRMYxLp6W33I49vRurZ-DyBeB6Sxhj-xbM2wcnwSmasZMggc&_nc_zt=23&_nc_ht=scontent.fdad2-1.fna&_nc_gid=kTo_lN_EdJa5_ep2QoP-8w&oh=00_AfdYQAWb3hk-d-yoXPloHxYtwwNQtiHXqO-ACGpd30tLpQ&oe=68FAF97E',
    'https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-6/494682488_3681360515483117_5946312821867342867_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeF5lVKWVm9G0FT9C7mk-qoQumoax3hMqjG6ahrHeEyqMaT2o5-HoibjzTyglcCU1WCKvF2cmqluPit0zbLDHNiF&_nc_ohc=ecZT-0QDMu4Q7kNvwEt9R-x&_nc_oc=Adk9J4Im4IfYJuWIVIqq6fCxgS5jdprIaqTXZOLQ2tyedIvs2Tm9iqpB94lhR0jkycI&_nc_zt=23&_nc_ht=scontent.fdad1-2.fna&_nc_gid=gY2o5mn6nmM_nlXTNy3gwQ&oh=00_Aff8CMS0w4KL3oyWHUL0gHZnzBDx0TWQYTXCyzQDTnUorQ&oe=68FAF6C2',
    'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/495160054_3681360548816447_9072483689757810086_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=103&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeGpIW9FCTfMTp53DWM21HwjAJvqdUrcUBIAm-p1StxQEsxwlqzKnPJzqpGkzLB3QmWLeFeMqUBK8GP8efQnwLAm&_nc_ohc=WnE-kyoVkWgQ7kNvwEWtPAL&_nc_oc=AdkZKpH-6FTFC9paJQLngvyPIb9N9NASodntme-U7yxEexBWKjIuIzUV7juDdivRFzQ&_nc_zt=23&_nc_ht=scontent.fdad1-4.fna&_nc_gid=tKPVIuKf8vKc-Tv1koLVUg&oh=00_Affg6rrMwObC5umdWhEJdnqXpLX_6M-qlb8QIBC4oBQNPA&oe=68FB11D6',
    'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/494677778_3681360225483146_1976254312459920014_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=103&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHH--5JfoU7TQ13xMiYJNFK0AEFRytomRzQAQVHK2iZHFTwqCVWeItrUs-UlLdzPxjoi6HtNqJjnOh9rclvW7XS&_nc_ohc=9OsZge99DtEQ7kNvwG2mxDe&_nc_oc=AdlozCpSTRE-hAXQZMeqY17sfAC5Lqn_oxqIWOpGqdMVzKgMCo8EY14phQB2YahNXO8&_nc_zt=23&_nc_ht=scontent.fdad1-4.fna&_nc_gid=Sw0HFbskEI1TiG9DYPv96Q&oh=00_AfdF7xjTwQBl3Lg3Cnj4jGN2qGJ6pBECiNzTU-hlgiXywg&oe=68FB0BC0',
    'https://scontent.fdad1-1.fna.fbcdn.net/v/t39.30808-6/495330222_3681360402149795_8508952000539759003_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeF1v3eX0iaotsFkjXRZdSapRAVTySec-t9EBVPJJ5z634oZ4nUkB3NzAJrhO3xmW4o3OEz8axyzRfeRxGWZ2YzG&_nc_ohc=ytOhwXF-UR0Q7kNvwEiRVOS&_nc_oc=AdnocjhxSQoL4B5ZnX3LmOHasmq8jxjMMod0ZtvF7Kholo_AQLPABsfRhZv9YdraBpk&_nc_zt=23&_nc_ht=scontent.fdad1-1.fna&_nc_gid=hTnIxr_DU8I9cXSO24qD7Q&oh=00_Aff2zlJPPQMOtpvqXMyZmr7Yrd67PrmYhtzI4cTTkR1GvA&oe=68FB1948',
    'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/494677001_3681360468816455_3926359561512692795_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=105&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFMVKn0ZhzMq4v7ZGx1vEUiB8hqF-k4NlgHyGoX6Tg2WGloWN5t0dKpQ9YNFzXhf-3tctaUPTNJwZZ7qzF3r81P&_nc_ohc=IZ6LfVpV8WkQ7kNvwGgJFVk&_nc_oc=AdkATbveCMKc-HUxHZZJ_MPJEdDgLcCoZ7lQa-2XZBIU5YS3ljjC6sLlWd56WWBJM-s&_nc_zt=23&_nc_ht=scontent.fdad1-4.fna&_nc_gid=uJ-pxIUjOAm7O3TuqsktzA&oh=00_Afefv38l3mIUiXchad3FAziWNuLNyJGqSHfZD1GPtGGWJw&oe=68FB11ED',
    'https://scontent.fdad1-3.fna.fbcdn.net/v/t39.30808-6/495394034_3681360518816450_6051912315867043556_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=111&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHNrK2X9B7dtnKF_0SYBIReLzzmpLYjFyEvPOaktiMXIds-Mw5Yzrs7acpkK_CVQZepVG45IM-JOyFoifIWWj0X&_nc_ohc=zOIEP9hEKTkQ7kNvwFzog6j&_nc_oc=AdmkQ6MU2Qgia7o3QD4Xs-KhRJ2kuK7BWCrtNaFmif_iCsEwYvQ5AzDJKAkJt55zCcA&_nc_zt=23&_nc_ht=scontent.fdad1-3.fna&_nc_gid=9y1WL8vSzg168cg-ozGlZw&oh=00_AfcR-kswXVtVU3_rZw4mgDLUGjMGRo_CdfY4zFvBZjWkog&oe=68FAFC12',
    'https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-6/494679076_3681360448816457_4370594838374381648_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeGWhY8M-wCF2tOaosZoHixrtajTuYinJM-1qNO5iKckzxSVngcjTGusXWML_EScv_BngOQfDVNtWDK7DoIl6yhK&_nc_ohc=uDWVVScPgX0Q7kNvwEbRZGY&_nc_oc=AdlZMx9rxpg-5CbnUSAu3YhOgBei_nZXR0MXtHWL_L1fNa2N6P20e1JH9NaLKPCx0Uk&_nc_zt=23&_nc_ht=scontent.fdad1-2.fna&_nc_gid=fusyQooi_WR5Fds9q_LQvA&oh=00_AfeXkwGkOAj3BbdWniV240whtW1nOU9IPBuZBGV34nIoGw&oe=68FB1153',
    'https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-6/494692731_3681360458816456_4118374006826687741_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=102&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFF1Mcv0ocrr-bhg9dUKRSnDzvfzpZOzxAPO9_Olk7PEPR78ph1X4WcA-Cl723YYU15_Jl2Gz-fzikL1Paq5WAW&_nc_ohc=gK_6wdG9lMMQ7kNvwH5MsZs&_nc_oc=AdnvtjDKH7QgJ6HFhTu-pxiWZHWQFyaa5EVsD4zVGwYutUIs6Cu34ZgD-w4azKEbHR0&_nc_zt=23&_nc_ht=scontent.fdad1-2.fna&_nc_gid=9Z9hcC7rs1BgzE3nZbDVCA&oh=00_Afc2c3mg1WIfY3dDHGRv8q1kC6k9Sj0J0FYO86wKfWUD3Q&oe=68FAF705',
    'https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/494680672_3681360255483143_3760085049452598023_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=108&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHO6mxm7Wf4M7Mv9QCJEXP51HVs1HlhpRDUdWzUeWGlEIAE25bi3iFsbM24U-9PIZYp315octhvbCOmO_Zr8tCk&_nc_ohc=tBBgRz4ltyoQ7kNvwG1525E&_nc_oc=AdnM_ylRzbtRt55d7alcL2Y6c9XCrchh9veAIHfKTcOiTfVabKP5gb4WX_vX98ForIk&_nc_zt=23&_nc_ht=scontent.fdad2-1.fna&_nc_gid=rAVQO0sTNBEk2ubwqbVZnQ&oh=00_AfcrULRWqU71KGe9v6yWb5zNfOtin9Y5ONGa65Mt1HS6fA&oe=68FB0634',
    'https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/495153859_3681360392149796_627632903213854204_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFbTJcr-xuDKC291BhfS0B6bhnWlQU6Q1duGdaVBTpDV9UDC-_CKgiMU1GARX4_PrIcAnwXtwPehj7uW6q-SBqH&_nc_ohc=p7zSj6d_TR4Q7kNvwHHRVt_&_nc_oc=AdmypHkKM9i36oI2-vyMfeaiX299veNn37BCD48VdP6Zb-6Sh2nC-vexC5To6qa-E8E&_nc_zt=23&_nc_ht=scontent.fdad2-1.fna&_nc_gid=K4F36CHgumVTs3Qezld1Yw&oh=00_AfcBJfLdn-hlB7BAJ5oLf6zB8wrbItQImwdnnQIbYgTkag&oe=68FAF6FF',
    'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/494537935_3681360488816453_2740586306330983696_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeEvxpFDluy8heNBZqPZIwW7lpOrTV8jZW-Wk6tNXyNlb2dR-T6ArAsM1mYu1l2mh-tvzl89ea3wuf5KEprVuz7Z&_nc_ohc=OrF23R1klEYQ7kNvwG5smwu&_nc_oc=AdkRhDaisqcfHohvraZRSZmz2w3e_AWCXvODN8BwBH-646bW-K0IEaYgFbumgGidpUA&_nc_zt=23&_nc_ht=scontent.fdad1-4.fna&_nc_gid=MOD139js3ml3aLdlJy0L8g&oh=00_Afcj_xhoKo-iRQGL3kYT5xD73-1Jl-C2tUK4atENwvWMfA&oe=68FAF7BD',
    'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/493607968_3677300899222412_6301767611030779601_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=100&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeEh39IB-4nWHQkkOWqg2snHjCH4KK3Y0HyMIfgordjQfDbr_fVAUrVusj0u_F00tV6hMIlkMUsFT-zQinlBN4mo&_nc_ohc=LPqGwj-DEYcQ7kNvwF-53UX&_nc_oc=AdkDtE0FM1_9fuZ7KoSip66GDGJ0zNBX_WhuCsb6AjMhinbBluhPBh60M0P6dArPyJ8&_nc_zt=23&_nc_ht=scontent.fdad1-4.fna&_nc_gid=obNa0HCpWD3zaHNKH8hEyg&oh=00_AfcD1vLIDndkGXx3lNV3Bepx5-57CIijsc36ZBcexUwJHw&oe=68FAFA0F',
    'https://scontent.fdad1-3.fna.fbcdn.net/v/t39.30808-6/493542794_3677301052555730_4778184314373933519_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=111&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHTsxYkcNhyGkkdR9cDR6VYW8biJofzeVNbxuImh_N5Uzbk324AVP7s7M59oHj1m_n6saGmRPw6QVuZxzCnpWmq&_nc_ohc=cvCEzf7qAOQQ7kNvwGbIh-P&_nc_oc=AdnGXZ9ie12vFigPWnz--foq3A-bHqf14xMB7ChVNaOBknVuD_e5eKef48CLeU4LMP4&_nc_zt=23&_nc_ht=scontent.fdad1-3.fna&_nc_gid=wJjiYcQZCeTQTrSj6RmaGQ&oh=00_AffDKzzG6shAqjK7W540A-3l3eOQhe67l1PHoZ06ysXhFw&oe=68FB1A39',
    'https://scontent.fdad1-1.fna.fbcdn.net/v/t39.30808-6/493320726_3677300922555743_712247245283712700_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=104&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeEy1bp9nhKcV9j4o3WvnRuK__9W3viiGan__1be-KIZqfNhr6qRG3JOCPiwq9qVEpUPrnXaJ-gWm9ATDVJU5ZIX&_nc_ohc=swZmCUdkUmoQ7kNvwE050vF&_nc_oc=Adkag2DTBXvUcEXsKV1nFqkj4kym7TdJezgadvgsZpLW_PeL_IDOkEQTNTjLt8wbk70&_nc_zt=23&_nc_ht=scontent.fdad1-1.fna&_nc_gid=R5XFkfvNAGqSsYVe1M-hww&oh=00_AfdtkGKHNH2CamuQP0aPytLoY-u9wZTAtCVN4M-3BXRwaw&oe=68FB195F',
    'https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/485658164_3640782042874298_1452739569553330441_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=101&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFsi81azCgmROSAygLA9e9j4DmofoKpCjrgOah-gqkKOtU7QoNLbFuETOems6tAuBIbTC7RGSCuXNE5jeCE87-i&_nc_ohc=qqjxEW4jMkgQ7kNvwGOLEXE&_nc_oc=AdkyZ9wN6yDpCU-ptaFXZgKW9tN9shd73CkpZCZoLmn-HdCi_XxBypo3UBbmu7iHQqo&_nc_zt=23&_nc_ht=scontent.fdad2-1.fna&_nc_gid=l_MaTCdJdTd0nXqHFbFjyg&oh=00_Affo8fpeNFIIWSUZYqU52lAk9nagxOh7lFG26mYW5Yj0yg&oe=68FB298B',
    'https://scontent.fdad1-1.fna.fbcdn.net/v/t39.30808-6/485594345_3640781979540971_1897018852276687298_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=109&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeEEiFuJADqAS8OeOxSsFV7sia31DKfIEyyJrfUMp8gTLKDw4wOA-Ur_1QKjqt1pu5qs_sYBH5APqqjjy1LK1Nn-&_nc_ohc=rT1lnFioaE0Q7kNvwEenNc9&_nc_oc=AdlurUEGT0YIx6_WdeuikODinXq9FWV6OHffRBgzrKJ2AlybkYoVeSzR8oM8Z_RrkZ4&_nc_zt=23&_nc_ht=scontent.fdad1-1.fna&_nc_gid=N8ydxwQaM8LOTD6DboH-vQ&oh=00_Afd5LN9TPOYLM0Snkv3wjqbFaNEab32MjLh4eh-etsVg1g&oe=68FB0E88',
    'https://scontent.fdad1-1.fna.fbcdn.net/v/t39.30808-6/486101214_3640781949540974_5436989818385471109_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=109&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeG2ldXNU57pi-Vd2NDgxpQXH1coRhVsNPgfVyhGFWw0-PFr3qqUfo4R8ix4MUb7-KkO3hxmsfNebz4_mglyowoU&_nc_ohc=_5Ys2OLMbnUQ7kNvwGX0SvI&_nc_oc=AdlD6XYkw1Jx7ldHZrgY-rFBndFZl2e8x0IVl_cRWPPbKY55-x2iTyx45iAs2E-zFtM&_nc_zt=23&_nc_ht=scontent.fdad1-1.fna&_nc_gid=PaFSM73xEur42WApYod0_Q&oh=00_AfeXSdWzoNdk8k95zXnK6cswOnbjkBEJr0T7rJFXNYBYxA&oe=68FB0322',
    'https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-6/485775678_3640782036207632_2378968846510605741_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=102&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeG6JRZTMP2Po4Qv7W-95QT4_8mwgM6A4Tn_ybCAzoDhOQlReTwjTGPxNWEyFKbRpJN7IcWi4ZGtKzfLybDtGlJP&_nc_ohc=fkOzLuVlEjUQ7kNvwEb0OHQ&_nc_oc=Admpy0MfQNjjq6XD3JB3DF73mglLedhr0XUfQK4SyKk3_RObORMlIdGzBpbyflbIQ7U&_nc_zt=23&_nc_ht=scontent.fdad1-2.fna&_nc_gid=y93LOd8QPP-FCk8k_qQCmA&oh=00_Afcko78OsXZn-Vd1C-ooFO2OrMJCEXdR7EURhwVN3MuglQ&oe=68FB29D5',
    'https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/486481797_3640781946207641_2937532343583281087_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=108&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeEiO34_wnz84hYZTJzQ1bE0mDjIJE1y5Y2YOMgkTXLljRLHErZjVZ6UYZUNjuAbUrTk_KDXEZXpkY4OLcCF_4dy&_nc_ohc=swdpUS6ioCoQ7kNvwE8S6z9&_nc_oc=AdkezSZ2WE5cdTK6i46PDsPfGzjMOQijbA3mJWc2CnYah0A1bORDhKyUA0iBjd25Y-4&_nc_zt=23&_nc_ht=scontent.fdad2-1.fna&_nc_gid=tOgr3C2UVGvhp7hLqaYVnA&oh=00_AfegsaYyYDzuHFR98uGBzUOmbRU0d5_EdDtSKZFv5zaayw&oe=68FB12DD',
    'https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/485767467_3637916673160835_8562464387891541757_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=108&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeGsA5cwgCB4zSmsL0GYz71RI5JvF7TuExAjkm8XtO4TEPcyhXiNlx2UHGFu5jfy6hOmMC7yQRd6e_yVW4qMaWkE&_nc_ohc=HO2tVqcT7TUQ7kNvwEgxWzo&_nc_oc=Adl9isOZRHvbZKJKRRdmuJR_0YqkLAIMhIxHv8ZQeJNz910JpcstJmAxw2w4MJW-UcA&_nc_zt=23&_nc_ht=scontent.fdad2-1.fna&_nc_gid=fQCttsKcfK1FZXnMqi2GTQ&oh=00_AfcArjlUnLmRYSpilReBDdhUWVEGRpF28WZbrTO7OXE7dQ&oe=68FB09A0'
        'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/484272478_3635459603406542_8741498843982301498_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=103&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeGH2aw03tL9XyUldrR0krN5-IrvW3uoYZz4iu9be6hhnMo1NI-3ynP46mMG-JEFSbzKjbNbdI4y6P3kE_R1d1cc&_nc_ohc=v3sFebpXlhwQ7kNvwFBoE_I&_nc_oc=AdkN1TlEWpsb_7-C2AXxsUn5vxgqM0XiudrTnzYwE1TcKmvFtrJvfydABkvuUWYH4ec&_nc_zt=23&_nc_ht=scontent.fdad1-4.fna&_nc_gid=sfm1k85SO8kpJCBkzGIi4A&oh=00_Afc4ndTFGZ2kHviytxKyJj2xh5EeFS9_0s3coSl75CcJkw&oe=68FB0BA8',
    'https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-6/484034876_3635459680073201_1385693558400838640_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=102&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeEroG3jy_P2lqUajiJtKymZ60s4dpbNhzzrSzh2ls2HPJw9URpi9q_SVJ1ufB0daDaFHpWNMGvmirlSpdTAiW63&_nc_ohc=Ly_xR4-Zk2UQ7kNvwHNX5Um&_nc_oc=AdnsvbMk4NcaMVJ3V5TvrwlxADzWAmwBdDH7Pho4Z7kIuNQW_qPufX966v8NDtLKats&_nc_zt=23&_nc_ht=scontent.fdad1-2.fna&_nc_gid=ZxhmomZr8JW7I13v0gkJrg&oh=00_Afd7Jb1OhjEQq4b1-fFhzGRpyH1kteVuutmVDRwgM_Ij5w&oe=68FB066E',
    'https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-6/484027872_3635459693406533_7954318842044660935_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHNMFuRbeMYoJ02caf_CBYv9kIZrWyfNGT2QhmtbJ80ZCB4SzduyQmxIMHP-jU_xfgeiHAMT5WKsctjJS8kFqd5&_nc_ohc=I6ZR0KI93tMQ7kNvwEDrPa4&_nc_oc=AdkiMKPn0WMGyWgYKWjN31iq3LhGuMW1fmoyHmZmmX6F1nCwr2TBjET9XtvvhH7hFXE&_nc_zt=23&_nc_ht=scontent.fdad1-2.fna&_nc_gid=UkBkXYDFJjU3EaJ5sg4Mlg&oh=00_Afe_5F8VPs91PjhNvRGBoWhB1NQbcX0hEN3-vi1z4ZA0Vg&oe=68FB2239',
    'https://scontent.fdad1-1.fna.fbcdn.net/v/t39.30808-6/484649896_3635459710073198_1709562925510210569_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFSEOWn1ei2UXD4t7zBAN2nOTMpr56KmuU5Mymvnoqa5VBR0euJJe9PeE9_N8bU0zFF3D1Da4dK88dCeplt3V2h&_nc_ohc=qkAkNxB94hMQ7kNvwH_CS8p&_nc_oc=AdmdyCJUZg8MNogCjJi6nprKhJ4YexMtWmgw_dtEEsMDwXtWy6tkZ709EeSsx4cA7Q0&_nc_zt=23&_nc_ht=scontent.fdad1-1.fna&_nc_gid=0kqFp5iYhHB7e6b0U9PMPw&oh=00_Aff2Do3U2fAp-quAZJvV4uis8QOeggJLk3twIZkNfYGlMw&oe=68FB0302',
  ];
  final String sun = 'assets/sun.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.pink.shade100, Colors.purple.shade50],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // 🌞 Mặt trời nhỏ bay lên (1/4 tần suất so với hoa)
            ...List.generate(8, (index) {
              return BubbleSun(
                imagePath: sun,
                delay: index * 2.5,
                index: index,
              );
            }),

            // 🌸 Hoa bay xen kẽ
            ...List.generate(25, (index) {
              return BubbleFlower(
                imagePath:
                    flowerImages[math.Random().nextInt(flowerImages.length)],
                delay: index * 0.8,
                index: index,
              );
            }),

            // 💧 Bọt biển nhỏ li ti
            ...List.generate(50, (index) {
              return BubbleParticle(delay: index * 0.4);
            }),
          ],
        ),
      ),
    );
  }
}

/// 🌸 Hoa bay nhẹ
class BubbleFlower extends StatefulWidget {
  final String imagePath;
  final double delay;
  final int index;

  const BubbleFlower({
    super.key,
    required this.imagePath,
    required this.delay,
    required this.index,
  });

  @override
  State<BubbleFlower> createState() => _BubbleFlowerState();
}

class _BubbleFlowerState extends State<BubbleFlower>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double xPosition;
  late double size;
  final random = math.Random();

  double get duration => 12 + random.nextDouble() * 8; // 12–20s

  @override
  void initState() {
    super.initState();
    _randomizeBubble();

    _controller = AnimationController(
      duration: Duration(seconds: duration.toInt()),
      vsync: this,
    );

    Future.delayed(Duration(milliseconds: (widget.delay * 800).toInt()), () {
      if (mounted) _controller.forward();
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _randomizeBubble();
        _controller.forward(from: 0);
      }
    });
  }

  void _randomizeBubble() {
    final width =
        WidgetsBinding.instance.window.physicalSize.width /
        WidgetsBinding.instance.window.devicePixelRatio;
    xPosition = random.nextDouble() * width;
    size = 25 + random.nextDouble() * 45;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final progress = Curves.linear.transform(_controller.value);
        final top = height - (progress * (height + 100));
        final sway = math.sin(progress * math.pi * 2) * 20;
        final opacity = progress < 0.1
            ? progress * 10
            : (progress > 0.9 ? (1 - progress) * 10 : 1.0);

        return Positioned(
          top: top,
          left: xPosition + sway,
          child: Opacity(
            opacity: opacity.clamp(0.0, 1.0),
            child: GestureDetector(
              onTap: () => _showFullImage(context),
              child: Hero(
                tag: '${widget.imagePath}_${widget.index}',
                child: ClipOval(
                  child: Image.network(
                    widget.imagePath,
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showFullImage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => FullScreenImage(
          imagePath: widget.imagePath,
          heroTag: '${widget.imagePath}_${widget.index}',
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// 🌞 Mặt trời nhỏ bay lấp lánh
class BubbleSun extends StatefulWidget {
  final String imagePath;
  final double delay;
  final int index;

  const BubbleSun({
    super.key,
    required this.imagePath,
    required this.delay,
    required this.index,
  });

  @override
  State<BubbleSun> createState() => _BubbleSunState();
}

class _BubbleSunState extends State<BubbleSun>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double xPosition;
  late double size;
  final random = math.Random();

  double get duration => 18 + random.nextDouble() * 10; // 18–28s chậm hơn hoa

  @override
  void initState() {
    super.initState();
    _randomizeSun();

    _controller = AnimationController(
      duration: Duration(seconds: duration.toInt()),
      vsync: this,
    );

    Future.delayed(Duration(milliseconds: (widget.delay * 1200).toInt()), () {
      if (mounted) _controller.forward();
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _randomizeSun();
        _controller.forward(from: 0);
      }
    });
  }

  void _randomizeSun() {
    final width =
        WidgetsBinding.instance.window.physicalSize.width /
        WidgetsBinding.instance.window.devicePixelRatio;
    xPosition = random.nextDouble() * width;
    size = 20 + random.nextDouble() * 30; // mặt trời to hơn một chút
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final progress = Curves.linear.transform(_controller.value);
        final top = height - (progress * (height + 120));
        final sway = math.sin(progress * math.pi * 1.5) * 15;
        final opacity = progress < 0.15
            ? progress * 6
            : (progress > 0.85 ? (1 - progress) * 6 : 1.0);

        return Positioned(
          top: top,
          left: xPosition + sway,
          child: Opacity(
            opacity: opacity.clamp(0.0, 1.0),
            child: Transform.rotate(
              angle: progress * 2 * math.pi, // xoay nhẹ
              child: Image.network(
                widget.imagePath,
                width: size,
                height: size,

                // ignore: deprecated_member_use
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// 💧 Bọt biển nhỏ li ti
class BubbleParticle extends StatefulWidget {
  final double delay;

  const BubbleParticle({super.key, required this.delay});

  @override
  State<BubbleParticle> createState() => _BubbleParticleState();
}

class _BubbleParticleState extends State<BubbleParticle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double xPosition;
  late double size;
  final random = math.Random();

  double get duration => 6 + random.nextDouble() * 4; // 6–10s

  @override
  void initState() {
    super.initState();
    _randomizeParticle();

    _controller = AnimationController(
      duration: Duration(seconds: duration.toInt()),
      vsync: this,
    );

    Future.delayed(Duration(milliseconds: (widget.delay * 1000).toInt()), () {
      if (mounted) _controller.forward();
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _randomizeParticle();
        _controller.forward(from: 0);
      }
    });
  }

  void _randomizeParticle() {
    final width =
        WidgetsBinding.instance.window.physicalSize.width /
        WidgetsBinding.instance.window.devicePixelRatio;
    xPosition = random.nextDouble() * width;
    size = 2 + random.nextDouble() * 3; // nhỏ li ti
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final progress = Curves.linear.transform(_controller.value);
        final top = height - (progress * (height + 50));
        final sway = math.sin(progress * math.pi * 2) * 10;
        final opacity = progress < 0.2
            ? progress * 5
            : (progress > 0.9 ? (1 - progress) * 10 : 1.0);

        return Positioned(
          top: top,
          left: xPosition + sway,
          child: Opacity(
            opacity: opacity.clamp(0.0, 1.0),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// 🖼️ Hiển thị full hình
class FullScreenImage extends StatelessWidget {
  final String imagePath;
  final String heroTag;

  const FullScreenImage({
    super.key,
    required this.imagePath,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: heroTag,
              child: InteractiveViewer(
                minScale: 0.8,
                maxScale: 3,
                panEnabled: true,
                child: Image.network(imagePath, fit: BoxFit.contain),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 32),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
