PGDMP                         |            james    14.13 (Homebrew)    14.13 (Homebrew)     X           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            [           1262    16384    james    DATABASE     Z   CREATE DATABASE james WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE james;
                james    false            �            1259    16540    college    TABLE     �   CREATE TABLE public.college (
    c_collegeabrev character(225) NOT NULL,
    c_collegeid integer,
    c_school character(225),
    c_conference character(225),
    c_division character(225)
);
    DROP TABLE public.college;
       public         heap    james    false            �            1259    16629    drafted    TABLE     �  CREATE TABLE public.drafted (
    d_playerid integer,
    d_teamkey character(225),
    d_playernumber integer,
    d_firstname character(225),
    d_lastname character(225),
    d_position character(225),
    d_positioncategory character(225),
    d_collegekey character(225),
    d_height character(225),
    d_weight integer,
    d_age integer,
    d_draftyear integer,
    d_draftround integer,
    d_draftpick integer
);
    DROP TABLE public.drafted;
       public         heap    james    false            �            1259    16568    player    TABLE     �  CREATE TABLE public.player (
    p_playerid integer NOT NULL,
    p_teamabrev character(225),
    p_playernumber integer,
    p_firstname character(225),
    p_lastname character(225),
    p_postion character(225),
    p_collegekey character(225),
    p_height character(225),
    p_weight integer,
    p_postioncategory character(225),
    p_playershortname character(225),
    p_age integer
);
    DROP TABLE public.player;
       public         heap    james    false            �            1259    16651    stats    TABLE     �  CREATE TABLE public.stats (
    s_playerid integer,
    s_seasonyear integer,
    s_teamkey character(225),
    s_playershortname character(225),
    s_position character(225),
    s_positioncategory character(225),
    s_passingattempts double precision,
    s_passingcompletions double precision,
    s_passingyards double precision,
    s_passingcompletionpercentage double precision,
    s_passingtouchdowns double precision,
    s_passinginterceptions double precision,
    s_rushingattempts double precision,
    s_rushingyards double precision,
    s_rushingtouchdowns double precision,
    s_receptions double precision,
    s_receivingyards double precision,
    s_receivingtouchdowns double precision,
    s_fumbles double precision,
    s_puntreturnyards double precision,
    s_kickingreturnyards double precision,
    s_sacks double precision,
    s_sackyards double precision,
    s_fumblesrecovered double precision,
    s_interceptions double precision,
    s_blockedkicks double precision,
    s_punts double precision,
    s_puntyards double precision,
    s_fieldgoalsattempts double precision,
    s_fieldgoalsmade double precision,
    s_touchdowns double precision
);
    DROP TABLE public.stats;
       public         heap    james    false            �            1259    16617    team    TABLE     �   CREATE TABLE public.team (
    t_teamkey character(225) NOT NULL,
    t_teamid integer,
    t_playerid integer,
    t_fullname character(225),
    t_division character(225),
    t_conference character(225),
    t_headcoach character(225)
);
    DROP TABLE public.team;
       public         heap    james    false            Q          0    16540    college 
   TABLE DATA           b   COPY public.college (c_collegeabrev, c_collegeid, c_school, c_conference, c_division) FROM stdin;
    public          james    false    209   %       T          0    16629    drafted 
   TABLE DATA           �   COPY public.drafted (d_playerid, d_teamkey, d_playernumber, d_firstname, d_lastname, d_position, d_positioncategory, d_collegekey, d_height, d_weight, d_age, d_draftyear, d_draftround, d_draftpick) FROM stdin;
    public          james    false    212   }.       R          0    16568    player 
   TABLE DATA           �   COPY public.player (p_playerid, p_teamabrev, p_playernumber, p_firstname, p_lastname, p_postion, p_collegekey, p_height, p_weight, p_postioncategory, p_playershortname, p_age) FROM stdin;
    public          james    false    210   �k       U          0    16651    stats 
   TABLE DATA           6  COPY public.stats (s_playerid, s_seasonyear, s_teamkey, s_playershortname, s_position, s_positioncategory, s_passingattempts, s_passingcompletions, s_passingyards, s_passingcompletionpercentage, s_passingtouchdowns, s_passinginterceptions, s_rushingattempts, s_rushingyards, s_rushingtouchdowns, s_receptions, s_receivingyards, s_receivingtouchdowns, s_fumbles, s_puntreturnyards, s_kickingreturnyards, s_sacks, s_sackyards, s_fumblesrecovered, s_interceptions, s_blockedkicks, s_punts, s_puntyards, s_fieldgoalsattempts, s_fieldgoalsmade, s_touchdowns) FROM stdin;
    public          james    false    213   V7      S          0    16617    team 
   TABLE DATA           r   COPY public.team (t_teamkey, t_teamid, t_playerid, t_fullname, t_division, t_conference, t_headcoach) FROM stdin;
    public          james    false    211   Y      �           2606    16546    college college_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.college
    ADD CONSTRAINT college_pkey PRIMARY KEY (c_collegeabrev);
 >   ALTER TABLE ONLY public.college DROP CONSTRAINT college_pkey;
       public            james    false    209            �           2606    16574    player player_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (p_playerid);
 <   ALTER TABLE ONLY public.player DROP CONSTRAINT player_pkey;
       public            james    false    210            �           2606    16623    team team_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (t_teamkey);
 8   ALTER TABLE ONLY public.team DROP CONSTRAINT team_pkey;
       public            james    false    211            �           2606    16646 !   drafted drafted_d_collegekey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.drafted
    ADD CONSTRAINT drafted_d_collegekey_fkey FOREIGN KEY (d_collegekey) REFERENCES public.college(c_collegeabrev);
 K   ALTER TABLE ONLY public.drafted DROP CONSTRAINT drafted_d_collegekey_fkey;
       public          james    false    209    212    3514            �           2606    16636    drafted drafted_d_playerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.drafted
    ADD CONSTRAINT drafted_d_playerid_fkey FOREIGN KEY (d_playerid) REFERENCES public.player(p_playerid);
 I   ALTER TABLE ONLY public.drafted DROP CONSTRAINT drafted_d_playerid_fkey;
       public          james    false    212    3516    210            �           2606    16641    drafted drafted_d_teamkey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.drafted
    ADD CONSTRAINT drafted_d_teamkey_fkey FOREIGN KEY (d_teamkey) REFERENCES public.team(t_teamkey);
 H   ALTER TABLE ONLY public.drafted DROP CONSTRAINT drafted_d_teamkey_fkey;
       public          james    false    211    212    3518            �           2606    16575    player player_p_collegekey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_p_collegekey_fkey FOREIGN KEY (p_collegekey) REFERENCES public.college(c_collegeabrev);
 I   ALTER TABLE ONLY public.player DROP CONSTRAINT player_p_collegekey_fkey;
       public          james    false    210    209    3514            �           2606    16658    stats stats_s_playerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_s_playerid_fkey FOREIGN KEY (s_playerid) REFERENCES public.player(p_playerid);
 E   ALTER TABLE ONLY public.stats DROP CONSTRAINT stats_s_playerid_fkey;
       public          james    false    3516    213    210            �           2606    16663    stats stats_s_teamkey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_s_teamkey_fkey FOREIGN KEY (s_teamkey) REFERENCES public.team(t_teamkey);
 D   ALTER TABLE ONLY public.stats DROP CONSTRAINT stats_s_teamkey_fkey;
       public          james    false    211    3518    213            �           2606    16624    team team_t_playerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_t_playerid_fkey FOREIGN KEY (t_playerid) REFERENCES public.player(p_playerid);
 C   ALTER TABLE ONLY public.team DROP CONSTRAINT team_t_playerid_fkey;
       public          james    false    210    3516    211            Q   X	  x��Kn#9�׿O����E7�̇�KYU�zX.�%Ua���-N%�|��s�9�\lȔ��t"�?�CК"�#ȹ��WoMD*��$Üs麪ն����{4C^���jW�=�!�5?���~�Mm�����R��{(�	I���r�~1��U���Ѫ�-�
�&�O�������MI��{���l^����yN��!��>����P���dF�Y���Ꝯ݌=����e���fd�r|8�(�c��	�����8� �49�/�y{(Mk�c���V�rt7]͙T=	~٠g�벤]��|��M��)�8�\?��{$
*)�O)"�q�lc�'�3�C���8wM�h����-�x���r������V�����X��G��2B���V�n�'�����ǔ��ތ=�a�)�S��`-tio]]Y�����.L�ֺ��v{�{�*����,�.]˚�	ޚ���"�[��ڪҭ{4�ϭ�?����4ǆ��J��O)#lu�i}<�е+-a� �������#i�JW�o��_7�!e9�fd�@��RD�û��x?�8���RD@އ9�qj�;k~J��`FSWħ*.
�c�8���ќ�QN7'!��RD�γ�m�+��#$�U~Lq��?Va�ԭu�.��ߩ��1��5���&ڬ�cg �쭬Y(�C�H\Ԧ�x�af���O)"���q����5
�1�!El�.W�-E~H��<�\��,P���oE:�^?�E�XJ�S�c�}��^/��lcf!+�)"��A?h��֎(l��!E$r>���H�VP���"J�?����%��=�r�Sg]sބtR���jΒǓ0K�)�W���>�Qxo�ǔ㭴�(�r�C�Y?��]��,9��E��RD��'}4M��;Kz���^�S��w�z�}�~v�a��SD���ٹ����ǔ᭦�L�h�$���RDP���Қ0(L��1E4^3v�;ޗ/Q���Qk}ioL��Z1̬I~Lq���l�|֊�S�'�X��^�ӷHZ��W�t~L9+��l�S(���Q:��us|�
j����?��?��^�X�j7�@b5?�����n�=t�i[��d�q~ʋ�U��ڙ{��*B��Y���@�����)E�����H���;k�� zL�ތ����_c�f !.�S�8-��e�Y��0��S��a=���J����R���v�	��i�g���8�S�	�������!� zJ!Skӄ����\$��)�)E�x3���M� N�)E8��N\��w����"����g
��"���M��;ڭGp��)E찮�w���g��	�1E� |e����n�أH��)�)�9+gX�5?��c�+W��h�kWZʎH�&৔��
foy�^_�֬ ?��ʫӤ�6�^>���Y�)edZ�|T��Tb�S�C��]��6�;}��t��Y�UvHmX_�5�s�"?����7#g6�$�)�)ED_�J}pG�l�IP���"ʮ^��:���u
~Jw�)w�;w���|��Ϭ!f��|� ����&
��cd0!N÷�N)#ʩ͞t2=)<���S��dF�X��@�ৼ��_�c�kS118k���R��zm۶���=��AP*?������u��MT6)��)bj��n��x��?����?�vojެN�H�O)bf]�c��uM˚��q@��SD���/���V����!E4D3~r����j�pS"P����f�a+�S�c��^�\��y�o4g� r�3�W갮/z��{�U6-��)�T�7ch�d-�
ު����t�z=-��-�ee�f��q��juu�j�LU
~H���Zo��1w�Y~Jκ^�'�T�f���#�6���w������S��Yy�.{��Z���"Rs�w������_�cf(�+Y�O)�YY�s����O�v�����-�͖�{N��s�Ì)#��J�c��2xk~L�x�kG���ʳ��o�Ϋ�ٺ+uE��
��"�c�H�weCY��,��?�g����ưB~F���{�
*�s�c�Hwl����?�cV�C���c�p1��Lc�C�xjs-]U;�}2T�$��|K̽z�m�.��=�A>���"�%٬�t�	�!e��f-w8	*K�O)#��H\-�g৔��_�=�A:Y���c���t��D���9�1E�}����7�6��V~J�,_m����-b�[,���"��x1#k�w���"����3х�Iw��Ҡ,?�gm���>���%��Rı�Of��D�N�S�xp7d�����M�v�;�F33�C�ȳ>�qi��'ll���1�1Et'��s̙�S�S���f�����9F������R�����c���>��Q���oggg��$=      T      x��}Ms�H��9�W��a��m��8�C�ER�U��K�D���z	@��_��T�̮�����>ecmu
Z�tDx��f~B�/74�Ki&��i�B�=ʢ��T]Ho�L�.�g����C��/��f6t���O���3t}�|/"? ��C��u��?��"z�l���_PD��ˡ�4��\�< Zn�]C�0<����G�,Ji}5ti=��>��9��>A+��-� ��J�Gg&�*d)�.�p �mH�D��4y`0�Z	�*�;�/BkY��Y�߇.�����%�Drw���ԢF}��@$�"	bZNЧ�IL����M�z���m�.�g0 ���u���	��h�$�&�����q�����е��چ���C��'h-�r��؆ <$�G|���H���j=tm�����MW��Q��.�G؆d�h�f�$N���/"���$;I�7�.���_PF+�;�����@�y)���G+�#�Eu��V�j���G|�mHR;�#���L�t�oʿ�?��l�<�$ '��Ŵ�A�le��}��~�v3����Ѕ�ې����<Ta�#���V���/���_P�]�]F������(�?%݁`9�}^���
��QH"7�h/�{.M��U�Z�?���_؎d��;�`�Z$/�J$a@�oC��3(�h��{�w�~�/�n�����:W� �w�Я���o�z��.�gP�V2�P�iǌ�q ����_�ݑ��8��L;�Qk��Yχ��_P��RHQ�+��g<)�;��:�|�-'C�+�D�D�����m�es��O��G�7=�uh���s��Ms���H���y���=p�F[��_/��(
�'���.s=t=���j;"aq׎��&��"��I���$�l���V8���j$��ݱ1r;�d���SJ����u�	��k�]ې �>J˽��9,m����uc���3�[�pO��hj�{D��CC�� �H��g$�nе�0��Q�]G���$�
�j���	��vt�$
�g$�K��~B�hd��+k$�zw�\{c�Y";h��|�l2�`i�˂n^{�b��е�Jh�%�O�c��Gu�����?x�Z���Yw�7t۷ ��3��͵����D��@�&�����c��I/���t��LZ(���Hh�4�7���о�ȿT	N$�g��u�ڃ���D�t�x�Th�MBJ�@$��Ud"�mE~���]j�b��#r�ٚÇ����V��T��Ѕ�D���0k���M�<�C�Jl�G��h�v0�ي>}�<d"!�6v�C�O�_�(vi�V@�C���d�J$��=�,]Ho0I��#�B���l�)M�ħ5���;�Q�~ٳ;[�͊��<}=�t?�6$i'e7�ڿۀ?��'�A�>�^X�J #�����/�-X0�j�2���V@3x�F/a �,�C^#�]�H�ڨ�>:3�U!!w���']�=i���u�6Gn�33PE~B�"�<2~X���|��n�g'�;[&�j)��'�f�r7S�s�;��D2~�H"A?k���F~��d�.�g)=�_A��2`��l����CkG�H�i��G���е�j?�"ן>��;��u�|����A7E!K%qw96"���������A-ħO˷�w��U�<t��N���V�˿��1������zX{��ӧo��k��m~���>Akې����'[Aw%/e�E4�b����gYa�@����%�Db��F�3������fJ�`_���E�� 9�ڻ���n�O��-���֥,7���Х�s�~�T��D�n �jw+˪ְ�� e�`j���1����=�������6g���d�tY?���A^�v��E�Ŵ]F��U^��X"?衩�V�Y4$���_��߆.�gP��B잱Ϡ������BA���z�
����;� �ο��h+�/H$�_�ǵG1]��!-qa�K��#y�����j�J��sD?�:6�!���/T)�#�M�R��3����#aqF���nr�#�i�|f@��>q�<7\��������#Yɲ�+U���:ϽБD���1tm����VB`*�6'Y���OX����іH"l"	������O�x��n5�M�-�����.��C��,��mG�;���,��ۑD^�0��u���=�mH�,[��%jЮ��?������H���?�d1�߀��Q�?�z���g-��N&��5Z�c^��7��ļJ�ِ�Y�{��][����O��Ї�+Y�y�ڏXy�X�B���a$i�`�նbSh�_ǌ�dY��F���޿�Dr+ʪeX�_޿a�%�$���J��@#�"�nVhw�֎ �;JL#<F[n�j+̲�V7��k��t/j-w���'lp�ZtO$���TЎp�Hp"	���V��|���~�~F�������m��(�m�m���q�s]:��[:?N�b{��~�2hv�#1	��Oh���k��৑0 �(����1�l�]Z�W��ISB�6$�! �Hܑ�|Ď��3����[m7��G�3�� �ֹ֪3'�/��Hbd1w$~Wl=�~Ez�<S����D�^�.�G؎d���� ?�pGra�7rۧ�M�����\#yh[����'���H?h%�J5���,�.��)M᷶��z������ t�zziG[�=��(��0�_�k��e>m�^�����B��Е���9*���6$�}.��{�{�� ��K�gc����b���y挤�#nCm�vu��]F��V[�ǿ�Hn�nv�x�+�ɖ�u����!�<�][�� �����5Z{^�w٠�уGG�#&�=�L�|�g�٘��Z��#�Ξ��N������H����Ol�����V��$��7�H\��|��+kT̢;ȷ�wX"?�>/K�v�a���]�$�i9"?�ESJ���e:���A
��b�oppH1.�އ��(����k�f�7���e��?ʢ�/��2vkk� X��o0۽�Bb�1ۓ�n*!�Oji�'\q̂�������e�T���r��g$G[~F�	�Z%E���z��5�Ď�F	���0��k�2�#i�d���e;M��	�FlG� ��;~Pt\�#7h�E'c�E}���\��q$��/�_�#I�g�z����I�]�Z"q�(d�;{�D� k�;~�Dw���(�巡K��x4��q��w$��d�0��o�y�F[���0�=�V-}��'[��j�<t��Ƒ��u�~��?��2�BG���z>tm��t$+Q�C��+�Z�;Q���-ۑ�t/�zj�u���"�K>j$��4�A�HR��>	Y��~ڎD�J���w��I!��	9��F�w��Ab�18HL�J�Z�x��ڳѡ-�)>�؃�у�$�lmy����3�дϸ��GҜ���OX���V��S
N$^���2���=�g�v�_�z�覍v�5z� z����|���h��
�}&��,k��}{�>z0 b{״��2��IBsu��ގ���Nv,� �o�\��#	.[E����B�
y����!���i��AkU�ܙ��`��=�:뿾��5��3��l��'pK�,����c�v08H�>}���Ŀ�G���~��z������A���Q��ΰ���]�J$�	���2H�H������U!��.��R�^�؄�񃦪2g�3U��͎�h�K;��fF[Q�v$�>= o�����b5�уV��T�q�B�߾�w�����hˋhoڸڭdQ /V�;�уG	xB����#/�i
���4��
x2k�'*!vCW�'l��A�yY�#�H�:)��4����f.��G�����Lh���9�"�7�NEl����%>-&][�0}�Bh-��>Vl "�\(-��)9omA϶��H>I�0���Z�neY�����*w��f[�#?h��)*g򟫡+��� p�	�iB��}�|Z·ԫ�L�����Ҋ��=����H����faۑ���    �����O[�*a��i#�}��g[6�d��Ր ����L��$h�i�ɖ�V+�7�3��s!Q��6$�;�`_�h�^z!�=si����o{�;zPO�D�H�����C"'���Z{�2pH	}���Ɲk9�+*�
���\C��?~�6ߡ�1���Ҏ�od��t?�̧ES��c��C^=)yx2i~7ˁH&�x'��`q$~��l�#���I��,o;�o��\B�k�@$k��3Z�D�K[~~���Ч�w��3�!m����^Au��H�� x8��'��q�����l�G�4բ�C��Ε.��J{�8~ح����C�1p��zE�Gq�r�,
)N�Tb�����;�����ȣ巡K�Բ�<߉S��eN��B�q�[�jk�8Ǒ�?//s��@#����I��E>�Z"yUe��5t-��E�m�kGb;tCr�!%2<��ol�_a_�ϠϪw����H���E@"��o�ݤ]7e`��t���y�B�M��Y�߇��?ح��n�O�>��`@$~u��K8t$m+�Pz-��"�����vkk������5�I���v�n��k����B��84U�6�gة���?�QV;UV�&�7�Ƒ�̲��][�0[[�V`�6>jy8�C��#�~k�H�yY�U��mk�^[��u��ܘ6W�D��4Y]EϠ��%��n5�уVrw��!3�����ؑD^K.�/��^F[�������.�G�������@,�v�іo��c�nL_����4����v�gЦV��#5t$wG�0/�������V���m�mi%
����j�Z�q_��C��A��9w>+�W�j�č�Z{��^�Lh�잡'[t�_ey��a����6�xƲ�B��t������p�:zm��ȁ����A�"?_:1�l̺I���+���~���'���U��:�H@�yYC���<b~N]sO�:��BxtS	����u����wY"?h�Y�ʢ@�ڡ'[�H�R��r������ 6�r�˿�\�ݱ&�x_�E�ق�l��3ڊ<ϧ��Х������C�'�
�����_�v�~i��1�>v$a��k���G�HU���A��3���v�5~��Z�.�Wpۍ���X�8cБ�^ۑ졍��"w��b�=#=�QTGYjU����|����v$!����P�KS-�z�pR`[Rچ <��y$0[�=K[^�6$;�4t!}�f�'�=���=h��_
2`��d+�&/�.��������1?I��,�kY�yj<a��@��Ѱ��b��K���^��r�����V�c��$���o�-�����%��$�і�u��"?�i��Ҷ]�W	n�{T'�,����I	�C
~ή��{D�w��m�8���7t΀�y��l���Q��!� �H�n`���F[.��i�2�}V9Î��Z�Z��\�PɄCG�&�3�%|��اM��r�GB�چ�^������c<�a��u�+}��[[��V�	l�(��]��z>tm��b���Q��"t��W�t��/�N#�<E4`���%aw��4٢[6�.-��ҡi�k�s��������`i�ܮ�V��>�*kٲ�j�kZ��Rπ���������HnEYa�r�l������H��}z�C��/Lɭ��|rh�ũ�m���4��Z��A+YU�Ѹ�,��{��{	m��7);>��Z�,�<w3w���� ֊Cb{G#	��cБ��zҘ���+�tU�v�l`=�	~G��Iw���6ti=���t��2D"wǼ|�5�o��G?��(���3���F��_�n�;s�^��5�:�Y#[O�� �#�w$^���
�4���Х��Rڼ��y��D]П��D�?�ڨ�>:3�U!!������׵��B��QB�kվ�]�x�����[[��:)��tG��4����_ߜd=�����m�?ۯ��?WCW�X�Zu=�8���J-[Nu^���&�۟ۺȏ<�����8�^�>��$
i�k��ĭVu�k�3;� �8t���\��Y�l	n=A�۾���d��k��f�m��伵�q��4�m�1͎���^���(��_Q��;z0m1X�M�I��6eu3��~A�K+u�����=�B�߰���f�PZ�q�9��F�$�S�n��(v�KS��G�|��	d�DN9�����y����K��$��H��A@b���>��@om}-�U
P؎d����-Lp�H��ӑxiB���е��5W'Y��۠��������1*���K$�����;)��H�<���&͎ZV���Ih�J�v3��]B�`0�z?H�!��H/���xt?1�}s����.�O�J��C�+�F2~мy�
���#	�n��F���쵅�����S/��;zФyj4�C�c�����-�L'ˡk���AT�<~�iR �[:6�
��:�������H|���d>��_][�0Q��7�0����Z��pR,� �����xq���Y��|��?���_P��m.\��1?��I�ȳ-K$���%��G�Eʅ<�$dpGŴ�����92�P'��HspO8�V+��kw$a'�$�b[[~B���nHڷ�B���9��#A ��� �e�!�݋�w$A�!j7�i��kd�\��C��;zн����T�jDu;��7v�}1tm��Z(���H���*���F����PZ�nG�a��^8l�<�VI����
ڳ�6��T	�[ȂHVrw���)��v�;����g$�D^ _�8�'��+[��(�s��yU]K?`�ku�H��1�H��|��d�J[�;���H$a7 ��|Zݬ���_P��oBxɃj*ȩ�߰����=�N��k�Hbl"	����g	�߀A)�h����y_ϡiļ��?�:���Dh$~zA#�c�\�'��mD-�#LKќr�Oh��у��u���HBl"	��;�rZ�������E�;�����V�	�F2v�F5�љ	�
Y"���ۻ��d����<�[y%�;.}�{���X�-0pH��ںx����B��Vlq�>�8��$w=C������M!�M�["ɰ��K/$��(��в��k9�ԫ�h�.�G����Ζ؊,�і�ݎ�hu��O�P�~HQH� Zz�Q���)���Aߤ>�R"�#�`0ں�"~��"%�h��e�<��GY@O�,� ������w"���h�E�H9G�c_�9���
���%Vl?hR�'|��# �k��!"I}��D�ܐ�� �MQ�R�Ts�H���V$����е������r�Y@@+���\+\p ��f~�>������ʟ��g$F#)���"�ܠ��2 ���}�H2��K���7����q'���G M��Fێd� /���mG�O$� Qak�&2�0�����MH?h��e^U��Lîi��4���OCڊ����_�bwD���¿���D˿���/� ��E��).y?��7�_�3�QԵm�F[,��p"����o���	�Z%e.m�
膤���[���gv�z"��	�n�ABb�]����_џ�,�J��1�0���N�����A׹�`���w�k+�xm>݋Z����v+�5pSB��+��d&
�Ci\�-[[�wG[�G3�і9H���-	�ts�����v�5~�JV����"1��8$$�Yg��.����C��;�&OZ�i�:�����TZ��-/�`�zt��L2�jp-���
�O@w�	����	d7b�B#I:��<�ċ��:�[�=�rwz?t!��n���o��*��["�nHLGr�k+��6�>-���Wv�Jz-��C��X�񃖪��k�Vَ8�F[�j{K$q� �|�-�EL���E}��a�s���o��Cl���tG[��� ы����� w��
]�l���%��B��$�n�	�򓀁�|�!gG-�Z��~h%�� ���z�
����TU�Zt��"?��#�����ǎ$slmq    ��l%�ا2v�w�����.�g��0�]ZL���~AAF3�Zʺ��0�hk���~e��ȁH�l�4�4e���xl�9��f��<����e�����EJ��Bh���Х��mI��e�j$�����5�)iw�7�БD.Ms��9t!}���t�l_]B�`@$,F[��V��<��h:����<��/�!�\hܕ�6jw��ۼ���3��a��u��g�G�~���o�,��������>/K�K�_0��6�xIz!�$��	xЃIH\�WU���5)�(���ZV��Rk#?~�Z�:w����:,F[~�MH�߆.�gP��V�Я�m�[��5��D2������GXX�xA�#9���/R����K�{=z����3�����ck����ܮEJ0�c���9��y_'���>A�?A,�d%wGy�:	�����&~��Ǵ�}���u�
�����(5��������˺��}@�+e��_�H�Vqt~�&�Flo��y���o@��97"I^�3���^��!��a�E�8��n��9z��A�'�υ�r��n#z2�3���䑔��>���)����4��4�m�=⨀�vt$~v�k+m�^�і�A4�#��}ˡ����k��>ǂH��V�1j7``#e�z+r`��H�
�H�A�����w��P��IN$�=�H$}��:tm�6nT�N�ָM߀L,����d� ��=�xme����d���������^A��:"���� ������l'/鞑-�̖�/z�%�P?aaϠ������j���d��e)j9t)=���op�!�O����D-������uȵ%�1��L��FC�'[Au#�Ӏ������^� HG� �6�(�wB8��xI׳1I�3ȵ�5���E�
{�8~0P��� 鞑D)����C���5Ѓ�/Bk	�	�hk��1�B�H�����F����b.���bl�u��g�� �o�_T0�H7����v?��(USU��"퇼Ş=�\+�}���s����|��qk+h��:��u�l�h<�c��%�������g#��me]"i[�-��V��B�����	��/ݡ3	"���у�0�8�
�0�k�Ci@3�˼ Ih��%�Bb/���H��H|�c�fqĀH��nvC�Э,C�+l@��A�y���k�@#�2�%���(f�"�"ۯ�>ȦPC�����A��Gg&�*d�J��E>0b{�a������n�=���|E��}Gb/�G�~G��apG�w��/�is�n��t�+}@m��*D���l��,��4U�ʑg[F[�������nې�{�Ҵ������}N"��~��������,��< ��Ч�@��v�d�α�v�%����Ζ��g$~�9lw݈��J�i��3���^���;z��s!��ۑp��J�N<��4y���~A��C��\]I���\��BK$c�T���o�O�����Dn��z>tm��<s׎=�2)�G^vgk�0~p����w��~V�#	CZ~���A^h$��}}ھ����u�K$�ǯ+�I!��|��]{p�#I�#�4-�%�GQc�\vgk��U~z9"�:�$��/�.4$�=�i�����y��ۖ��D2~�JV�j4�"�K$�G�����S�E�z��sER ӈ%0�Ga@$�{�H"��w$.��_Y����уG^;��iH�N��e�����A�iH��h�Jz��Gy�nH�WC��3ɿ�QR8H����kwSz���y�� rd�G	��e;�D˿�H��#�&��C$"�"����t���|Hb��Z�Z��\���g"� �x����]�Ӥ�j���C��.�WX"?�1��\��m^������@$~����ZÏ�ӄ=��|E�E��H�b;�F�v;?apמ�t�꺐��е������Pt������HVB�������D\�H|s�n"O�G�BWЁ�4�<
]]Ho�1���y�E��<1�qg��<��.-Tu��^A��(��%��F2��D2r0�#9���H����е�c"?�����kN�_DY��YiԱ��HƏ�H�2�T� l�$�&?� ��1��om�mפ���ӧ�K�����Yt$��סk��H��k��)������Q#[���_eD��p'\v�5~����͙H���t5�0c`��4�O�ĵ5Dbn���n�v$�m�?E�L�s5t%}���uG[���Х��3�Cw?���L�6ߡ��0�G<�Z}�H�V7�V~F��p�]�52��P�ќc����g�]D�mG� ��c��۶][-�x�����?~��%��gv�z�%���A�w۽$j;��е�
�������<ۑ��y�b�T�� ��`��v5#��ome1}O��}�^�v6���K�	4��H�'�υ�r/`�H8����C$!��/���_P��T�Gf�����p7
�hk��q�c�'��t)3x��K��eQHq�>?���s�l�1A�
����A�{�H2D�d��?���G�La'�Z�_ �v�~َo��;��D⹴���#�6�����-����I���G�3��W"�p��e��vs�8���H��E	�lE3�`�mَd���7u��a�:������e�H��V�(�1�c�H���������`0�⠑x�;�;���o?�4��u�3�`N~����#!�G�Iֹl�}���|ӵx���u�(������d���x+�W�y��f���/�����#��c~����s`2���a:����c�$�&���6~�H��}��Rѭ,U��]Ko��C#�`�$�D��e;,X\�_��
\�q@�\�'\9EşC�+�\��@$�yY7�g�o�!��H +�	���0j[����~����pʁӰ���d�GY�TYI�Ι��\�HBI��]�w4�Ъ�/G�7�sG�$���l�}�� ����F����/�i������ȋ�z����<H�����a�z���(�-�e{˖�GQH��u�#�<�~9�a;��n�c�p�����qw����x�ۘ�Z`��Һ9�%n>���B y�$K/I�@#I|Z4�~|�C��5 {G� 6����Y������4���<���E�A��{6چd����B��$������Z��@"	<Z�'��Е�ڜ��C��
	"��e�WU;e6��6�xf��$���CJ�0���5/��+[��BD򧨜m�C+e0��îCJ&[^lvc��H�/��	9"��a;������ի,
Ԗ��a�ɰ�(�QH���s�nۑh���D�p%L�j���j�l��!�*�I�2��ui+��m�����N��@�!?x��ߵ{i�!��-�G�z4;j��C�x��O��Fk5~�D˿T)p�Y��mH∶�/zAfRv�	*��?�% �JV����"1Ʉ�e���]�=�$��.ݾ��{�/�> {R:t=t}��hk��Z��LE~@�F2�H�KZ{2�lBӑ�/m�Z#[�ڎ ��}��~��#9/m}m%	]Ï�B��NYj7�zZ���0,���Ο���!������F��V���;��������hˡ/;��oF���0ڲg$�$���1mj����hޠ_\��[g����������F[qBsU�W䞄yY�򀻸e�������� lm��9������E�=A�6���������>�O�@���Б����M$�߀?�&�d����u�
Z�U�}�.��Hۧ��&�A��#�l���؞0p��"������tSCK�FA�m�k$M}�5������\�#�\�}���~A.-�I�F ��[�N�L9��w���{�W�J�%�!��O.l�f-'�k�-��v3Q�Z;�DU9�#=�Z1����J�Y�@!	�s^;���c^T���1t!����ۅ��Q�B�x[��B��QWjϢ��EWHҘ�&%�H���:�sێ������8G�#��d+e��1H R  G<���w1������3��Aa�:�v� ���������v�6/y�C^���Q�=�'������Hֹ֪3'@9��ʖ�u$�Ѝ�~e+�h���������r���GA �˺��}@�o��$�&/�������b�����������Ls�2z�+�xd����,��z>�$��(%x��+��������Ѿ�;Y���C��8Xȇ�#��h����]A�5:�]���x�a����۪qR���n����I�M$��]�G"I\�MsӒ]I�������YhT)�J$��-���H|��߆.�g��]�+�/B� �l�tD 0X�2ۿ�ֿ�Y$"	�#&��k��E�{�Nu,�'[݁w��W��T�Q)��\ ����V�1�"��r������?h&
�Ciй�ÂH|ӑ|<#�g$�Osc�ێ8fkK��AA���mU��9���ݎ$piu���"���A�,T���k�ڇ�K�:���o�(�C���ziz�HD��4E~2��;B�#�;��&R;��ޡj���/IH��_�s�.��փ*�_��F Z+]��Ъ�%�N��D���Q#	"�M�G�tĝzB�f�GY�O�K[����dն�� JT�_It��7�9L�Bڊg܍C��ʓ(�?�=l?�N�����ͺI�2��
\��{�ʢ��+�����?ٚh���i��!�s�_��%�Ч�	��0�)Ms�� ����3�+%�cʢ#�Q?�XˀAG�{���08�����&��g���/�]�?چ�Y���`��ACr#�4$1�]ڪ� �e8ɟC��/ho��ߐ���B����G�=Lh}5ti=�|�(���7��q���vڲ��AM}�5���a����ÌAG4oH�A�,��d��/ xt$�i$~pa�y4��oUR��L���ġiSj��h��� �H/��ZE>}��:tm���Zֲ:]Jh?�R��3�� �I#��m�o�~\ڊBI�\h-�w��ةF���xh"��I��8t$�{a��l	���q�9ʃ�8j�&eS��4t���4S��b������#q/I���5u^@���F�;{�ۿ �e�o�䜙�ėx$c ���!^%�J~ή��=��(q�D�]�$�i{�n��t-�P�w�"o�o�-EQ�.�����Aۼ,��a����k_�;��I@���%��⭀6ۢ�8�y��:m��M��\?�u'����%�$	Y��ܫ�|D�4'�|�o%�񃇇<�Ζwa�7�hu3��~AQF�\k	}���-�r�%mf�.�g0 ��l��I�M$�T��I�3#qiR֪����C���,4l��G?�m��

�\⑐f_n���_���C���F?���˿Vj=h��א�B�%�ӈ&�D�%�#9���k����9t��N���{.�Q�p��LG!��.t$1��/���_Pj���r���E����;1p��,<��_���e��q��8ItAkO��ȥ���W��sĲ%d�dnǡ#�:[bo�pH�2���V���
��֡ �9��;�Q�'ܦ�j$��sD��@풗]۳�A�U�Ӄ8��-	��o5��5HA "��H�̻@$�����>t���οmG2t}��̊����F�]"�<���o(�k�8z0 �+Q�ȡV<:�n`{��4���ll�.Q�`�izPO�I�F2~ж)D��E䠑��"Ih��E4�˿�E��?�YıV[���mE�^	��H�&�10�o?�)d������R�g���E ���a�m��ߨe��䏡k���@�]#)�m`������ 1��h�����	}oЇ�=4����>a/��z��N����*2 ?L�IK.K�4�0���@��5���\�5nSB7���F[�z�7�h�����Q��z>tm���� ?��6�g�Lz;�=h%tu�7]�Hbl"	ܤ;�j��9��Ŵ�_� �;���rή�H @�u^�
����֖oV�>v$�o��
|��B�VJK�CZ+���*�		�<����4�8�ESո
�c~����.�G���������~G�]��(���E/�h!N�˱WU-�؃D ���>�tP/��D�Yw��:^[��L�j�]�=H?x��B;�8�A�I�0�HV��+�o�c~fb[m�; �D˿T���{&��H��K$��� ѥk-ްeW�~9B/m��lqhHl@��A~|A"I"Z�ϧ̣���Wc���!�p����;~X�����%�{� �I��9t��A���=xt$��E�ԧ5�������ր��ƶ7�Z��A[���H|���qi+i�}1tm��}iK��ȯT��|��H��V4�ۑľG뻡K�Զ][��A{m�c^@�#ڥ- ��:��0t��Ad�v;���9D��tu%tO�@#���A��U�!�~�CG�:���g�K�hd�ݐ��:��>~�O��3.�00�?k흆$e`��~���g���z���%jܮmH��y�[D����u�=<K[AD+Y�;mME]#��ێ ��F6�pX8myY7�$|�WH�dk��{�_�U^ע6m��V�ݵ-�Q��'[�<r)�*n��864�������gd�|ې��(��,F�Ĝo1�"�+��	m�����JT���`Z�����h������+~G�:�ا�䏡k�f�9���?��M�ϓ@���H�zhjlC8W$]��8	�q�C�G3U@����]���Ǐ����H�N[�D�_�kOR޿-h���j5�ũ�u8�ۡ+����gґ��#^2HI]N[�q��=C�$�����m	 h&
�C�R��mq ���Fg!���(��B
����ɰ w7�D2z����(�}����~����"��I��7��$po,����>�B��C������A׹҇�٨�>���f��r6��Б$QƀHҘ�JBw���3�G�G�甃�~w�
��F[4�$�i�����e	|�m��A�r����AW��M#����< ���8HL;A�I���+�����N|jA�r��`�)�F2~д��Cj�:���V��lL��f_n���_�KsQE���U̢Pv����.�.�g0�����R��8�Hu�4e�j4;j���5SE!K��Hw�	"Yɲ�+U�.���$'��+��a��D>h)�M�ҥ���{��g�,$��8啳{	z���=��NG��/�+lςw�D�$d+�7�~���)�#=���L
�$0��9����ۑ�]�5���!/�I��9t���hSU됂�Ǒ��$��ȏ�'��������� ��(      R      x��Ks�H�,�>�+`�br����%��(QR�����Bd$M� �b���G@����k��.�������'{��pHO���鷮i�2I�]�a��wAېo��MjT���C�Ѵ~�����h�=y���8�Eç��#q�?�qs��F]�=d�]n�wHk�ۮ#h���,����Hڂ>���1�e��:����).�H�G8	G
y���]G�.�ھ)��:�!��]��2�޺�̕��IU�ᴀ"{��c�g�K>�f�{���xD!�K�.�_��,m����'�C�势��M�h�<{9�=�',�q.�q� �5�s�D�B��!�<�T������ΝJu�q����J3��\�R�&����_\m��u��q�P��R]�vH��7ܯ�秮Chrg�&{-���%�c.�QRd��⒎D����I�xw>�r`�B��/\wAې��r�s[�Q"��1��Q��@����S`Ω�1���� �/��tG���=ڤ�(��l��lf�R��j�>�屜͙���"SN�|�~D�>>�$����G���C�TY�?�Jy�2{v��@Z��j9���>z>�%�ƥ<Nb
y���6y9;���<ͺ�e�s����o2�kY]�A�D=��cŧȔSWW�I_�uKːq(�D��u�Bfj{8)�k��|}~�@�	�jGŧȔS��q̑>ޫ� �!k�J��u����9_�wӮ�h�EƁ_]�|�K:u���2���:�v!�����5���Y{D��6�9|y�6Ω�� A�>�9�QȔS��Øc�c����%+�ڜN� Eu�,��[��BG�Uϧ��#Ѱ��>�+�Cb^��GY���a�sׁ����g�mm��6 �3@��cͧ��SWWGQ_��XvL�(W?����:�6QpkZ�/��]���G�L�/?#��#E��0�S�)0�x}�eu�=P��P6ʙcׁ�	�%j����#p߱���(�	���S`Ω˫�����z���|S��!&Wy����LP^�}y���s��q<�S����2�b�/�i�m��`,wc�h]�F!�Cpy�� 5�sN-���G!����ͩ�Hڃ̕���_}�&�E� �Vk8�p�>6|
�:Uq5����B9wA��-!�&I��.!��G�Z����L"	z�q������t��1��j�^�5� ��/�� Z�1���TPd���OqI�g�#���X\�)�s��	�;����~q*;�VW�ǐa��SX֩��p4���ϯ����63��r۟�Q�xy���W��:��@0����%�"SN-�Q��3S;�p_��\�S�������k�1��BG��1ȣ�S\�i�qL!����Kׁ��_-W0A���p�j .��y|y�|�K:^�9{�'Ȏ$�Id]�_����:�v@��Q��l���u(-���]{�9�²N=��XM C>s<���W���}�9O�|�!/�y0d���<�§��Sg�q�!�������h{�W��!q���X�)2�4�8���̲�\�}	�*�O����5�
���U�� ;(���"S���(�[�g���Uk��8Z���d�)��Q��}��<?��|����Sd�i������)vy՟��:�A`�sos���:��T	NvD� �sN-�}�ՙNS��=ȣͭ��ʫEuwPރ��Q��5|
�:�Ky��e~6�����X��,�+�yL��T�ö���چ<�iN@b0&��|�K:>}r���^���7G�4)2�4�*F�-�ŎJ�=���� }�|�K:^'$�?�:��{.�씿��#�I+�Վ(d��"SN-��G�qq�rh[r��3�Ry��i�������OqIG�A)�aL!�����?�����)\W��7��m��!�<V|�L9>{9���f�wv�W���J�x=�w�#�Ad���`H ��"SN=�:�z�2I�]ׁ��b]���Px3��4Q/ꄛ<R�c?&�Gϧ��S����<N�Gs�l�ڱ�!O��������=2�����r|q5�(�Η]�2�v;���� �<>8���(!�Ocxy	��Sl��91Gqu�����<:���(��Kb�٩����T�Ʀ
�(�G�ќ�OaY��ǐC��U�=�,!��~��N ���9�c�a4�OAy��ǈDU���j��9�۵���{��C���^�*�}�#�L(��SX�i�qH!�s�ќ�r���y�[U�s�lbR�V
y��cŧȔ�Gs���u�_懬!������_�@oҝQ�����V1�h��S\ґ�_�#��ܣ�G`�)�!�$1�K��'��S�!��Ui�ZW�Pd�pyG��5�s�/�8�q���`�����g��h����S�=�*Q�0����t|�8�\��i�w�=d���A�y��1Ql�� �!�kNç���]s�cY�vL�(Gs�KqwX�����2W�>eȾ �{�9�OaY���zr���`څ�ǲ���hG��܊�(�@����9�� ��OqI�n>{$�����|q��qC��<�5��o�"}d��)��pyP��rNC�˗j{Į�����&֩�|N!�Cty�Gϧ����#�Ɏ��#��d}vN�y�q���V���+A:���<���34+>E��z6g��bz�u0���G���U|,>�� {��_��-ހA)NvT|�L9�f�0������}S�{�_k�Սޢ>��!S����r|�r�o՛R���:��Tk��ڞ�G�4Q/
s��`r�C=��N#����@��ȕ6{Пjy���B��G	��X�).����x$�,��]�x$3���@��d����xc� ��w0lvP��5|
�:~tu0�H�u���/������|0�cͧ��#Ѹ��!�/��97%�U�'�s��Gۜ>�<�\W=��N�|�cYݠ��)��B�:��P�;v���vk�}�����w%��=<�� �>������²��ǈ�����gh�9���y2��Ǖ��^���9�9��<z>�%���8�8��w�����:�� ��K!Wt��ԙ��u��Uy_>�e�zvu4�(�x�>s<d�^�������mȗ�:��K��!Q/"�ǚO�9�g�y\��}A��!�\�j̗\�������1@� ��OqI��'C���u,-C���K4���uj�v�wI
��:��!ߌۛ��揅>�����P]m��uj}�8lW�;g�}�>�9=.6]��2�ᘨ�Ŵ��@p�*�\�=��N]]��|4I�u�B��N�/ ��:���q��q����Sd���Hr�cz�r��!k�es�:�!���#�1 �M���P\�|�K:^#��q��a�r�4b�� ~��q%����H�Eq�!{�|�K:�<�(��!Q��
�>�F!���w��`���z�u���Gl[ ��ǆOaY��c<���i�l
�F.!�&E�̥��`�ы�Q4$�ǆOaY��c�c������8ڄ\�_�C�	;nU����)�!�CW��O�9�^옄!�<�v�
yvUV:՘�T/<�NqWKPL�2,vx>�%��Un�o����iR�;�+�hN�zh��q	[�g��ڥ��N�����A	��QoL�>�|
�9^���ߗ�wF��ϧ��4xj O����uu�'*�Ͷ����A)FW+>E�/�C��V3��wﹻ��p������9lq��u���Sh����	�/�¦��ᡂ�s��� Aq�f��S�.�!�lNç��S��N&�9w*���}�L�ځ:j��S�!���o
}6��Nfs<��NU\�{$��3�.	�p�,-�
R���k{�r�_)�f��jç��SWy��7������O�:�6AP\}<���#2�)��5�sN#��rKu��2;;�ă�dǬ|�#��LWÈ {���r|q5�X�X�W�`�t��0�N&���g�G�<2,vx>�%�=FC
y��	��jU\�)�nP����m�������J$A�\�X�?�j>    ��ƥ<�c
y��`_�(�æ;���<����ܤ[��*7]����d��S\���c���:��=d���M�W �=V�Ƞ0]�	���"S��=9;�Gs��9;���,��c����1*|y���r*[�B9;�jk_���M�\�pЩA��Vi�0z���<��1�1���|
�9��J�:Uq�����{) �����O>2�=��k>��&�<�9�g�9��!g�+ȳ�!��])z�������bO�=�=�ќ5�1�*���N\z%�=N�/g���+AP\��� %�B3N���Fr��u,-C������Ⱥ�������I>���>�>6|
�:��jO(�ǥJ�/v�|�iw�`�!� �Ǎ�Se��?W]G�����jɧ��#Q\�c?��?��eܗ�Aۮ�h�����}|�i��>���EC����Sd�i��/��7]�.d�ԤFA_������@'�����	�>��!�>z>�%�F�r>X�c,s�R��3�D���X6u�� ��X��j����D�R��K�����B�U��7kw]G���}��<F����~,��s|�8�ڱT�8+gP힋��ɾh��{�<>�v]_����%��c8f����)*�����X�7�]�.d�R��2)��C�p_��zQ'�m�
�>���1�1L��)*�4�#�r����6r�߫�X)�q���S����<�|�K:^G�չB,�Y�Φ���h�7�!�{��v�tS�A#���S\ҩ�v��H��vL��p(�}8g��W�;�A���?��)�DWk>��>���r�X�?t�E�xh O*��_�����mn�"���0$�ǆOaY��v�����9�r�(K�j̗��<�������څ>���(��Gϧ������P֟�]�.$ʕ�n�;�Z�>�D���+�8�&���r�>bow�#�>z>�%�>N8�>�s�PΩ �:�kH]��"?�EVG��j�}�|�K:�<F�P�����i�� *�Ԑ�v��g�`k��#��#C��a�S�)2��J#��Q=ٝuf{�:�� ��=�(������i�X�o�uK�"}d���§��S/wD=���{�P)������<ޭ�w;�s"_�O�)��);��RvE���u�d�܃@�Uv0�>���	����ǒO��7Ð�U�ӭ���S��� ���@v;��>rTW���v��1&0&�ɭNw*I���=��$��� ��j`� �����byl��u�lN�Q]���j��@��#ZX4 �ǯ9z�?{,�����Sd����(���;���f�d�,p�8�������7Sd�)f�0�2��z>�%�F��x�_qǬJ�݀c�5]�� �����w�خ�h���r5�sN}9�8lW��D�y6Ib�	������{�i�=�Ցŕ��S`���c��3�hN��\ ��? 3�]>fHW&��١��W��\9V;j>�F�<]wL���,�e����� ��<�Z�?���Õ��).��͎��7��ɺK�q�	��V��87�֤��Q�G����՚O�9�g�}�͎���[�!si�y����œ�Z�*�1F�ǈat��Sd�����h�DVf{P��Q��O�1�����&�G�ϧ���d��ՍS��PAԔÃ`4��U�u���/��OqI�g�#��VKe�W;�Z���]W6;�Ve�J��r61)�5 C��c�����t�<�C���e���8Z�L�2?����umC�*F�-��
��^O֛��h5�"S����G���uu�.�E��$��zc PmH���cŧȔ�}s&�Ղq�D�v�L;w9ܻ$�թ3?-`Q��r�a6��SX�i�1���+���o 3w4ۮ�hr�umC��:��>2lv�B��jŧȔSW�Gqu�N{6���C�H������_������,>�g��OqI��͉C��V{H�+��?��A!�(��6	\�b���|�J;��\r���e���N �q�;�ќ�M�S;ܛV�c�g�=��N�=r���#i�8��2�𐫮#h��'��!{l��u|�1�͹=���ZY�<?��o
�I-��S!��{eQ�!{�|�K:^c���A�$�bݮ� Z�<���|����G��V�"S�/���Օ�,!���'o�Ch��{��ǊO�)G�q%����u,-Cƃr��D��"}�ڙt ����/}�w��j�g8iU�)2�H4����������{d�k�ⶭ(ls�1��+�:���#�˓>M��1���SX�i��
y�\jXC֩V�����Ye9�������<���X�)0��ٜ����ڣA.�ʓ�%��۵I4�k�l>��D&��1A���).���q����`څ˓��� {ȭq�D�����b�_���ci+��>z>�%�ڔ<�)��k�5����J�� H�����z~8XO�
�K[9����SX֩���S�����M^B���;r�� {����d۱��*�o��S\���rd�������h2���Cm@�|�Ym@��NF�cͧ��S7�<��d����Z!׎�r�^.>�W���!{l��v|�ا��A��Ԑ'���������U@Q\����2�ԛ�>Gq?{�ҧ��|�y��u�y��])"��)*����Ô����*�9������&�	^����<�{C��a��OAy���p@!���
w�\ѧs,��]G�lsV�]0��<L�#��Uϧ��㋫Ñ,�ෂ$�R%y�#���?~�ΑU ��/Ng)��#���("�ǚO�9G���G_������>d�u���L]�62�b�W��1$�ǚO�9Ǐ��{��w�(��C
m�G�=n�I��s|�<�cy���r|�q���|\��wEː�Np�:K���9�k���+(�qB���b���	���,QwM'(���4��_!�M�r�,Mufs����<dh>z>�%_]�p���.��SB��4ż��A �SwTi��F!�Cty���Q�)0�H4��qD!��:��]�E��"7X��f�ԙ�6��a�{��OqI��ǉ����:�v!ñ<��r׺�|�	ɨ H7�]��.
}��#E����t���Q���Do��UȝIwY�,^��C�]G�6df�r�an����x�8�ǊO�)��cTz��wL��I_���tyu��G�A�
��O��_��"Jc[�m|Wk>�%�F�r��^���q�aw�~Ev�+��s�!���?UL�s�u$m����<ƽ1�<�|�K:�j� �p��]ݨ�}U&����.���͝ꄚ>2�|Q����sy�]���I��Su�me_��#8j��|��(�:���).���jH!��*�gʥ�+�d�/�����!�<�|
�9>{$�����K���9�/'Eʁ�o|@�]G�6�ΞM�j�/I �Q/&��_��yy�)�q�N�mϘ/����d���Qd��h�Fc�Z$��P\}�ST�����I�o&��4�:��P�����
y\�����Fs�	�<6|
�:�I��h"���Ál.Nc��?�{b��\uAې�c���4��`0�vx>�%��c��Յ~E���)��,�M����?S���2}ėǚO�9G�I)�[��S���hr�ގ�K��8ڃ,������@�("��V|�L9��Hr�j~Pе�@��{����7xy���|�.5��U��cDaJ^�)0����	���zks�ɜ�rE'�M�wlv<�lk���~Fy�����sjy�8K�ܮ�hrk�K5�R9Aq�ƾ��5����@ͧȔSW����e@�9rm�G�2G����q�)��G	'�ǚO�9���<�9��i�sؽ�i�l���TA�]W�n�~<��� $�ǚO�9G�q%�
y\�Պ��\9�:d]C6����\��ÂA���"S�/��9ls����&�������L�/r����A�{)�    !�|
�8�<�)��V-�ԃ̝z�n�v'�- �b�<F�cͧ����#Gquiu�u�B�D�GЋ$��ǹI�&MUn��%�ʕ�U���Sd���8��ˮ�i�����)k�o&IL��:��@��q����#�������cɧЌ��|��:�v!�X6���r9�N@@Q^}7%��=R���7��Sh�����7g�.
��Ui��m~ O����&zY�� H��av��).�4��q�c}��jW���tI��<έ�r�s�lbR�y�p]}�STکOZG=
y�\�o�lK.�\�j��k5d��:��!�s��i�/ (���C���),���q�q�c�ԫN��W�Z���u-������8�4��p̰���),�xys��̩t�����<�����I��r�B�MߜhL ��²�w]s��,�	�D�Ym��쀧�����<>���%
���o�|
�9�<r�攗��7��a��>X�߻��-W�nv0L�6|
�:~�qB2��.ȥ���L�u��B��&��+�.�Jm�j0L��1�<�|
�9��8�8i�R���e����ė����7��+
yĮ���#�b��S\�i�G�����W��,��]G�&���S����gʰ�1,v4|
�:�<rL�.m�ic�@�:�����
r�umC�M��i���0��&�cŧȔ�W9&W7�/���Y�s�;`gYy@?�!�����jcP�c.�� &�+>E��F9<W����w�ÛN���y���&�E��}s��=��cͧ����#��G���T�d�#f��C�{����\��J����gX��|�K:u�q��\]�3��+%���1O�5���Chr�Ӽ �rU	y��ǚOqI��G!G�q�m�+�m��H�N����>ZwBː{��TvD�k0���z��²�D�JYZ����=�}�re��u�ks��Wں������{�(��SL���cԓ����`�E!�����'���ۃN���N#��	��_��N�<Qin�]���<��q0"�ǚO�9��#���:/8�=��$x{���A��(�B�]�3eX젰�|�K:M�Q��U���WȝE�[	�s�w�]��.(��cy���ry�ر~�W�y�@7t=��Q��B�S��D��ՂO�	�Wc��*��#�Y���q{�l�����X��g��OqIGz�:F����:�v!�a�9i��k��hO�I�s�������SH��!�b�����(�G�&y�ŎG���[Eq5�1L�V|�L9>{�pX�=*�Ԑ����U��8�ɻ�eȽ~V�O���Y��]�r�"S����s�.�+�;Ǯ#i�Q�^'xE�w�^�G��j9�3$h=6|
�:~2�ϑ=n.	�+��|s�E']��"�g6�m�m�h�j��j2���|
�9�+y�8�����1(�V�=�tz��%0����]!\���X�)2���� ���jUe�N~��J�v��߀'�o�]s����v
y��c��
���t��ꀣ�8s*ݡY���~QYnpw;e���UtyGyl��u|�q��ױ>�7es�'`����um��ru�i�.��>�<z>�%�z�cأPǅ�N6�uI{�{�#o@���p�~�1d��h��u|�q�Q[]8��u�B>g�S;�;��<?uBː���u-���:2�cɧȔ�[��!�<�d�(H�.ythfe8guos���:!�K0�=�#�ڪ�S\�i�qD!����VYoo��q���97�M������#����O�9�O�9��ԧ�A����!�:�.PW��QA �ᄡ��Χ���{��>�<�g����y�a�y���z��^\'<�#0�xysL���W��:eq��p���Ȱ�b��H8dͩ��sy�\�u�/���j;O���4gz~9;�O�p�1��!{>�%o�:�p�q!�s��:�6!����삅=�Ԁ�;���G ��OqI�g���q~v��tw�Y���7�`n�� 3U|>��#�#y�W=��N#�{�K��I���=���]���ǩ;�4S�D���c3�{���r���c�c���4G�#�-���%��9��:�4�2V`p�1L�6|
�:u�8��x��W��hN?��[�@ �s��N%��lf�+���	�<F�X�)0�4�ȱ��q��+���0��n��:�<>8�/���V9�qȣ�S\�i�qL!�s�s�>P�
�쑿����ʨ�	�����tJK X�����OqI��cȑ=N�g�a�
Y�'tsЬ��̻��m�J�� ��hN�c0����ry�\]om��~�!�*� �U��%��&֩��-��{�!A�X�)0�ԓ���Tn��痮�h�<�*3g\cقt��e��H�_���B\sj>��b�8"�\�`�KS�+�����A0�s���l��6)C�q�`P�)0�4��a*��!��;d�\��]e�]�I�Z`w'S�C�X�)2�4��q��lS�YC����k�\%�u�y��c��s��S`��9�k�B9�?��W��A�  W�"?^�:�vA�=��>�<z>�%/�1Gquz�r��+d�$���~4�^�8�Qs�J���l<��N#�
y\�sء�<�W���� ��q�mH�q�#f�{���r|�1�p�Y��;�Fyi��� L��z�6 ���	�<z>�%/����?tKːq(���3���w,��]������Nu�L9���6��S`Α�_�#���S)�m��:�ăb����#*��a6��S`����>G��&sJ�Y�Ԛ�o&EM;
W��c���`ۏ��qoB ��OqI�g���qz4
Y�]��M;
y\�,�gg��5P��@k>��=8Nv|N`7��:�h��O$(�>��p�D!�صղ�:$�ǚO�9Gz�:r�V*Ew�Q����?��l��M3�2u���5�sN�<r,vTfϨO����!��{�N�-�6�rqȣ�S\ґh\�#���J����SA�*�m���$���+�9���p�uP�c4	���).��{�C�{�+�}9�k��b�÷o����:�1�Ŏ�O�)��9&s�ӷ⥃Y(!sg3�_��<~3nop�uT�cZK��ɜw>E��&{����\]8u�!��\��?hUd���H�=V|�L9~4g�1�C�)��:j�=~q:K-�f��\�ȣ����F9Fs6����:�!����ZA�]G�6��`a�V!	;�C����t�<�8Fs��vVi��ϟ]��65����<~��M��U��	���/|�I<��8
���e�����$�NLj��-�j;w�]~���=��5�&���v
}�BK�>�?�:�(�ǵ:uE������u�[B����ʤ��l+����%9��cɧЌӤ��+xW��-���(�D�&�:��!s�X�v���R���Mz�cɧ���d�C
y��=`y4�m)��m�7��{1	\/ǃ�bG3�C���s�lΘ�U���A�kȭq�y{����n����A�1�	���).�4��Q\�۹x�#룬l���1�/��N�����	9|>�e_\sW�Z!�q> ����QA6]��2�Kb����P��^̐=�|�L9M�8������iR��{R��Gy؝���̭����*˵K�����EG0����).�ԣ���1���^P��%��j���H��)���\bsȩ�
��(d��+��q���S�c�WЮ��o�m�V�7���p]eX|į��	��S`�i�G���7u2���{TYf�%ݛ��ci���*Ͱ[ 񋫞OqI�n>NB��V3��+�G��s�wP���l��4��$�{��\�=�ձ��!�<�|
�8�����#è��F��Ƚ�"��C�]G�6d�O?�Ƞ�=c��OaYǧ��1 ��ǥr���@��~d�V}t5�(���s�O��<ޫ�@�X5�+�1��<���X�3P_9�    ��7�j>�/�1�f��]@7X=dn�����fGu5s,Q��`��I8f]���sy�(�.�Y]]�k��k����8�V�RNZy>�%�F9g�dvx�A���tG{ ]��co����<�1�<��)*�H4.��Q\]�]d��@���c��
W9ۜ5�C��Sd��}������S���S���h���fvq_�	��jç��㋫}_ ������7�ky�W������]G��²��*u�h�d���5d�\��t�wJK ��q�����?$�р���S`�i�G���Ͳ� ZF#�� ���̿vC�`�\��{�b����d���+�emվA&� ��;�]�HV�a�q�#�ǚO�9�_�pL�,���GYm�iP{���:��!3uI,�<�h=�����t��〣�8W:Sм�P���۳I�N��r����d[�f��2���;�x�x>�%�Z��l�Yg2���K��񯐙�o��� `��<�*�URvulbR�g9�dEm��Sd���QD�=N<[��|Q��:�6!w��g��)��9��U|y,��q�dΈ�Rn�v�=��#�^�F���JT��B����	�:*>E��3�0X����Jt��T��9��WK�{��Xgv*�I�$R�Ʀ
�����#j>E�/�c��*|�qs�'�ԃ`p����=$
W+>E�_\�)�q��W܁�����3��K�g�L�ϋψ�ð�A����t�h΄c�q��clב����*��(�+MqE���cF٣�SX�i䑣���N���MȭvY�s\�'�k��9xyd�\���s|�q�Q\�&	`+��n�x���|S�N���]��(,WC���S`���	�#yY$�:�V!k�t���A�{\u2�=\���Ci	���� {���r���B?����v)��ay�:��vD���G�k�5�sNS\�P��R�4vWg}TIv�"p͙'���A �QD��X�)0�T����r�F2��3���S]���O��
(A0��u=�:�vA1�Ð>�|
�9U��9��+��]��*�Φ���'����ΈdӀa���'�ǊO�)�j>�{��꽁��ٚ�>���vAېgu���t:�J����Q�)2���1�͹U'}Yfξ�}�9�гǈb��SX֑h\�c���Q�5����U��tE� 0]�f�ޤF����'X|�z��%�B3��͉9.Z-�s:-Y����r*������~t�t��UĐ=6|
�:���e��c������Rn{�]t�ԩ�0Z�o�����JШ���'�?��w}����fr��Z@�>����\uAې�M�X��q�a���SX�i�����w���M����������c� {�|�K:�+ձߣP�;���
y�@>�>@`��{���H+>E�_[�s�=.m��:�m��v�����������b��j��z,��r|m���z\�G���E�-�d.���z��3���|
�9^yt���0ZE�s;�ZGP���7^����ji�CF%�ǒO�)��G��q����v�yTy��2W7�O��jcP�#�+@Y\e�h��u��ܐ����=>&����`��YW�ސ`4��Sd�����T�Z9g�o���$1����GtW9�W:�oQՑ����X���)*��{�X��?f��+uv�uJfM��*�i�u$m����Kb�٩�&͵KUnl�����	��p�pϪ�SX��{#�ɜ�u��%dq~InrLq�qsNT
���H'y���s��qR����j��Y�m�~����:�6 xu�� ����ǊO�)G�~%�c�|��:�v!�{n��}��\�r�Qe��9r���u����!�>�:J>�f?�S����HfN�;�gyP�X���@��m��;z'T�)�����=����SX֑(��qHQ^��[��?Xл��Ƣ/v��c8��cɧЌ�˫�1���a$k�s�!0(Ǫ4x,u�]���&+�MvAې+m�ި��h��8d����),���c�n
>3/QTZvQ��q�3t�,O��㻭*d�i���>�|
�9u��}�R9��:�6!ߴ>�PL�4���V��12tk>�/�}��ybR<s�_ O*?��"��:��@�=�[��K�����Zwj��u5b�k>�� p��}>(���|4�S��ߐ��#h2Mԋ:a7�]W�� rŧȔ��A�`8g4��⍣p}U���)�-veu|飺
�B��H�J��),�Ի��`(��i������<�PB��EÕ�~�>���{Ľ�AK>E��?�8�Z-U�qY'�l�.О���k{�p�����1�Z�)0��7C_����(څ,�{伃���f��,?���cɧЌ�W�#
y\�WPy�+�m��od��:˃o��M�����A1�S�)0����#{|R�A����uN�[��tK; �]ş�!8�8�	6=�⒎DQ!�Q/����N<$�%�6	��
�>>�<�^�n�KV�B�v4|
�:u�������:�v!�P�G!����s���:�6!��]��2�!�{2)�R��B��jŧȔS电r���~�:�v!�f{�	�u@�3�i�T��x��#��眒O��Ή�1�<�45�S������
���oU�)�oH���TW=�⒎��F������ȓ=;��$���Gd0�vPl>z>�%��8'������XZF9�������Q�������";��)����dv��),���q�ᛳ ?
d�LJm x[9`ǜ��"y,��py�(�.�sz�q�(=�+���Ch2�*�UR.\�Ĥx:Y�c�.�q�@=�⒎�\�����:�v!Ð�v�I�N6~���1Q�?�c4	���S`���8ḉ|{P	�lΝz��/���X)�?T�U���>�l��S\�i�1���)п@�X6N_���U�L��:y}l��`�sfW#��V�"S�7���y
��%���e]_-�'�#3�/y���w|��<"�Gϧ����$g;Tj4n٪|tz��A���w����	���).�ԫ�q�#X}�cY�r���ʜ0�ʫNg�ŭ�����},ۏg�<��N�>��"}�n]C6Ꜩ�����-���&��-��y���s|�qXl.	��N�>�`;���w�l�W���\X���<�|
�9�5@��}xu<��=�)���<���Z�@�W���Ec}�|�K:�َ8⨮.�zI8�Y�9h#��<nΉ�n�v��ᜊO�9ǧ�q�BWj�u�B�͏:=��	��L �+�N&������u(-�l>b룄#��jɧЌ㛏q�,7�:�v!�\9�"�˿�x��l�z�����\bs��j	��c�	���S`����xH�>.�־tG�������X�@W�]��!�j�3@ͧ���W;��\��̏��y��0�!��}K4h/��>ު4S�lC���}���s|������XZ��C�7�#�#IP�8�=��y}ķ|���㘡�X�)0�4�#���B�7�|���_�C��<>�,�.nu���G�]$������SX���8�n
�;Ʋ�u��S�<ܑ�xI�������I���I�@>�e�F�>e�y(���>�T��t�u�A����ml�؀�pG�g�ǆOaY�ow���jl�`�t*Ȧ�7�77�FHrG�>n���u0���p��3�<6|
�:~:gS�㝶���W��.������l>wBː�I�&MUn��%�8@��!C���),����p@�d�S���<��\��c���s��9�9�>z>�e�&}�8���8��3�w���M1��Ⱥ�چ̬�4�j��*~u��SX�i�Gc���yt���s�ٰj s�쑡���=��������t|�8�0&_j�OF�~ˠv%��`�|Ŀ��?���OQi��ǐC��W�4^M��.�|������F    ��*��j�`�S�)2��͎1��j���](+���[��q� (�~S�N�� nZW���H�=^\�i�G_���`��r���\ ��Ԁ@M�g/g�Gm�����cͧ�����@6��}s�^�H��I�u(�Af��#������lf�p��9Q����SX�i��c�c�(�"�;��u��C��e�f�����lNLq��Sd����	���zQ����*3��l�v����<��W	���9���;��Ҏ_|��2�ƫ��?*�V�{A���Q�W�$�e���v�n��>�WW�>�>�|
�9�>d1/[ɰ/��n=��J������Xځ<l��eȭJ3���iP��\��w��Sd�i�qHQ^�S���(��rD\�}���ܪ,WI0W�&&�s`����5�s�Ιp�Z]L{���xy��g����K1���s$�y��b�߁vI4����� ��>�x.�nǗ�:����A��Q�a:��Sdʩ��~oR|L𮎌�2�i
y���\����Q���8C��נ���>ƽA���).����~ȱܱ���NPɣK54��w�W���0"Hk>��>s~�n�3������e�rI_��3ް X�X���#d���ǚO�9��G�եr
��(K�M��*� �O]��2�J��Q9��WWk>�F9v;�i~�)�@����\`@Q]�f�ޤ��A!����SX���ǈ���r�SA5�e��v�/�������W��U���Sd�i�q(�'tg�I__�;�
Y����8��ʃ�5?���Sܛ%�1���"SN��c��Vð*>vG������o��h��dY 	���ބ ���r}���Cױ��e�~�.ՠ��������0���*X�����~�����v�tNQ��j�{Ԫ�<�]�3�$��:��!Wں=�p��p2�5|���Sd�i�1���������s�>@y�'�9
�@�Bl}��s���Sd�i�/��U�X���ZB���8���8��]��*+'Vf{0{@[K����:��Sd����~�`zu�ƩW�9�\C�٣M4pY6������2`�'���ѐa���).�߱�ǁ���"�"��;�ߺ��E���zW�?vBː��y�1�}�#}�|�K:>pL��i��z���;��Ϋ���r:�OP^m��u|�8�,w�}�o�S���N���D��e�	^���,xw��B���;��Ҏ��Q,�7��V2�������@ڄ���)$�6 0�y�AH�
�՚O�9Ǐ�N8�;���dS���7{Pd�܃@���\9��qF�`z5Cyl��u|�q2��ǅv����]��"�W��9�{9
y��1��՚O�9���A�'wS�~Onu�SI�u(�A�M��[.�#h��U���t�^L�>6|
�:uuu�)���A�V�=��~����木�wJ ��a8��Sdʩ�s=�ݎ�vp�U�B���t�um� {|:�{�Kz�q�pت�S`�i��}
y\�-\��O�y�v{_������HR\���sy��f�u0�B#Y�����>^�ܵ���:��ȫ��X�jİ����t}��ˮ�id�s�� Ջ��&�	.!���[�f*�UG�ݎ��Y��S\�i�s&�չJ^�<��W�ƫ7IbRl�O�>�}���S\���cأ��;�@���̜�G\b���� �ᜨGa�Z�)0���1e��c�{��8���XM[�b>��v�U,��ö	�墐���).�4�#���̩t�E��[����
g�\!����g�B��ǆOaYǯ>�}����`څ��:�V�rZ�?�]+g9��^���Z�)4�4��E�x��{v��7/�8ku���l���r�)�n?J8���OqI��c��3W'���	�Վ�¦*����%��Xgv�Wᛏ�@=�⒎o>F�9����<�Y��Ѐ`6�a�}�#�1��T|�L9���)�qY<r�pyU����]�`/[�}�Cu�<��a,2�v��)*�xy��F2��Y�'�TGTΩ!��Ug��!�]G�6d�u�
��cԋdΨAͧȔ㫫1G�qk��!+�@O=2����%���
��p<$H+>E��F9����=�ʫ�H�׻��/y��IS��\uI[(�1��hȣ�S\���B�*�/]��&d�N?0�=d_���.�R�c�c�k>朦��1�����36�;��2l-K0���3�4��p�0�Z�)0�4�Չ̯o��]�x(K�A7X=��$�/9��ǹNs��`e����f�|0����r|u��q�cy�r�V+���E@�>��߿��vG{ ��F!�<�|�K:>}��xo�࣫�t��c.(���9G�6c�ՊO�)��9�v�թ�(څ̜����	��Ye��a��)n>Fcy,��q��ty��:�vQ�x�:C~������������?�"}���c8f�ǚO�9���E��d_4�Y+�[�y}���ïv0��cW�Վ	�<�|�K:Mu�c�q���u	����+$�z�D^�4X���Ip�1�1�D���s����c���PC6�U���h�#�<���c���S`Α(��qB!��_� +�W�> ��=2�ʡg�Q8 �=�⒎����_A��5�I��2�y�����d�&I �
� qH�S�).����c�csI���@fZm������l��M3\�B���M|j>�&{�|Ѫ?���\�	�n��S�;��y����{4y�����t(|s�'�=�⒎w%�������i2(~���
�3�C�����XԐtk ��D�m�(���9�²�/�9|��wN�a��"�8$Y�,�A�j�MR�ɭ�=kEP^�{�9�"S�/�V� �N)�/N�������G�9HV��W��ك"{d��²N�=rl>�m�y���<��A�d�������k�1�ߜp�P\���s|�q�qy������h�vW�L���$�Ǉc����A��X�)2�4��apo��#eq���j�W�d/��:�Q-s*0���L�+>E�/�#c �������ۉ�{��tk�T�^]� Q?$�Gϧ����#�1��zqF��<�h���U��U��G���!��jç���'WG'���˫�@�?O�]��vAې�ũ��4)�E�^O�� ��S`�i�G��VKu��y6Ib�	xg4�&���N�0��'��OqI�/v�H;
�QT����*��S�!�ypz��!'�=�\Wk>朦�ʱر��z�^}���9tz�`*wm�Y�����hD�=6|
�:M�ȱرT'X����=��_ ���Le���9�xB�=�|
�9��8�X�X��b�t�O&�	j��a����N��z��%0�=�Iz�%�⒎/����8�i~�.�U�k���3��|��M��U��D=��V5�sN#��K��A��Kȵu��0D^����U�Wq��M��՚OaY�����O*�a�z��d.A�� ���2YV����TH��ꈡ�Z�)0�4�#�h���� ���^4��`ruf��չM���ƀdr5"�Gϧ����ID!��J���SC�T��:�V!xS�B�S;\�|���1�<��)*���q�1��h����w����|)���fa�A��C��cͧ����#G�q���umBff��x��`rufM�qő�T.�1d�5�sN#�c�~@�Q��Q+��:�6!�ꒂ�j����d�lN��*W�)0�4�G�ٜ�MQ��5���~Q�Sב���>��7��_������cͧ��S���a�s�)��:�6!UZ��u�:�A`�s�$&��\U�A�Au��S`�i�1��ǅ~m"{�J��A�S�_�/Z?E����cͧ����#�f��b�
d�������ѧ	��btu@P\���ry�)�q��W��+��$�K�{ב�y�����<�Z�����1�1��y>�%��dǰǱ��<g���<d�I��vW��:�nu����n>J8ap��|�K:�<���~�u0�    �<�/�ӿuD�:J��|����u��a4'�	���).���j�1�3;�~h�u -B�M��U����CF�hN̐=z>�%��`Ҍ栮Zאo*EΎ)Fs�����r61���9����Sd�i�G�����d��Z�]��c�=&�E�&WYNvT|�K:��)�qqvN'����{W 8�xg^��1����\����SX�i�q$�)�� �љt�1owV�/*�<������F���29�P����_]��SP�i��c��������X����ӣ����<��q���"SN#����B���A��~�2S�w�1��>�U,��[Tw ���av��SX���9�)�B9s�����&�^^YwAې�s����E���S\���ǈc���&���
2=$��I=�o���g��ț�c4"h>z>�%_]�8\W7N��]�"���z04��ia-�V��G�G���S\ґ^����7}�cvI�~����z�u�`�13x�7|
�:��s�Wf{PY?���qE���u~7�:�V�0��gX�h��u�dN��z\ڃr��@Z�̜J��W<�*IG�K��]ׁ��ɜ8�ȣ�S\�i�GW�U����l
yZ�{��g�����hH�z���s���Uncԛ�\]�p[�9�<ޤ;�0GVk�C�� �OqI��G�ќ��8���I�;y���E���z��t���p|��+>E�/�}���rN砤SB�ui����~q*;⦏{�1�<6|
�:�<F����+�ԑ|�����l
j`�AP]]�*�n�lz����5�s���sx�o�w⡄̔{��� X|�̿vC����	�<F���"SN#�����G����Y^��^g�\uA� �~��c�c�|���r|yu�a0?8:�\CVg��1�@�]���:��>2l>�6k>�FC��q��$
[?U�A{<l��e�7��&5*�h�}k|㜘�"rͧ���E�;d�@V/*U�m���gA:���7;F��OqI�6%	���P>�b��⡷G��25���#��Gxy,�5|���Sd���9��թ���v�;��1;���u,�`v���Q��B�+�}�C�"{�/�V|�L9��8$���n
Y�`�^�$8�qm���n�ٜh0$��>��=��R.?���3���VK��,�g��2'�0&�=z>�%��RG=y��O!����I�r���7�'�&9��GW�C���),����#{��$�Ck�近��|��O�*��U�ќ8"�+>E�_\q�|��Y�w���������Wں�A�G��q<"�ǆOaY��9N>��{5��ȣ��A�R=��[���P��G��Gϧ���d�'��퐓�@fP����r���E�HSr��ϧ����1�b���WDs�w�¾�&�wG{ 0]��o��Հ�T��t��).���qS���p�����Ym�N��>�&W�&ݚ4U9�j�-���Uͧ�����Bo�/vr���u[ ���Zˢ܄@+>E���su��z\��;֐�N�=��'s��*2&sb�ɜ�O�)�'���B�i~�)�i�
2��x�`�S� �<��1�<6|
�:~2g��z�ɔQ����[w���_{\)�Ti�U��S�7$�Gϧ����=NF�x~~��ǅz5x��_ �کD��^[��Y
��p���X�)0����Q�c�ci1�s�!�65��u�b2ge���|�W(�/��9�"SN�=�z�ǕA�3��i�[�߻��-d�w�]��.z�Q�#�+>E��&{�(��V�O]�"d�t��}�{ �<��:�VAp�1Fs<��N�=r��5pɪ�<]��B|O��s����S����c���r�����Bϭ��G��
jE�C������x�;��r�� ���Sdʩ\F�1�:..	�C��,��ک=j�U�k��:˵K�	�ɜ8dPǚO�9�'�!�1�NS��]G���$�Q'���+���{ȧx���1�Χ����#͵���MW�Y��]+y�Ms6�ǒ`p5dX{l��u�<F${�9�FRdYR�����:�� _��Q���]�*�1�Pȣ�SX�i䑣�z���YW O*���j�Q��W]G�6d��u��ɩ��{�\m��u�^G4���+g�7�m��/�7W�:���dF�
��J�=F1�iNç���d������,7�À�=C�~�i�ԙ�s���<F��>��w���c���V��{P5���5b��@�k�� �9ф�S��SX֩�cC��V�FCzy����bH�z��!y���).���j�a)�_[]Y��G�y��Kb�q��U[�F9Z�W�K�Q���	��<A�qnuT;\Sr���(f��(��qy�h=Μ����M�{�9�dnP�N�!�y8&����*�!y�Ak>�F�r���XZ������4X���(��:="�W	�!O�/g��75��>�bǯ|
�<~�1�P��W�:@���F���Q� }�Y�i��1�H1A����t�<�9L�6*M�8�����xr�um����nI�G���-���t��c?�GsRn{�|�T��zE�\/'W�gs[ Tu�G�͎w>E��&{�0�[���? ӓE��~�b�#Ip�1���	�A+ϧ����#�fǓ�l �*;���ZB�]s���]��.
y��c4��x>�%�FG��/Z�B��N�?���E�J���Ɏ�I�&MU�jX��\��d��S\ґhT�#�����w� /?�Rm���N� 8���ف�S|ė�w>E���8(M���]P����s��,��+	fs�b7�Bl},��V��).�������R;������b'��|y�?��|s<�⒎o>8L������r���{��TvĽ�HP\�z�Gϧ����#����&	�w���9�b��ov�L�����a0�H����V�OqIG����1�<�5�W|G�=�M��7
��C����X�3�%$W�ɘ {���r����U���ksB\@� �'�̾o�}p崆����~L �|
�;>{�(�qs����U�9'n�1�(���ʕ|�L9>{����w����e��:��Q��	7=���Q6�١�p��nv|�M8~6g�a+���t��f> �����x�(�:�����@ZA�E���²�_|r4�ٕ�ϰ���䇮�h��7�<���X�lv0,>6|
�:��:����j%�q��|Ѫr%���/į�>$�`aO&5���B����g�>z>�%_]���vFŋN�l�;[�*mW��O�C�ͮ��x�I�3;�)�B������|
�;�>��ՙS���h2�[\>�X}d�G��1�0Ω��r|�qܧ��[}�hɪ�l���>����7��&5��X�@����cç���d�
y����
����eV���+��:�9�Wd(�F!�<�|
�9�<r�v,-���/���$��<vAې�>�8 ��R�v�z��|
�8^'=g���@;{���Au�ʽb�㧏]������8�=���S\����	�l��Rݷƅ,�	sȺ���木V��1f�]�|�K:~�qR�<�wL��~,��젏"X,��s8�s�}�)�Z5|
�:�>r\��*7u���M쩇��+�=�=��%�sN8f�]���sjy�z�x}�u0�B�}�������h���Ѥ���
��+m�ި`���or��ը��P�)2���9�G�q�.;���HU
zJ�������d���I�}'�Uϧ����cD!�w��A�:�!3�쏮�h�~����c���`�����ȣ�S\ҩgWǽ�<�-��j	�;o�Jm�q�y��:���޻l��lI�����T-�sH��,��T"m��Y�L����(���/��O�/։�X���:"�+vːG��Lv,`��9��sN�9fs�ʡ~�����V���Ԋ�=2��g�	��������ǨO!�;�?mO���!_�s�     1��v��8�aϮJ4�d�|
�;A9Fsv��R<l��G�Q�	��:��!;���q�V)���Md|_��O�)'�#�+�Һ�BYeJ��{;�����G���	Aq��).���ǈÕ|vP��hr���X{���u-C�mV߻�U���#_��O�)'d��9WN���(�U�w�&/��:��@�{ܖ����G��~$�c���5�²��\�9z�����6i
�#��W�-���p�)�Ǥ�0���)0�y��5����%���]��~�an���2U��Ci	�<���1b�>��{�
y�ɕQ���є?U�]����U^TW�lj2��G��Ոᤕ�S\���p��B;쓏�R��u��T��U��#�Ɏj�4'�),�yP��\�5���՛5����'��Oʥ� �E�ќ�a�1�),�y��{|xC\����zw~�����>�<Wk>E�� ��+��:��@�4d��{��kf]�Cqu�P\���r�<8;�fYq���A���_��j/9�v.Aqu�`I������d����s��A��� Z����N���<V�8��$Wk>E�� ��ǥ:+�B@y�� ����,�n��d��~F��VS�s��sN�G��[{���֐��Qs�{���8�aWW%���cͧȔ�]s�9W�^�'ྎ|U����T�`��.=��l2�Ce���|
�;>{F���5��Ǔ~��*;�)�۫�9�G��ժ��_\m��s�Ŏ!�h��߻�U��<��o�u�A����m�å8j����Wk>E�_\r��]9p_ ٝ��%-�U �=Μ��f
w� {�����)0��*G�q�R�?;�\9��k��@��uG�z;�ǬYL�Fӈ@�²N(�N)�q��z��C���t���-����rB�d�q<&�=6|
�9>{�9�Q]����u$�A�u�h�[:�&+��#Cq�s5���²N�GS���ۧ��h�}{F4w� ����j�u��@�IL ��sN�G���r�
�!�:O5�H`*7��u�`a��R���D}��cç��䑣��R�z5��֩g�L<zT��]G�6d�U�+�)�hNQ\�x�SP��c�Ŏ�;+į�Y+���.�ќG��Lv��H0�G~���cDQ\�|�K:>{(��|� ��C�����A��q��R�<`M�����sN��2ہ7ud��-�X���l�Cׁ�}���B���6��9�`	>FS}l��s����d��� �|@��7�jܯ ����_*�u��Ǹ��|�|�K:A�rO;�D>�)��u�T���Uh�_C��k��j��( �� �cç��㻏c�YV�� ��.�3��������uT �]M�}����),�H<���`��G��|7�^gE�q��yD���jç��㫫����%/��W˿0C%��|quc]q�5-HHd�q�`J���t$�jyr���3�gT� Sr���rIB�=V|
�8~�c�ᛳ��� +����=��/��M�W�^^f���V���cç����q�1�s��Q9v>=���,>~+�	S=z�qD ��s��\�r��,/y�k�ګ��
�7�a4g[�Z}���a(�NFs<��N�c
y\���i�u$�A�.��@6���Y��\
cy�0,v>�e��=d}��:�vQ�ʭ.�g�"y ��#~u�Q7�r�:+ ��9ф����)0�����"}\Zw��>���ʐ�����GW��2y^��A%|W��8��Gϧ��Ӥ��>G�q���vI{��3�g<�+�]G�6��Q��5���h����u�<r�|ܔ_��0Z�<�45��� (�~۬�wD�(�q�.���5�"S�$�Z���ߴJ"YZ�ӝru)R8k�_AP]}�e��B��'�k>E��'�>rܴZ�����xȣ3�^������.��@0�M�<��N�:�O(�q�>UOs�Q�;�^�O�7�����츱?l�X�@�!Cu�>�$�ftu�簕��j����P��7-�Ǎ-��-�V��"l�2{��cç���L#��ՊN�a���=�Nځ�z�_��:��!��Y�A�
[���jͧȔ#qR��D��O���er�=�p�QO�(W��h��s�N����5���%����>�e�|�8��;�?P�(}��onn���z�ؓ��{\�'�B�;�8��>�M��O�Ǐ��}��,��]�x ���jO6��:cZ7 H�ʽ��FvHk`X}R���⒎O�D�7�-��'+K��j��*�n��>���������S\�)�c����wKːH��^�ky��8!�����_
t����a���).�y�N���ZIu�D?� � �h���:�6Ap�q���u�a:g�P^m��s�>�e����+$��\����@�������o[�R�xNĐ?6|
�9~�#����j,\;��<�&C��z��S}=hՀ@9�Wk>E���>Ne>o��pTM#�`�)�Q���?�Wa�!�c<`8����t�>&}��c�����3�C��g��*���B����ω������)0���j��f�u0�B��,��f%���..�нCO e��'�CaM^Yu�珞OqI'䏱�Ï���N���\v�E�[]�߻���W�����F �>��)*�}Ld9�W���˕3
�v*y�L;s�����;bty�O	ʫ�sN�̩�q �?�]�.�_~N�S�w�,�6b�>>�|o�w��a:'aX�|
�:�3��Ǒ�f�W�,-�lN���O�;�)2�ˏ�Op}L�@+>�f�P]�x�b�+���ɶ�:E��
�>d8���}d�����t|yu���ї�v� ��\fSܣ� ë��M���²�O�\}C���@����2�ɾtF� 8�����0�ð�Q�)2��1&�^�dv�ܩ�^���>c�!y���u-CnU�c��>���q������tB����{ױ��L����sׁ��Rjͭ;x}���v}�4r�p���S`�	�8 0_����*N���k�1��;�o?����*�>��)*�}�T��B_=��y�����|��8�Ǥ?"��z>�%���}Y�O;�
<�*[�Pk5ʫ�#|yuH���Χ���G�ӏ�<�#f9��s��+0�,(�U~2ٱ�}�1��ш@>朐>Ne}���ܓ��
;��Q�b�L�\B&�&��Y�q�{Ǜ�vǐ��cͧȔ���!�;@4��Yf�j �BԳ��~Bz�(��&��š�ӣ��M#}l��s|�8��;�Y��3�K���ףֿ-�	�I'�]G�6���#� �
w�������X6�cQ�N^�eH������z���C�;{��;
yl��u$NjyLd�'����ǵJ�w���z"��Ȱ܁���`��)0��q 7�E�����2;�L�vu��U�?�4�:��@������=��N�>e~��:�v!�Hfg���{J}<�y=��s9�ۏC��1�),�}�^���}	6]� ��\����u �A� ^ݟ�Q��)�s�hJ �5�"SN(�N�s��p�u������Ƞ�[�M�$��1�d0ωʫ�sNH�rO;qe.�
;XC�.i��R�ۏ����{>��6rç����q�'�&O�2W��h�2E}�Yn���m��=c_$��Ʊl���B3����"�z�>SG��L�E�?B߷$��m�]��.��ѴO�?6|
�9Ac�}F�e	N<e���t�L0�:KՓ:#�WG�F���(�w�{؄�1!�r��q�i�<�)��x�����	C����t�<�����˭��)�æ���`�%������Ոaz��Sd�	�8$�^M����xk�c�A�
����������S`�	�8���3'�P���X�*�;���<������?� ��x0&�Gϧ���q,;x���e�i� 7��1WA����    ��ʫ�sNX~���כ��i�$ere_��^j�ģ��������qL�P�x>�%��>N���Z/?.������q��{ˏ��~�lB�T�9����)0���q\���cY�L���M��459菵�ܡ��[��#��m51�cͧ�����qD��q"����}ב���挗q|������ӽ�����q<&�?z>�%���1�9�p,W)��/&?awX��s����<'b0�i��s�>&�c4����㫥>:�=���J`�?����Q����cͧȔ�q ����h"kU�"wI����9S�"-�h}<:�Ӏ�>�ϰ����t�|�P�+���2�dm�˫�>�)������ʠ���c�g�ϩ��rB�8�9��c4���i w�K�7��H�?��߁	}�_���rB�8��٪�`څL"Y�W���ci%��Ϡ������8�����d�N���? �>��)*�H���8�͟ˮ�id�R�?����u�F�A"��G��e�[������c�SX����Op�*��A!~�_ �j0Wu=�au1���	�<Vd�0�Z�)4�H<��1�-���J�T{��u m���z7 �g��m!��>N��1G���)0����$f�ǁ<�gy�>�\^���@�ydX��DS��O�9G�A��	�y�(��)��!=�ީ��:�6!��Pw�Te��5�W#����������/KuVx<��֓S9��5A������4E�H��V�Gϧ���q(�3��A2��
��Uu��d��|�5��;�'�*�U����3`�+>�f�0�:"�'��e��� �¾"."��@�s��q�0�S�)2��� �bY]���������A.#� ��>�=������P�)2���`>g����pwu*ȕS�O9Kր�>�,UO�����0��qH���)0�x}�F��A,K��@K5di�A!7Y	���s��"��&#����).�x�i"7�E�����e��*.]G�"ʿ��������Y�A��2B�cɫ#����).��q(�����5�{U8��:��P���:�����W{�q�w�j}��c�0�>�e���#�����rM��ũ��4Y�wAۨ��{ߍ;��@v!	��Iİ�X�)2�}�l�~ߪ��+����|a]zAAb�����Gʠ�񔡾��u�>Nd�q8���/�/�r���XG��:���?�>$I�[y>�%���S�wJې��ԧ�:�Q�
򨟠�0��n��8���<d�~�)ʫ|
�;�=���Od>_��h,�R������G]�f5�}�+gSy务�3��y>�%�:},�q@P^�e��B�cO�/oГ��wϩ:Y�Ա��j�0���)0�����>e�?�d���\�j_���#�<2�L	��S`Ω�Jyd���d�,�G�䋺*�խ@�>>��d�#ꓜc:���cͧȔڏc��uKːh �֦��̡�XZ����&���9�x�`N�*��R��`��OQi'�W'r�~�ǲ�}�{�q�
٩�0�R�����w;��[Y���Sd�	�8�͟ˮ�i2�]�Yx�|Q�	��QC���q=��Y���#p}L"��O�G���("����ev����N��ǋ:�>�j��{�B2�c< ����������3��tL��i_n��?�d��g�彥-$�˭��d��돕�*~}��Sd���QB�s{zs�I�@�j����=�(ڏ����t� ��⒎_���d ;�e�� �ޯ�������?�8s�oi���p�q�Q^���t�>N��Y>�kY[�\��h?�����$����).���T��߲�ǅ=��:��_2�u���x.(�1!��w>E�oG��p$�G휁|�� 8ߵ�����_�<��k�u$m���\�a��OQi��q,�ϳ��i2����A���!�{9��nn���-��6��R��W���?"�ǆO�9ǯw�	�|N<���O]��*d���vV �_�ͿuC����cX���rB}u(���hZ~O��^�:�V?���\�_u��<�]D"�?ƃA���Sh�	�8�͟���D�7�'��j�:��um�|�T�h�	V��#�=@ç�����I_�"��/��������P���b�i�u ����jS}�]��"���4!��������L�>���_���w�l�̮~jUtE���?�9�� ��IF�9�|�J;Ac�=�珓��K���<j�
�>tBː�M�S�$�y�I������t|�1Id�?$��\9�j��ju���q��^}�
��*�*?��;�`O����S\�	��Dv�S����ک�:wI��+�py��̻��m����6�I�����t��c2���D}y�gL�� y4)��~ A}����S�=�#фa���S`���� ����L��������yY���M���*e��2�W���v|�8�)�?�~*��_!ߎ��ޫ��M�`��?���Wk>E�?�3H�f��:�v!Q,K�Z�+�W ��a8߁�>FS��jç����?���u,-C����s��@�!�o]���qk/ũ7KՓ:CZ�0��R���|�K:!���n%�HT~���2K!ϰ}@��q�\~R�f$��q�c�SX�	�9#���,+N6C|�xT�����;�q���ʟ!3����c�SX�	�ձ,����r�*�2yTv��@���r�]��q
��U��A>� �SY����$�en��c��\�ON�;��h��^h��G��1�9@ͧȔ��q����PY��?�M�}��@�霹r65b��A���sN�Ǆ�����I]0+5��~�=�.R�B�>ڬ�-�[���<��W�²�^e_^-�|����Ҟ2�V@yd�&�v����yl��t���pB�=~>���ӫ���R �<�[�?���ϰ���)0�xy%��������J���M��E;�!_��Ǖ������tJK`H�@>�_]�)�ǅ2���{,t��������Z[w4�C9�;�>�<z>�%��>N	V��\!>q~�l�_]��.���p.�W�hL��%�b�O���#��YI�rk���������;g1�9e�8��Go ϧ�����ḭ�8�ݛ�jS�Bɭj��[�߻��-����.пRk��a���).����逢�����u��R��aNZ� ��[���3n
��~�H>�_^�)�q�ΐ_���Ue�m�w��g��e��ٟ����*E���).�H�V�1A�|ϭ���u�B���͞A7�*�#����*�<F���Sd�	�ǉ��_�>.U�|�����0� �G���cu�����S`Α8��q*���ci2����� ~� �j�gP�����u-C�6�N,��j��	�>���ǚOqI��>F����:���x@� ������-�E}�^|
�:M��c��z�u0�B�<�sI'@�'�j�X�`<g�j�)2����@k>E������of]�.dR��*5��W>@л���w4���9@4e��6|
�9��:�|[g2��:is�:�!W=C��?~I�3�~�0���?z>�%�f~5�d�>��l�u-C���0[����P��]��X�)6���Dgۮ�i�j�Q��S����<��3g��ny��=�����uB}uJ��Ѱ�{�:�v!_�+�����-��-���ڣ���ǊO��1_������W��쬃|�Cv�-���^e��umCn�O��W�� ]�D����h�"S���Z#�����]H��B�B��d��� �w''��A���)0��1�[��RcY*��X	����9����ch�9��jç�����Q����:�v!���AW-s���ۮ#h2KՓ:�X	��h2&���|�L9~�#0�G2��t���G��������V�uV}�c9ϧ���ǡ���q<��\u�:�!��:c^b�    �#hrS�>[��	�s����S\�	�8�͟���Һ�$r�9�
L��#�}|��gH=��N�ǩ���mH��t��Y��@�}\�<�g��50���;���v�{Nܗ��_]�.$��V�+��`�L��w���"ټ�wr>�%�>���G��t����X`��U������P��9X�����0����tB��0\��R���[5����.�a��ZP��ȃ	A�X�)2�xw�x(��e�$�ϯ��U��dPg�*�Ip��9}���
��~_�����Sd��ۏ�Hn6���i2�YV�l�Y	�!������z=���^a�W)ڏ�A���u�<�e���XZ���R=�"5���XZ�����oLVm w�M��ro�� 	���#��w>E��0�3���X��V�3�=H�v��d{ ������������c4aX~��O1�'��SY����eU���F���B�S�'劮i�9��Ys��ZY�s<�⒎�Ǥ/�7�e+)o��SAUQ@��d?F���H0���95�"SN�G����Pm�tG�(�1M��"�}d��˫U}uJ��5�"S�o?&��>�߶���>�qAf�j	��"������*��2�4��G��������1��]ױ���=��;�ZC�Ze�Ŏ�xo�"��#j���='�cŧЌ�Y�V]�.d2�+�_��^9��ʲ߾�z���M����6��>���q�0����tB�8�X�x�]�2dg��h3�A�q���6þm?���K>�&��>�(�q��^`���;𫫷:+.�g\�'��G���OaY'd�c
y\+���V�{�<����[�,W&��G"��km����V{�����OqIǟ�H&2{��:�v!�X�����A�Z��B��C|�1X�7ˏ;���!H)�;�²N��2����R=�I[�VgM�vE� �>2x����tD���OaY�珃������O��u�B�gS�~{T�v9�>�r�s@��U4f�ǚO�)'�cDP_��eg^��]ȃ6g`��厛45�5�}r���8!�?V|
�8��:�)�svN��V�����u��@��R�zs�l)��S:���ǚO�)'�c";��U\��o�������um�`<|<'�3x�7|
�9A�8)���<ٿA���L�?��~�Cy5��s��~�f��:�vQ��Po)�@�֜_���/�sf������9��OqI'��H��$�̲�ӟ���E�V����]�WW�o]��.�є�\��).�H<��q,�3p��s�3t���G�9�r�G�>�~$��	C���Sd�	��Dn������䀇�{��\�W��R}����HP^��i��s�xΔ� �B�Uf���E�C�{(w�lT (�6�r��ZwI[ pϩN?���S\����O��x��L`�2i�� _wAېo��� �^M�����S\ґxT�c$��]��2$.tz��؟� }�/��M�W�^^��\��1�>F�	E��Χ���˫Ø`�cT�~̬�:�6!W���
l� |4��f9�C�ا0����s���0�(�.m^��wv_ ?��w'c1�F��c4�X~���r�r�p �ϳ��iOd�O�l��;�>�b��}�Ay�`�	{�����Χ��ʫc��	^�*3eY8��V�>�L���fy}��Yq�?���lwD�>�>V|
�8A��
�Ӳ�#���/�_��|U{�S��Ch�#�xN<e�=��N������{K5f��C�~��@�l�wz��`��(!�ǆO�9�珣H���V�XnMl�ի�1U�b���=���G�O�P��@>��?�b�����]Ȱ/��Ɂ���M�Ծ�(ڄܭ�_rr�3du�X�cç����D��߲�O)k����h���z9���G��{_��9�4��9y�gH>���8�
�|u0�+W�̑��T�g0�A���md�$�!}1���OaY'�W�2{@��U��_]��.d�SpY����Kq�t��zǔA+>�f��?��q�n��r�
g��VY��uֺA}u�R�ú� V�*�p�W�²Nh?�e~��:�v!�n��5Y�j��k��*��#�q+���$a���SP�	�����1���9�@�j�����'�^NP_��g��
�5@��ф��cç�����`�/��W�
o�!@�Ze�]���䀃���$����N���{�>��11��|�J;~>g�qy��R���r�[:n ��1UO��{�Q��q�!�5��N��H6w]��2d8��S����Q��?~��-!���U����ϧ���[�cY���u0���ޱ�lt�R�6Ӹ�ڣh?~I�3���#Y���>�e?�:N��|N�� �~�G W6���6M�Q 	��d@���OqI'�W��tR��; ��M}U;�A� �����[�1�}L(��=��N��� �ʻ۠珧����q�����#f�J}L��1�3�wx>�%��?�(�W��[!���G�����v)ڏcy|
�:A'��/k{Rg}�:�� ���f@O���Kֱ�uꀫ�e��-�,ǭ�²N�ǩ,��?N�V.?����ʹNU�� X�x�yQ9����d���r���h ��OQiǷ'�\}C���PJ���p�!_�;���� ���G~���cU���������q(_��g��cY��r�9�\A���9I�!�]G�66o �H�S������|�J;�}u2"Xe~r&/�����;��� p_M�	�>~�)(����dL�N>�Mf���Z�����	]�i�T��dG������s>��w�>N(�;֪(N�gב���|���Owt��<&�<⧏�OaYǻ�N�r?����凴�@�D�>��I��sv:+�&ר�Ȱ�Mc����S`���9�H�·���պ�#ir�5�`�?�9`h?�G���S\�������Uy�Ag�lב��v�%�A�>��}��c5���>>�e� ���g]�.d��Xtx�,@nMv���� H�m�]��.(�;�W�²Nh?(�s���\b��*N��u-�`:��62|u5�	��S`�	��X�o��ʪ�qeA����h@p����D4�� �>��ՆO�9'�c儴�:�v!�X�U]�'\���:���֐G�6@O����8�1b��x�STڑxT���xG_v��?]��*��	���8�a��Hum_k>E��f�#��	�ɧ���A����*x�:U (�^k���Z��#hy�ڏ��jͧȔ�1����d"K���Gy<��@}�U ��W���>�x��S\�iڏ�Ǽ����H��'����Q揯ո����u(-� d�~�7���s<��N��D6�'g�qu�s���u.�����Y��l��8�����d�eVw�)�7����N��d���`څL�j]Ǡ�֐����#��^�:]��2(������hL���OaY'��P�7���ɕ���G��F�ad���M�	3k��!���a���).�}��{ױ���I'�ߗh�G��d��dd�G�zo�"��#�K��G��՚O�)'���r��FY��/��l�'xw��u��Gx�Ո�Uç����	Ayu��gg��]�&d�"v����ۏ�����C�ᐠ���)0��qJ���̲��?���E��>k�.�/�;�����[�1��R����D����t|��e��].�����u���G�R�VA�s=���]5
��n?R���՚O�)'�ce�� �/vy��;6_U<��9>a�j���,UO�\be��R��S\�	���l�u0�Bƃj]';�y ��2L�xs��* ���a�#�),���c��b�.�8���)�;@����� ���zֽ/���:�v@a�3$�=�⒎�q����,��]�p,K��b~H�JS���"+x}\�<�g��5د�1�}��S\�	��!�u�q"_�ʰ�;��r�:�VAP_}|�g����=�3��ϧ�    ��c���c<-�;�ض��؟Y�5�8Y��������� {��^�����S\�	�����pX�������ɟQi��=9�y+t��x��S\�	��T6w]��2$�Ⱥ|�+w�:��P�bX�?Q�Ǭ)�W�G}|
�:+}��r�?�:�+�.]��*�]�Q�	}\+����m�W+K2|}���r��j��כ��i2ɵ��b��|Ui�u�B��9W�T �_W��ǘb���Sd����8&�ϩ�sJ���?~U�i��k5����Aq��8`��(��tB���-��\O�C�\��i�WeW��C�V�w���O���J'���D	�~Gç����s����/��\�*�Qa/�0̯�S}�#iP�c����>A���)0�}�n]���e4�[��Tc�� ���|A�V�:��~,�s������;���N�?N	�s�Hn�C�CfON���N�r�� �_���xB�?�|�L9^�����#�Yj�ϸ�c�{����U��R�::+.�g��)�}�d���|�K:~��L����Ǒ,��s�U}��V��c�?V�^^����jB����)0���c�|�;2��FUWF#�ZՐGU@�v���@�Gx�$!��>坠��,g��:�v!é��R�3,��#wD� �w�/��vz�:����@�l��s�>�qT��>r~�|�y��°�?�C���l��s�>����L��A�� ;ȷ�����خ#i��GU~��X�>�J}�_���������q$��Ciҗ�N����V9�S��<~��W{������S\�	�c�ïw��V��v]�b��fǳ.`�J}|4��f��UH��@>朠����/����vX�̕Cm4 8߱��� ��>��������q*_��o��ekS{��\]�)��߶�z��W�²��0���չ2��XU<.�����Ap���|5�:�VA`O�q�*�),���AD`0�����h��&ìt�u������I�'X���q|}u�\k}�+} �z5 M��}E��x���7ǃb�q@���OqI'䏉l���0��r��#��ե�0Z��*C}~�a���).��q ��m���Ndix��VG���{�>���ְ��|N}Q]=��N�ǡ,f�g�$���ɋ�#i�2��O9}�����B�19�c>��>��).�}����/��>�,K��O�!�>2�����>z>�%��Z'�rK��/s�9d�z&� 7��(�ں�Q�
I�>2��²Nϙ�58��돻�O�� �u���/5� }d����1�u+ϧ���˫þ�>��D2�g�]G�"��)���G���Se�eS�zZR�#E����t|y�����g�}��G�� ���7{6ٱ�8��v�;��S\�	�c,���ci���R����_,�b �>��_
�n<������S\�	����{ױ����ΞϠ�����O:{�5� �ǻ��,�lN�C��@>朠����`,�'�ЧN��H���*��W!�� �OqI'�㐢���O��.�q⡁\�C�{U�WMtAې�)��p��@�8&0_}�ST��ǭ��[=}�dc���;J}tGsImׁ���[{��^�7'g8�Q�)2����ᘠ�8�d��:��!ש���р�x�Z�j��P�� ]�@K>�&����a�s�RX��,�ʪ���8��tΗ�:s�6ρ����;>朐>N�f��:�vQ��kU ;�W���*}հ���)���⎐���q�F��5�"S���q�̔�������޲��Mv0
�����>&���s�OG�l��eO٩�r�:�6!W�8]2Ȣ\}d(��LN[5|
�9!}�l�~�qЗ%x	��GW8�������G
�E�pB�ȱ��6���iב��R�i�+A�X�J���!}丌���u�<�d�y�u0�B��*����.g`����o�B��i���M	�s<��N(�Ne5{�:�vQ���O>�����O"w�m o9x}LF�X�)6�x�q����P��Ϋe�q�i����u �A����^p	��<V�t�˫�s�/��#�����^iu���@ڄ����y�ۃ }���&�D����jç���˫�Xf7]�.d8����/�@v'{fV���T�s�����`@�?z>�%��?Vw��[sR���3yap'e�N��2�e��xΕ�˫s����؀��v~�SP�	�8��o�s8��zE~��wR{F�ˇ\�!��9��3������ l��sB}u,���V�D����!=����,ux���ѓ������c2d�ǆOqI'�#��m
��2yP���/�����u0��@o��d�@�M��>��jç����q�'0��N�������ܹ���A*�@���9��S����Sd�	��5�P`��2���ۧ�i���s�A�
�wAې�+���ڟ��4|
�9Ac�E����%+��;6���V��x���;�C)n?z>�%�3I(ڏ��ԓ�:�6!w�F�6����G�3?)��Vڏۏ�sN������HNaW�ds9��E��#����)Cy��S`�	�U��V��\��dwq�v��T+$y\m�uC� ��I�	�<>�e� �#Y�/?�cY^R`�^ݹ*�]G�&�~z�a�c����@=��N(�NdoNޗYvp�gׁ�yPo箃h���s�N��� ��1f��|�K:>}��eo�5�J�4t��`�L��9Gེ���7��uב���Ո@=��N�ǘ��:�G��/w<�K�=�_^e��˫C���).�}L�j>5/�H6f����@���]G�&��ӫ����h@��5�"SN������-��)�u����aI��<��<�bF��.�q�0���)0�H�Vǉ�f��r��2W�]� ���R����qc�{uF$�
�����*>�f��=Ne�����P]~\(g.�s�F��w��乽8\�'�	�5��S\�i�1�NwL��k裳��Ɏ⏵�<�/!q,?W��ՆO�9��cQtw�Zf�:�Q��G��LjQ�J����V��� :=7���[��Gk9ϧ��#��Xv�ї;�H��I����ճJ1m,<�sv:�t�k��c��Shy�IDa����t$�k}�\���J��z�q~yy�:�VQ>��exs��ޟ��%,?���Gϧ�����d,_������S�t��M�W���|�x�������c�0���)0���c2%0�K���}�{�q����|��b�cvy����?�N?�|�L9^}�Û˕���jѪ�̞�:!/y��Z����ѩ@0�Q�w4|
�9A#�����TvN���W�ݩ}Ŷ��7_�������c�?&��ϧ���������wKːd\~O���j�}i�umCf���X����
��8J�ǚO�)'�c���am��4n᪺V�:N�	�[=�g]	��A}��s8�[>�e��?N	���H�6�?��%�tE��|}���>V���ǆO�9���/�� �L����	=8ߓ+g�G���;�qn���2U�:Y���=��d�ǊO�9��W����x"[��K���Ns	�mU���xq��W$�_��>�>��)*�}�)�W���� '��ũ�95�"A���<Cr�;(�ǈ@�²���Z����"HT��쟻��U�}z9�1G�ؓ����&MQU���Hq��Sd�	�8��ͬ�`�E��x��r�X����A���������Zg�3:�>���1I����tByuHQ^���5��j)��GJ? �)��̭ʋ�W:WΦ&�S�Rpy�'�������W�����? ��f��t����˭YL�y0��?�?Q`�	�8�-��ln#gh�����;����o>>�|o�p�����]#�ۏ�OqI�7G}��q�*=�#W�9�y`��:�@)�lN��cç��#�Ǆ�`��䠝�{��p���o$X}�9�Ͱ���    �G��cç���gsF��q�y�ro��s�.��+H�9ty���cŧЌ��C��7u�iuSo�|�xȕʞ��@��qm����b0SH��є!}�|�K:~8g4��]ױ����vݺ�|��|����h�3�i����W��jBaP�)2��qBQ^E�QVC���'���0Z�nG�>b�cD�>z>�%� �S
y\�p���\�'{�	���ƫ���є�8��S`���9�B7�����Tz�̓ {|?��y�q猆�cͧȔ㛏�Bg��wF���E7^�Y�O��̸�����X����0�S�)2�H��8���<T�V�����k�0Ǭ=fWw�o]��.fW����X�)2���"}�_}|4�����u큠�xw2�� Z�<F�1A��Sh��9�\��z2���Y!O�Vk���l�����T��;�Jp9�3��5�"SN�>r�v,/�U�w�����\�uY�}��T�H��iB ��sNH9V;6V���U����y}�@o�O�̱A����sj>E��=NJ��ܑ�2ιro
�Cz����>��̻��m��^L�jRX�'���9�s�Ιp�>��\�S}��	by�6_ͺ�UTW9��Sd�	�����d��ɶ�z|����."Ր9�C�?�:e�i��s�>&ë��,lf_����Yf�#�k��ܭ��e��^�S�Kj�9@�!��8a�=�²��Ι�vY��8iH��U�=��E���wAې�*;h�dҢ�PZC�8��~�,�),�H<��q(�7�_S�q�޹���U�F���;�Z=�߰�ݸ��j�8�Ǥ?��K>E��0��ᝳ�� WW+3�T#��Uy� k}~9�Z�;��^�@�S\�	�8���M�����&Wz�Qn
h������ǇKq�[��"��1�>z>�%?�3����M����:}<;�:XAn�=c? �[��R����`@w��s�1����S\����4��|�����~��xzU�*/R��y���q��L�9�;�A�}���;��Ҏ^�����W��F�!�'yI��;v�/��vz� /!�O��DSy�|�K:!{LfWCY^Rs�{�|@u��O�Gׁ����I����ӣ�]�G�ՆOqI��vL��
�Z�Jg�+��굶�hn�P]M�j>E��0�S�u�gW'#ٝ�YA���<?�_k}�V`N:����<F����tBy�c�q�~:��qSH��o����}��*���6�G��V����|�J;A��8���+'@���:+�R��X8� {���<��N��Nd>�P�Ye�`�ȕ�?+��i�UYoa�����B��a��}y���r�<N)���[
��Qg��ߜ�3��+d�I�0���)0�4��A�O!��x4���w4�c�Q�	��#�o��cs������t�_�cD��K{��������E ����=�,�.���Z���cͧȔ��Dn�M�z2������.������/��:��![8�[�9dס�S�2���=>�e��Vn��=�)y2����߻��Uȣ��ģW���ϐݛ�ȟ.�;�:�4��h2"�k>E��f6gПP�W�fR�u@�z��"~�:�� �e�2A�.�R�|L��������˫Q$�?�]�.��9���/���;��E��j�}���RTWc��ՆO�9�g�Q̰�8���r�ؓk��΍���dp%7��d�*Lס����>z>�%��>&����ʩ|~>�XAf�A;Е���_R��A�fE������w0�Wc��cͧȔ#q\�㐢�x�p�.�35d?�6�Md[�n[S�W�>C���)0��*�+�Ω3vu�Q���^p� ���,��x�ȣ�S\�	��1�M�$�+]�˻��Eȕ�O���t�;,��:/z�M���JR�v0xx>�%����K���=�@^`ι�?!U��9$�9��8� �%��{8G�mQ@�W���Q����]ֻIS�YG>�<���1�3�Dn��s�<���K��O]��&�Q9��_ ��o>�t5��k�J�<�Cyl��s|q5�d���XZ�$ٝ�ۓ�r/�O���:��A`�:�a��h�0����t�>&����`څ�#Y+��iz����Jt�Ayum��^�1@�?��*��	��>坠�Cg����Eq�?��=T�+�M���������tr�G��q�?2�cç��ڏc���<�JS���ʊ��h֫;����eo�8�W=�⒎����o6]�.d�R�'u��|@�6����<>tB˨�Vo��]��;�Ʉ |
�:A#��Յ�,��jI���?}Ϋ7Y�]ePn3�I	�1.3����),�y�)���'�r��[���Ԁ����Gy�H7��1�<�|�L9���$���D��{:���O���
�83��ź=�rE�8��cɧ؄�ǁ\��NOƱl_t�����Jm
ݸb�^��szs�lj2�	Vw��?"�>>�e��?e>�z�9�7���d�3������En�*�mU �ëC���S\�񇭒Cyu ;���r]���Ye�$�]�;���l@P^M�S}���rB��q�c�m�` @��[��q���.�ܦ�)��G��ʚ_�²��>����ZU�ֿ/�n���Ѥ�Qg�E�� �C�9�l;z���m�Zy0x��|�L9A9v�'�w'�W�z��6�p3d�����9���>�_]��8�� ��\��>�dc��!�tNwԇ�Q's*t�a:��Sh�	��P���-?)�w�Au� }������Sס���U���������ˏ}Y�?��U����;�xu�U��
��A4�	��cͧȔ�qȑ=��~� ٪��:�?R�m����q�~ʺ�Sd�	�8"�G}�ٳ�7[��uC� ��`p΁��N��<�⒎��e��XZF}�J�qQ�������~�ʫ��pI0�M�ՆOqI'�� �e�A���T�\f]��Gy�!��Ro�v��q.���pGɧ؄��)Ayu����ړke2d�u�U��*|�1�cç�����a�"}\�u^��,��v�{�f�c�_�#i�5 vy�����cͧȔ���a$W3p�g�en����ruIS��:�� w��9k��0�y��I��}l��s$�k}���ݷ��i2ȕ3�AN!˿��g���U��*~�����u�u�p@�?�G�P����/L��⊮ir�umCf�zRgDa�`��>�>>�e��~�|>(���9ڿ�~�̲Kn���8�A�����yv�Xy�1X���)*�}S��\!�C� W�:H�A1�Z8]>�ψ�X� }��	�<�|�M8A'�;�U_G��&��ަ)��g|���Mf�99C�8b�=��N��)�t�d*�R���S�[�2L����V`��>����S\���9#����K���ڠ'+ ��9����s�RG��D1�<z>�%�>�"
y�ՙ��`�!+��S��N�ٜG���ǵٟ�pԺ����l%ј�:��).�y�)�qk��v�5��U�e:�Y/�AB�]G�6dwIU�#e(�&�jG�SX���9#����Za�s���w�Y5_������M��cͧ���q$�ϛ��i��r��P9��,�����J�������G����J�>F�)�>�|�L9A9�Zm�����maR�2����U�n`ѓ��5�Gr�*b��6|�K:��8�h>.��g��*�@�N��a!����3d���D���|�J;~�c���[�?ى,�[��>���fȷI���Uv��ɤx>����r�OqI'�����7����޾`;���rV�
6�0ιs��=B��+W����X�)2��q(�Y���Ne��3���z����]K��:���aK��R����������E�q��A�[{��f�G��1����<&�1A���S`�	��B�z��}���	�x��8�*/T�{���\�    �!{|
�:>{�pخ⻒/tzD��1d�k����Lׁ���1�d��OqI'�c,;���̲�c���\��E���u$m�����=�,W����1@�0d��OaY'��@�_o��]H<�}8`7����y̓�8�Y�)�jG4��cç���s&C�=���t\�wN6&����ڟ]��fW�Su�gk�J`O}|
�:!���e���)��+���7�\���[��Q8��ꬸ�q�q�8d��	|
�:~xu2&���2Wq��~�� �U�!��6_a�!3L�R�k>E��P_�0&�O�{��>l���T>����d�޵Ә��R��"7w���ǒO�	'�#���L9��ǊZ��SHD��Ucr��j���Y��S`����i_���+:=IY�rNy4i��;C�j0L�����S��?J4e��V|
�8A��E�y�Uɕ=?)w �+�^7�'���MI<��;�N�P����ՆO�9G�Q-�C
yܩ� ���s�
�:����V.?)H������@>����8�PǕu:��9ge�#�ny�Og��r�ќ�ϐ<>�e��1���{ױ�)�s�q�:{�6^g��{����4"�ǆO�9'���8ד+]��*��Rd��u-B�]G�6d��sJ85��I�Ak>E��F������T���(d�ٞ��d�Ã`tu��[�2�o��>�%�⏮>�e� �	�<ޟT��k�![������w\}��'��g�k��9S��Gϧ���ctum�'��~����y�4�@�F�M������vJK`Ή����u�<r��}N���Sׁ���jYnU���W;��a���).�y䰕[�O���5��������#�<r��z>�%�f�c�)��3���h�.��uF���]�!�Yً�_��u(-���	�<&��jͧȔ���c�f�#�L���x����{+ ?}���7WΦ&��!]��}�|�K:Ac��l��]T��R��Q^C���6 X��]R�!�L\�'���sN�GW����'}���p�Z����cͧȔ��|F�sT����?�ю�:/��� Ω����Sh�	�9#
y�zC7|��.�䔵�I�+��Z�i��<&��Hq��S`�	�ձ,f���iRYY��odc��,�_�/���*��w�$��>z>�%��>Ne�}8'��.�T�Gk�>@���0���+W�&����t|�1��]�[�ߺ��M��Y{�~ �wצ�jeHi���:�3tk>� �CY���u0�BF��}���֮�hr�umC�>����&��ϧ���ۏ1�t�,;8�a�w�\��Ǣ�,>wBː��`f]��<��>Au��S`�	���K>{�z��j�]�*��_R��w��1�cͧ���q*�Y������z;`WW.���:�6!;�����{����ʐ>��Uϧ��㻏IL�>>�4��/��{U8��:��@�|�ͿuC�(�q .�I2!�Gϧ������ݎ�J�`����T�b_p� ��y�ϰ^$��q����S`���� ��|f^��0���}��x*���;GV[��^�	�>�|�L9A9Vo�~�{�`�@�t+4��uG�z;�?uL+�h>2�>6|
�9AGr�YtL��Q��Si�\��N"�A�t���'�z��W��\�>�p��S\�	�Ǳ,��冣2�zո��{���I�݁ʫ_��3�������L��uB�8�(��L��)p�(�;�>���,���Ɏ��S"e�i
.�ј!}|
�:^�ë�N�W��C5yj@0����u�-sHЍk�ո?"�=�⒎��#
y�ɕQ�dn��,�ϯ���9U'{�u�#(�&�s��S\ґ~��� � =�S&�&}�4�@pyc]q�.�^d��6;>�P[���;e�]��&�O{ɰ�B|y�UY��4����cLQ[���s�<V�������Q������@����?���{��1�>z>�%��{��Ʋ����s�>�q0�������m;�:�v��|�38x>�%���S������Tg�� ���`�x����__�L	�ǆO�9��WG}��1����|�c���4��#�s�G�۱�Y��\cW{�>�����P_�|�K:>q�v<�Ci� kUf?����w'c��UL�r�vx>�%� �
y�-����ؓ�=���t�wI[ ��W�ǨO ��sN��!�<�k�2y��?����>ʣ��6�q���s�d*[�:Gç����c���D�:ϡ�sd��d�u��Z͜��f
w����1�>�ë�OaY'�����Aa�������&���=x�bK�	��c�	���sN�G��;���^ _��
�!؃@Q7:�� �	C�1�),�xyǲ��uL�(��ک7�"@��/��<~D ���+������<>�e� �C��	~�]���U��Q[�C|�0��p������q��I��&rç��#���Eu��� �V{�O��xqN���GYm�uC�(�q .��!}���rB��1�3{3Л=��*Üw��Gp��/|�g�z	���cT2*��jͧȔ�W;�S��,��]T�r�T��u�B���9d@p��������jͧȔ���I,���x ��]��*�e���	h@���s�E�p�*�3�Wk>E��?N��s�u0���%w�S֐�͜-v�`��K�2�oH0�J1����tB��1�s�R��umB�Xw�m��:+����Ww�/����P��U�_>�?�:S���tVN+�Jy�r�'�ף����Kq�͕���T�ᴀR'��X�#�U�w>E�_]��)��#wF��{u8��s�q��>{dp΁Ι2�cͧȔ㋫S���s��֫<�J��P�^�w4�Q���c�Y��EӘ@k>E�_\�&�x�+�����ՇK�DR�a4'ȣ�S\�	�U���;��<��'��Z� �[+�����u ����\�$!ͩ��q�_�#��꟯%� �Ƀ9>!����Vn��/�= ��j�0�ux>�%��z�\]h����
Y�,3��0G ��U����V�sN�G�����q�l���⩆����eT� 9�:�;Jy��c2d\|
�:�dΨϱ�񠲃����TE�q��e��#�*ˡm&sJy��?�<��N�=��{&���=)��umBv�����#�<�_|�#���S`Αx\�#Gquv��=n{�|�0��s�N��[_%(��C��V�⒎�#����ə���������g��#Cq={L���>� ��W��di3�8B�G�{�H�Ŏhʰ�Q�)2�xy�#��uKːI\���z;|@u�iD@P]}|�g����=��8 ��x��>>�e��5gǲ�ͻ�]H2��g�a� _�Ap�q�_����1�1\�j��sB���}ܨ�2�aw�^+P�'O��s{q��@Z�E�� }��SP�	�8(�:���i�<�q1vuu����ز� �>n��S�3n���}�0t�²N��V� ���% +렍��g�������+Uy��N�T(�����+Ynɂ����}���r$)�m��d�MO̥D��
Q,��_�,�`�3�A :���� �����b�I��#�ǊO�9�N9V��;gUB�E���TC.ێ�i���bs�]@b�]���s*>� �}_���Xk@M<d�:wD� �����8|;F����X�),���~W��G����O�*ϱ"�w���W�)N>����jŧ��S��=�_����zw������u�����!ێ�iPˡ�c��0���tjy�j^��~_��v�BV��xD��%H�T���z�����U�G��Sh�	ë�E�q[X܅2Y���*Ӊ��?�b�v�<b�`��7a���|�L9u��a��V�qm��$�R'{?h�b������`�����]�M�X�)0�yp̮��Q+�b�����4���sۑ4�   ��W�0���UE}S	�Z�{���OqI'̮��p��SA6�:�!v�k��l�7����ѯ�T|�L9�<r��)��G�p�_�����*�u�D�G�7�+>机�:�-���d"������o�&yw����>�U��>=B�9��ހ!}���sj}����ǫg������PA��=��G���N�F�9��G�U��Ǚ���mG�4�H�x����ѝ2\��|
�8��8�R��9�E���K�\%�I޷��ܴA��9���mG����!�+��Sh�	��p@!�X�����{�Z����9��aN:� �i�3,>z>�f�`�3S��M��^���}�7�%A�˝�%�Gs|��1Cq��bO�G�ե��#$��f�r�$7�����~�G�<����p�*�).���ؓ��m�,d0�M����2w�'�]� ��-�N!���Y��xf|}���sj}�]]��������z��
�G���zm�х;�Ā���8dh>>�%�xu�n>2/���A[\�/�*9�����h����j�v��A{���������D�� ����T��Ad߹��ruJ@m�"����Eu������Q�)2����Q]ݾ�Z#/?���h�N?����qEG�:k�#z����j�S\�	� ��9}\�L���9K�;b>� ٘��#Y��>.�5.���`H�X�),��qҧH/�=xuu����|�^�.5{�r�Ivm���N���p���Sdʩ�Õ|�B��@.Mz~-� {���3���	2�<g�ؾ9~8�av��Sd�	�8%q�o��K:%d^�9d���3����o�nZ�|
�:�<�(�qe�����1@6�am�N����=������5�²N�͙r�g�� �̭��,Z����!ܴ�(���_7� ���pjy�j^���D>X�P��%�J+�o ���Z�Y�,�s�h>�	���S`�	W;�;x}<���X�j#�C�*�cg�I?�K3 �j�Q��`TT�Yu�� �{�Վ����Sw9�Z�_,��|Y����#Cy�X�;e�]���s�7:����}�x��,���������x��<��*GI�����cɧȔSe��΀B��~C�d�W�f��ԁ���W���c�S\ҩ���ΐB/���i;�� �#������ݳ��	fs:�Վ�OaY��]wF�8K�)\��5�F��E�!_���w/����8���j�a�1�).��j��`��-ɽ�2�.6v�v$M���R%��hNoĐ=V|
�9����i�V�Qg�5��,���Ƕ�h��w:��>��)vG��r��#�I�OaY'd���<^�`'���#�-]�����Y�C�`(�N�K>E���=�� ��ܤ� g��\[�;�9�ٜ��8��x}�0���OqI'��#��7:G]ѩ +}oU�w��;�q�
���� �cw2e�ǒO�9'��#_�[��5��e$s�ǩ{l���l��Ѫ�a��(�p�c�'���|
�:u����M+ � k:c]� {\�]l*�-���t�#����)4����H��#���>�$�.��eR 2���Uͮ~�I4x[9l���a�1�).�c��)��JM�:g�!��� j�T����-�J@��A�7a�]|�K:�)�qB����v�h��Ȱ��*7`PǊO�9�.�r�|��ɹ�i2���j���;��&9�K�gy��c�� r�S\�	��qW�_��` K�� *D�e�[���y��,�g�lN��#�GϧЌFW�Y|��v0͢�=f�*�c����.E�$�|��j;��!������8�����u����Ս*���r�CY܍��"{��]z0*��]�v0����؛�cɧȔSg���+�ǀ��? 7fw�)�A$��յ�2���h03H����@��N��	�I��d��1�[��U�ǽ�E�=��́TG�����S`Ω�� �'u��m^A>�w�R/*o;����������cw�#����sB�q�a��?��V&��Γ~�h��K2�:�w��n>Jw2!�+>�:{��j���<��"N��CY8kM����*k�$:s9�������ѧ���sN��)���5Oئ�K�>A������q���^}$��>�������S��dС�Ǐ��⡄lr���K��9�#���!{���sjy�8�������l�	�=�������}�0�9.>��1�).���8�+���Q_VF�ڎ�Q��.M�^���Ƕ#h�T'�Ek�7�������%�"SN5�:rTW�ր� ��E%�C�5�|�x��<~��~"��^�@=�B3N-�� ް��
ܻ��y4O��=d_�`��A���fs~�SD��/����i��u2pl���ujڎ�9�vl\���̪{u��a�2��U|
�9��8�Gp��f�$ⷶ�h�IaO�Fr�vMC��V��{��A;�~̺�Sdʑި�Gc�;c-t�(��^�9f���s��&3*����s��Q��A���t����X��b�ȧ"�yOk�w���ǭ��2Ti� 8j���1�).����q�
�W��2m!Ǭ+�>V�8�m�v$M���J��X�)0真��������K�~��d�8Z��ێ�)����C�2�c�@K>E���8�PG�b�|��s{���A����*lw'���}��c�S\�	�#S�K��Q����j�vM���x���5dy�0,v>�%�0�:b�����Q�Q2P+� �����0%�.�J��`�S�)2������߼y���2      U      x��]s���ǯg?������K^�l/����s3���ZH.!����F'a�S5�����lN�s.���ۖ�u�ݲ]6�z�[�}�X�x��IT��O�>�b��/_�>�Z����eC�����Ͷ��%y�C�e��0[E���s�Λ>�b�ᅁ$�C@l[[�G��ϯXl �e��'�cLf�~�GP,���N�mJN=�Y��<��T�%��� ���?� w]�����Vl���S��5}�"����ǎ��[�o��l�#�Uq3�e�N���9�xlb��e��@��x�0W뻫�?�Z��2���aަҢh��=ٱ�*�\cO��o�oX&��6�v��@���m�?C	����us���P,6�)��8̚>�*���W���춊|�v��l;.X��[����l{�`��a�C{WϞ]���Xj�.�*�y5}ebSB[w�*��Bl�����|��P�"ٞ,q�X[�b���]�eˁ/�?I�*�/�L`��M�C��d��h��6�.��Y�ʎ)�L�u�P�^r��c��%2�>�¦ϡN��ڏ��3�{{�:o�o}��\�m���!o*��C�Da�n�$�D�l�U\���ݸ+.�V�c�~M���گ���o+�?.f�/�޵�ᯄM�.L���4}5"���]�/�m_���-�����@/�ѿ��(�k���f�';?oY�n{�7���mJ5,�Q�=�<�Z�f�;����0�ݩ�a=��u �,}~F�FM��Kb�6剹���A����ff���,fw�Z�w.� f��6�4�AԊ�`%�<KWM�E���i06"{v˔G� �x�<�<D~3"+�c�M���. v!c �u
Y�6r��,@�T^�7��0M�E�-E�R����q�vLk�WQ�R7}ub�J�q-��*nMx3�����c(5}բV�D�� �n����6�<Jжeғ����{̶?�R$w,Sޛ&�i ���y��q��Q ��_Ry��W�9���9�>l��W�m�䙫�� ��VB/��;�H|�k̓������ nW��}*6�~������:�lY��Av[N�\���_Q ��cƑ6a��{����w��?�\����܏{p�_g�E≽�E0�0x��w��ߑ�����B��d��ľ)������.���e��#��2���Ė�[��~:��4����&�jY������f�o�t�S�)�v�� ��0C� E�d�u��3�/��l\�3�|=��t���+��y�ô�����,ӈq��a��uأ�d:�E�� � ww&�S�k�����e�� -�$w=��[�z�޺Z�;Q�*ۻM��7O�a��+���ͱiJ{	����w�ٱ�g`�{P|F���.�����e�,`;GKَ]-���ppŨn
�ګ64;%�d�U��8oe0��?�0��S�S��:�g����ʞe��L���0ϛ>�*�.7�u��]�k��iW����>Jao�G�#��Dp����e��A���C��$�]S��=�����>�BQ$�_r�|��0�(�m�$�DM��Kb�5���k����S�'Q%���_�Wo�}���{��2������#(A\���bg݃	��(A�O�����زL^��l���HL�Kbw�����{Y���$M���i��@��xoĴ�������4� ��1��A?��c��V����q۪�[C��;�����g�̄A�ﺶ����:A�Ȝ"����صMI��~�$茫��[�Kb�mJ�����g�1r&*n�C�q�I��צϯX,��2L���b��:L�}1߃�3�I��d1�q�Α�L)�����~˔���H��ͨi��� �����#�������Eb�%��j��yAq-�������K�wb�����{v(��Sum]�O�.`fY��|���E���K
�n�5��2��&�Q�U���)d랛ƶcJ�V �Y����CM�X�j������k༡\n4?��*4�M�b�}���צ�L���� ��:�X%���\W�$����J�=S*_���Ǵ�s�"�WH����\U��ߠb[q��ɌK1˳����O�6�=�OQlG�-=��_���!�d�7�-�`����2Ĵ�d��f������1_�]�H����3ؾ�l��q��W��zU���~5k��Z�Z[��C�m�1���!�7jcZ��>���%ȶ)��̳4��AM�F�(��_r�c�j	z6�Ԋ�a�LW|��azZF�w��ÜmsHG�־�m�J��`�L��l��C/�Q���eY{�!j{�]��k������^Iu5�<�!�+��^����0H2����9�Y�1�ר3��B��گcw�h�v��u��]d��ko[��v�y��C/K����(u����fט���G�e���A��a7�%���b۔n����Q��o��E���< �1��_���ض������n-�Ŏ����[��k�5�;�~V�f�Dӛ���!�C��_B�gJ���a�%��Gm�܎9�xƓ�)6e�����Ȳ�rz���K��W��4]��#�r��_����[��-,wMq���u���3������u�Y5�/A�gL_�L�S��3��s���B��\8�m����]�u�K�A�]6}բ��Ķ)��S��P(q�_��i�9^i�{�����)ivvÍȿ��	��o���D3��K�oG��Nq1�;^i��}X�.;D��C��f��R+փI�/�a7}E"���ۣ��\k�)�K+ \f�\�~��ǒ�]d���KP��[�^�����7�=�	�;�L.�ĺ"�E��u;�پ-ZEJ�{�Y��Acu�U�gl>���񺦬p��gh�i�Q���v˔����<��.2j���f��`�K���������?�Z	7�"���V���g >��.A�ޞ���_�y�䫦�LT��_�i�cJ4��Q��X�Z9�������.1vM��� �����Y���W��(aw�����r�.`�ؑ�J�/�ĺ2!�����u�#J�>�2�)����u���:��|�l1��l�˟�nmx.Wд}Sv�`!�T�^��68<��ڝ��� |�i�Hm�ފ ��b�>z�B���va���@��fL��I�"��5^�i���:Y��'�Z��e
�=�X��
q�]�����W$�1(U��+���K�mS���%Z/�>3S���;�)Qy_2�<���=3�wٴ��q�{�;�j��仴�T�#�)�b��x�E����@5�Zbk�m�����VI�Α`�|���9���,D,��d��1e��n6ɿ�K_��׻���N22��l�.;H>���c��!����VbZ{I��Ξ3h��U�]�,_�>�2���}�e�[��T��~˔��)��o�=0#���/jٖ[f�N��ն�g���U�k��S~�:2C�W��zA=yAaZ{Ղ*ޑߺF��~%ζ)8O�.�ٚ�w��2g��),��`�}�V���r��29����y��P'2��_r�0�5�9��2��e�Q&
���>ږ���U��}����,J�o<fs�ߋM�c5��5�u۔)�����wfBY{Հj{��K��h���0Y����7gʰ�W-�.���H�Rlߔ�� ��U��H2&�^��[e!���,@�:�lr��M��P��˼�#(�攃�5�_ݪ�5��5�1Ԋ���`��B�H��N�\�Xw����5� ��p$�7�[�b��M���ʥ?n��VŮ���T�io�vd�����U�k�~�q �0��wt��]6}�24�N�b�ժ�\��W�'���0�тLO���~�L�%�Vx�O�rLj���=���kה�<���k�y�U���tt6��5�/|���3a��dn��U�����+�d1��u�a������Kbcl��0�g��9ԉ �_�c�u[���%�t��aJ��@lY���ŝx�1Gb�k/I�+���5��2#�䩸cu��    �u
����S�k
�s�,�|���nI�1d�%����%��H �4{�J���$	q���!�m���c(5d�ZPϭS^˶L	�0H�g�cNg� ]�[�2�n� ygg}�}��M��|=�F�ǎj\��$�G�@
�Sj\܄/�����C{�]����}�3�I����c2��_��w\�+$l7�o�@|Ɛ�R$��ꚛ�Smd�C����"�%b�LJ���\,v�:����x�����$Q|�*o�O�ak��� �Nݛb���}�Qo� �%������>�pר�>�j�G �b�1��(^c��"����صLY�����>��g���Uj�mm�3(�v��C�u#�c�d4�L��B/�<Q|B�XwIB\9��?5����������*n��;�`�X	5ڇ&�X�A�Y�4`Eu�a��� n;�8\��&���!m�(�D�=@-ڬ��f��� �*{���#K_��9���M�B��`����v
��V[�1�\� �nb���/�?����^	�S��Q��睷�4�N!6����:;qF���u��W��nA���a��ڦܩ�0����.�A{����m���\�+�0V~���D����)az�� M��6�P7�����ж���[���fH���\��5f�"(�%p�f���z����W,Gv�o��#9x�wMY(3��4~���E��K�M�jY�$�}�F���c(�e�%	�m�/�=̖�3���i��¶������N���
s�e2��n=�{�^F�#�YH����}1�Y��%)m���d�.�?�,[-��>^�>!�,�zP?~u��s۔�=a�P�Kc	�ȸ���zH�V�ӑ\�,_�}���O�+Y�-� }�ks���C�]�'P-6C��YxmK\�[N{�:R�\ղG�ߣ�E�>B\ɦ���\�O�c���:6���{���bɳ����Hl��	T���~d#W�]��5%�� �X!�;����#{�,����_��>�:1��n�1�m�+� F<�1ߍ)��^�	`GL6�a�dǜn��p��x�GQ�KIF�*��D����8U�Re��9p���%�UC��Ͱ鏠V���&F\ߢ~k��a
m���H@v���8�x�i=���˪w[��G ��'�K+(믃��ܮ~!ƟZ�D��B�2�<�c�UH&!O�ޓ�j��T����h�8=4�T!C����0{�Ir�%E��E�k�UK��o�?L�}S�B�����0\�¤�J��K��l���fy��[��^����`�_]�ߡ��&�W�0[E����?�,b��K.��)I�\>!���1��`�Y'1vLq��ocq��P'����ߚ��5�!6�s��P(���K2��b�5���,Z��:݋��t,�M���4�y�p��O�0�_�wM�R��a����݌��\J��%�6}~�2 b���Kb۔��9��,O�(��>��������5e���eQ�X�y��YԈ"������P�����x�N�-��3�!'�X}���m�< ٘�0s�}	Q�*"�7H ��m�k�����?�M�D�b�%	qU��3�����E��P'v;F��� >q�E=C��#:�&�uΟ���(Eb��9p[>ڮ)�z}��\���d,6fL��8��0ըH��i�~��}$�ߐB�C웲u��e���0��1Eb�%	�1/�!O���9��9�a&�%��� ��uw�g���g�A��ibn��X��>+�� ����Q��nE�b���h^m<~�c�����x�������_��#w�Nה�I
�����Ht7�_r�mSދ�oƷ�Sj�.����!\��3�j��_rw[��3]�-�T�F I���Ļ+���Fa��y/r�J��Bl�2�4��,D�)#���=|-�:�X�0���5�k1�b�%������.�a����M���a3!���X��.���v��q������7���b���KI�d�e����2��"�F�ZSH�_5�:̷��~c��E��"ߠo���0��Y�A�GQ$6�J���Ζ:h���A�,|L����Hԇ��$!�L����{a-�WX[1)��_�%,�m��r���H�M!�z1攚��#P�������+�V�s�>��9���L} �K.��ު���� .����7��Nl���0A|b۔'��p�������$Ď)~p��=g�Nc�$Į)��q�u ��u
�҂����3����ͪ�c(���K2W�s���җ$C�5jJ�����=�T�-ߔ��>|��Oh+����A' ������yuIr�ys��P,6)2��fh=1�?5�ǲj۠�1�pLk/I�ms��W<��8n�$�Dی��$�Փ�y��f�f��b*R�/I�]S�[s��c�na�)d�:,mU wMy2A�[�W��aƣ���^���\4v,s\1E�G����IT�,���$�Uqk0F�����9�Vj�-��Ď)ی'�PS��P(��/I�ZI�%]�!V�-�Pc�$Ğ)���G�~O��(m�,jD�����c���n�I��U��ϢF�����7%�x1�t����Kb�2�:�7�%�!��k�Kb۔���q�h�T��_��������x�NO6|�7MD��N��>�?��b��?�h#1a�A���3��r�h�b��"�#q�qǜ{q��7��L�������$�%�/�9\��Ϙ+������k���1�ˌ�c:#�1Hb��<�?��,O� �_�W�L�M�_��t�"Z,��[�=6}%"���$�mS�=n��g��&F:A][$	qǔH<�˘���������$�]Sv�M�2M<��u�A��� nWw��q'��r��&o+���`[��ѮZ/{s�][A�q�g<�Z�f��9&���⪴5��5�Ԋ�`�7��/���0H�e��|��j��g�y2E��j��M��� j����2]q�u�3�ʄA'o���W샨�ٽ#/p�L�2}�	�LJ���d4vMq�
`���
��<9P믓��a�^�~˔2�n�e*���{�|���\8�-S����S��P(�}a-��� �MYY|7�&��c}/&�Hbߔ%�=���U��P(�X�A�m���3�i�-J�I������J�'跺�o�h��i�$!����/o`�W|��9ԉ�i�%	���D�%�pų��c(�a0��I�mշnu���`�ߋ��*�>;-c��z��2Js��{����`3�S ۶).��V<��>�:�)���H�OG�����?�� jU@|af��>Hbט��9\�����Ԥ�$!�L1��Ü��)b��/��H|�)M6�c���	��-�%	qהHӭ�SID 9�=˔έ�8^�3J�1Hbǔi� ��f�<�;��$�ӵ���c��Ll �4y�{'�H��$!n���tWa��})�����7f��W����4̈́A����_	1�,p{m��S:]�kJ:=�+��q�4�k���f��� �Y����|��-]<����(KW|��A������TPv[�)�3�-3����i��	T˴�|����e���%�x+]���N�k�"j"�U�S�]#�f��Џ����,Ƞ��(պ��I��sO��e׋@ٶLi���g��5u� ���qLo��4Z,s��T���{�]��gN[�}�<`ޞ��b��X,n���_@��I��IT��\�Kb�z7���.^D�8��
�py�����CW�7�����%���bʨH.{�)^�}�gi��5S0Ơ�:��#����L���:
��A�gc�%�w����/!7��cǯM�F�b�%qǘN� &|�&!J����C�A��8�_���e��&L*n!�$�����
���)����gM�D�(��_��\��
�� j%*�<����ymҸ
��!��7�5�t�����;Ï�v.��[�Nk�㰂�\�u����=�}Sz��0
_�.#�����b��e��٘&�{���	G��A��$�X{��'���K���x���h�@�wM��
�>MѾ4�Q��A�ڻH���8� �  ��s=.s�%�k�}�����a�@������D�ۤ�$!�^�����1�y�m��H�@r{�)�t ��!Z ^q���"q-��9O�4���#N�����>.t�~g� wL�����%B��D���K.��o]�]����i��t2�vq� ���5iu�di��A��@�_RѸm��*5�eMc��Y�x�y���� �_r�VC�/p`�W�O�{1�5i/9�w����/�0�Y%����"���ĝ�N|�C����/�<�߿7}U"���$������y�|/��|�����>�j���������� w]S��p��c(y`�/�h�5f���Žx���*|i�4*D�-�%q�S�����@/y��p��յJQ$�_R��c�}^ �e�E��[��)&�k �?�����+��      S   <  x��Os�8��ҧ�mw/[�����I���lͥ1��B�R�$C>�JJr�=G��ͻ��Rv�ܭ~-��X���s�Y�b4��VjP�Զ>Z�+��&��ͯ���M�+�֠�5hmtj?/����=��ܴ
t�
Ti49ظse�m��ELu 7K�13�J����0������T+cQ,�		�͍%���<n&������gɇ�W�=��ps��@1��^#��F@������FjVh�R|�<ϖ�=����&k�� ���ђCΥ�:��U�"
ɽ�A<��~T�{�M-K�\u�@5^h���f��m��ԑ�[���<���b�H]J����8��7�� n�7S�@)�pRƦ�I<��R{�+�g���'T��bh���������b���a/S��x��d��MJ�A��ycN�`Ӊ��4Sr�bV����nb�#��T�S��'���ѥ!��9?��MM-��R��y9ެS{�+���F�b*I��:�Nѯo
����*��L��aj��z!X|m���}>�=�Y��7g�����i������B����J]� Y�t {C��*p����w��f</R{�+����J��h���ƪ��</�9�U�xJ�5R<�������B�x⺨��OR)���2ޜ�Xa��X����4O��-�G�x�ŷ�B��pٞD^K�Ѣ�e>EA,�ۓX�ܦvK|�Q��������t�~)%��VԎ�/�9��lH/�{�P_���ϛ%4�X���ПO���? ɰ��yHm!�X?��L]3��x��-��Ft�7��L�FK#m���D������B?5��HQ�XK����3����>CZ"�����}���W�h�ӂx�{�+rȹ���_o�w?�ƽ�#�|N|9��&�3��Y�t��Zi�%p.����MК���ɤ�I|~��Bd�~��7wV�n�@jb��D��~}S����R��H��X�he�Kj[(>�v��C\����7ߌ݋k	�`#:Q����кO�(`c(6S"�f��C\�����f�i�	�t����Ľ�XY�4�����!_����-���T�.�� o��7sY��JZW�k���yތ���׉.d�6G[�~�N�S��0_�FI��S�7���� ��Wm�P��5<��Ft"�G��y��@�5�%*�"�Cw�7a�-�,�RJ#>�W�\xs�b�'�I�A���p��k����|j�#����ǲ�Ԁs������l�bh�ɝ.����ߗ>�5�|�]{,[���u�7��o���X���Dh8�k�J�!�� �k~�C-u��MӀ���y�O���}����� ��W���Av�     