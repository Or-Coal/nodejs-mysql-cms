/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : cms

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 05/05/2022 00:25:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123', '黄小米', '女', '15863008280', 'nn880328@126.com', 'http://localhost:3001/images/avatar/default.jpg');
INSERT INTO `admin` VALUES (2, 'moz', '123', '孙红雷', '男', '13475829262', 'nn880328@126.com', 'http://localhost:3001/images/avatar/default.jpg');
INSERT INTO `admin` VALUES (3, 'silky', '123', '鹿晗', '男', '15863008280', 'nn880328@126.com', 'http://localhost:3001/images/avatar/default.jpg');
INSERT INTO `admin` VALUES (4, 'orz', '123', '黄渤', '男', '13475829262', 'nn880328@126.com', 'http://localhost:3001/images/avatar/default.jpg');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NULL DEFAULT NULL COMMENT '用户id',
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, 1, 1);
INSERT INTO `admin_role` VALUES (2, 2, 2);
INSERT INTO `admin_role` VALUES (3, 3, 4);
INSERT INTO `admin_role` VALUES (4, 4, 3);

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cate_1st` int NOT NULL COMMENT '一级分类id',
  `cate_2nd` int NOT NULL COMMENT '二级分类id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `content` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正文',
  `create_date` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发表日期',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `main_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 2, 11, '俄罗斯总统发言人：俄军遭受了重大损失', '据英国天空新闻网报道，俄罗斯总统普京的发言人佩斯科夫周四在接受这家英国媒体的采访时表示，俄罗斯军队遭到了“重大损失”。在回答天空新闻网直播关于俄军损失了多少士兵的问题时，佩斯科夫用英文回答说：“我们在士兵方面遭受了重大损失，这对我们来说是一个巨大的悲剧”。（原话为：\"We have significant losses of troops. It\'s a huge tragedy for us.\"）', '<p>开篇我先<strong>吐槽</strong>一下微信开发者的文档，<strong>千年不更新</strong>。</p><p><em>写文时间：2020年3月14日</em>，先敲个时间，别那边偷偷改了有人吐槽我。</p><p>文档中写的<strong>拒绝</strong>和<strong>允许</strong>都会触发回调，然后我测试<strong>拒绝的时候就不会触发回调</strong>。</p><h2 id=\"item-1\">微信授权逻辑</h2><p><img referrerpolicy=\"no-referrer\" src=\"https://segmentfault.com/img/bVbExhl\" alt=\"image.png\" title=\"image.png\"/></p><ol><li>进入页面，获取授权状态，（getUserid）一般是看cookie里面有用户信息吗。</li><li>有用户信息，pass。</li><li><p>无用户信息。这里只是打个标记，并不在一进入页面就强制授权。而是在用户操作的时候提示用户授权，因为这样体验比较好。<br/>体验上是可以告诉用户你浏览我们是不需要你的信息的，而你在我们平台互动是需要注册登录的。</p><ol><li>用户拒绝授权，这里页面是无感知的，所以不做任何处理。但是页面可以知道用户是非首次互动，这时候可以先弹出一个框告知用户，用户需要允许授权。</li><li>用户允许授权，这个时候会触发刷新页面。这里建议页面给自己加个标记，就是用户触发授权的事件，刷新之后重新调用一下。</li></ol></li></ol><h3 id=\"item-1-1\">需求一:&nbsp;<strong>拒绝授权的时候弹窗</strong></h3><p><em>嘿嘿你猜我在做的是什么</em>。</p><p>我看之前代码是有拒绝回调逻辑的，而且我也在文档中确认过了。<br/>但是我在测试的时候发现，拒绝不会触发回调，成功的时候逻辑是对的。</p><p>那么在这个场景下，我们怎么显示呢？</p><ol><li>我们做一个小页面藏在授权弹框后面，因为拒绝的时候页面无变化，用户就可以看到后面的小页面。</li><li>基于方案1我们发现，网慢的情况下，同意授权的用户也会看到弹窗，这对于我们要求体验的前端er来说是不好的。我们这里可以尝试<strong>给一个稍微大一点的setTimeout显示小页面</strong>。</li><li>基于方案2，因为微信授权弹窗不会阻塞主进程，所以我们并不能稳定控制小页面的显示与隐藏。极端情况下用户的体验仍是不好的。那么我们应该怎么办呢？<strong>捶产品，砍需求</strong>，哈哈当然是不做这个弹框，把这部分的功能<strong>换另一种交互方式咯</strong>。</li></ol><h3 id=\"item-1-2\">需求二: 非微信绑定的域名做微信授权</h3><p>因为现在微信管得太严了，怕被微信拉黑，所以考虑使用其他域名做分享外链。</p><p>但是我们又希望可以<strong>在微信授权登录一下</strong>，这样这个需求就来了。</p><p>微信中绑定的安全域名和回调域名为&nbsp;<code>a.com</code>，<br/>我们分享到微信打开的域名为&nbsp;<code>b.com</code>。</p><h4>方案一：跨域方案</h4><p>首先我们要明确几个要点。</p><ol><li><strong>我方服务端判断登录是判断&nbsp;<code>cookie</code>&nbsp;</strong>。</li><li>对于前端来讲&nbsp;<code>a.com</code>&nbsp;和&nbsp;<code>b.com</code>&nbsp;是<strong>跨域</strong>的。</li><li><code>a.com</code>&nbsp;是无法把&nbsp;<code>cookie</code>&nbsp;写到&nbsp;<code>b.com</code>&nbsp;下的。</li><li>同样&nbsp;<code>b.com</code>&nbsp;也无法读取&nbsp;<code>a.com</code>&nbsp;的&nbsp;<code>cookie</code>。</li></ol><p>好了基于上面的要点。我们开始实现功能。</p><ol><li><code>a.com/wxauth</code>&nbsp;会触发微信授权，我们默认用户同意授权</li><li>微信会将页面重定向到 callback 页面。（这里是在公众号配置好的）</li><li>callback 页面写&nbsp;<code>cookie</code>。这个时候我们就能拿到用户登录信息。</li><li>但是基于上面我们跨域的cookie是无法共享的。那么我们可以开<code>CORS</code>来使用，<code>a.com</code>&nbsp;的接口允许&nbsp;<code>b.com</code>的页面发出请求。</li><li>但是跨域的情况下默认是不携带&nbsp;<code>cookie</code>&nbsp;的。这个时候我们可以配置&nbsp;<code>withCredentials</code>&nbsp;来达到携带cookie的目的。</li></ol><p>基于上面的跨域方案，我们&nbsp;<code>b.com</code>&nbsp;下面没有任何&nbsp;<code>cookie</code>，只有页面。<br/>我们所有的请求和&nbsp;<code>cookie</code>&nbsp;都放在&nbsp;<code>a.com</code>。</p><h4>方案二：共享，我觉得叫授权验证也可以</h4><p>上个方案是所有请求都走&nbsp;<code>a.com</code>。</p><p>这个方案是所有请求都走当前域名。我网上看了几个别人做好的，也都是这种方案。</p><p>这种方案其实可以把&nbsp;<code>a.com</code>&nbsp;理解成第三方平台。</p><p><img referrerpolicy=\"no-referrer\" src=\"https://segmentfault.com/img/bVbExwp\" alt=\"image.png\" title=\"image.png\"/></p>', '2022-04-09 00:39:00', '2022-04-09 00:39:00', 'http://localhost:3001/images/common/78adf990-6927-11ea-a704-ab781b5ae732.jpeg');
INSERT INTO `article` VALUES (2, 2, 11, '亚马逊2019第一季度财报：净利润同比增长118% AWS业务增速迅猛', '根据这份财报显示，亚马逊销售额增速不错。第一季度总净销售额为597亿美元，高于市场预期596.53亿美元，对比去年同期为510.42亿美元同比增长17%。', '<p>美股研究社最新消息 亚马逊在周四盘后发布2019财年第一季度的财报。</p><p>根据这份财报显示，亚马逊销售额增速不错。第一季度总净销售额为597亿美元，高于市场预期596.53亿美元，对比去年同期为510.42亿美元同比增长17%。</p><p>本季度亚马逊各条业务增长都不错，其中北美地区净销售额为358.12亿美元，去年同期为307.25亿美元；线上商店销售额为294.98亿美元，去年同期为269.39亿美元；国际净销售额为161.92亿美元，去年同期为148.75亿美元。</p><div><br></div><p>净利润方面，亚马逊第一季度净利润为35.61亿美元，高于市场预期23.81亿美元，达到去年同期16.29亿美元的2倍以上，同比增长118%。</p><p>其中，季度广告服务以及其他销售额为27.16亿美元，去年同期为20.31亿美元；季度AWS运营利润增速迅猛达到22.23亿美元，去年同期为14亿美元，同比增长近59%。</p><p>第一季度EPS 7.09美元，市场预期4.67美元。</p><p>目前，亚马逊预计第二季度总销售额为595-635亿美元，预计第二季度运营利润为26-36亿美元。受财报利好消息影响，目前亚马逊盘后涨幅已经超过1%.</p>', '2019-04-26 14:56:54', '2020-04-13 21:46:20', 'http://localhost:3001/images/common/6f70b4a0-67f0-11e9-b7fb-3d2cafb359a4.jpeg');
INSERT INTO `article` VALUES (3, 2, 11, '疫情以来，中关村创业大街吸引35家创业企业注册', '2月10日复工截至3月17日，中关村创业大街集群注册平台累计收到注册申请41家，有35个项目通过评审。相比去年月均18个项目通过评审，数量更多，而且，通过对项目内容、核心团队履历、所属行业分析，质量也高于以往。', '<p>2月10日复工截至3月17日，中关村创业大街集群注册平台累计收到注册申请41家，有35个项目通过评审。相比去年月均18个项目通过评审，数量更多，而且，通过对项目内容、核心团队履历、所属行业分析，质量也高于以往。</p><p style=\"text-align: center;\"><img src=\"https://inews.gtimg.com/newsapp_bt/0/11464404908/1000\" style=\"max-width:100%;\"><br></p><div></div><p>“我们通常通过三个维度来评价一个创业项目的质量：所属行业领域、创始团队履历、核心技术及商业模式。”3月17日上午，中关村创业大街总经理聂丽霞向记者介绍。</p><p>疫情以来，中关村创业大街集群注册平台有35个项目通过评审，有24个技术已经成熟，产品已经开发完成，有部分项目还开展了市场合作。其余9家产品或技术还在研发阶段。相比以往，技术或产品成熟的申请项目数量倍增。</p><p>从项目创始人履历来看，35个项目的主要创始人当中，有57.1%是硕士及以上学历，还有一位是博士后创业；有40%有百度、IBM、中海油、微软、华为等大企业工作经历。平均年龄37.4岁。</p><p>从创业项目所属行业来看，主要集中在大数据、工业互联网、区块链技术、人工智能、软件信息化服务、新能源等新兴科技领域。涉及传统行业的，大多也是把新技术应用在细分领域里深耕。比如，有一个创业项目专门是做企业微信应用升级和周边应用程序开发的，市场前景非常广阔。</p><p>据介绍，去年5月13日，中关村创业大街集群注册平台正式授牌，开始为创业者免费提供企业注册服务，只需要一个注册地址、不需要实际在此办公，集群注册政策非常适合初创企业。创业大街还为集群注册企业提供政策咨询、产业对接和投融资等加速服务，满足初创企业的发展需求。</p><p>2019年，平台累计接受申请270个，注册成功137个。平均月成功注册约18家。</p><p>新冠肺炎疫情期间，创业者的热情为什么没受影响，反倒格外高涨呢？</p><p>“疫情期间，宅在家里不能外出，让我们更能潜下心来了好好思考自己的创业项目，修炼内功。而且，这期间，政府的支持政策更多、更到位，对创业者来说，创业成本更低。”北京彩云长天科技有限公司创始人何杰说。</p><p>何杰2019年6月从原公司辞职，创业伙伴7月也离开了原公司，他们的项目专注于AI数据处理。2月15日前后，何杰在家登录中关村创业大街“创业会客厅”线上平台，按要求填写提交了相关材料，申请加入集群注册平台。3月6日，他们就拿到了营业执照，迈出了公司化运营的第一步。</p>', '2020-03-18 09:19:55', '2020-04-13 21:49:02', 'http://localhost:3001/images/common/6d6da420-68b6-11ea-94f5-2514290e3ea7.jpeg');
INSERT INTO `article` VALUES (4, 2, 4, '《寄生虫》背后的韩国寄生史', '看完《寄生虫》，和朋友们聊了聊，大家一致认同这部电影隐喻气息浓烈，达成共识后就丢下了它，没想到这几天翻了翻影评，发现很多人都认为这是在讲述阶级的隐喻，又和朋友们聊了聊，才发现我们一开始就有一点不同的看法。', '<p>开篇我先<strong>吐槽</strong>一下微信开发者的文档，<strong>千年不更新</strong>。</p><p><em>写文时间：2020年3月14日</em>，先敲个时间，别那边偷偷改了有人吐槽我。</p><p>文档中写的<strong>拒绝</strong>和<strong>允许</strong>都会触发回调，然后我测试<strong>拒绝的时候就不会触发回调</strong>。</p><h2 id=\"item-1\">微信授权逻辑</h2><p><img referrerpolicy=\"no-referrer\" src=\"https://segmentfault.com/img/bVbExhl\" alt=\"image.png\" title=\"image.png\"></p><ol><li>进入页面，获取授权状态，（getUserid）一般是看cookie里面有用户信息吗。</li><li>有用户信息，pass。</li><li><p>无用户信息。这里只是打个标记，并不在一进入页面就强制授权。而是在用户操作的时候提示用户授权，因为这样体验比较好。<br>体验上是可以告诉用户你浏览我们是不需要你的信息的，而你在我们平台互动是需要注册登录的。</p><ol><li>用户拒绝授权，这里页面是无感知的，所以不做任何处理。但是页面可以知道用户是非首次互动，这时候可以先弹出一个框告知用户，用户需要允许授权。</li><li>用户允许授权，这个时候会触发刷新页面。这里建议页面给自己加个标记，就是用户触发授权的事件，刷新之后重新调用一下。</li></ol></li></ol><h3 id=\"item-1-1\">需求一:&nbsp;<strong>拒绝授权的时候弹窗</strong></h3><p><em>嘿嘿你猜我在做的是什么</em>。</p><p>我看之前代码是有拒绝回调逻辑的，而且我也在文档中确认过了。<br>但是我在测试的时候发现，拒绝不会触发回调，成功的时候逻辑是对的。</p><p>那么在这个场景下，我们怎么显示呢？</p><ol><li>我们做一个小页面藏在授权弹框后面，因为拒绝的时候页面无变化，用户就可以看到后面的小页面。</li><li>基于方案1我们发现，网慢的情况下，同意授权的用户也会看到弹窗，这对于我们要求体验的前端er来说是不好的。我们这里可以尝试<strong>给一个稍微大一点的setTimeout显示小页面</strong>。</li><li>基于方案2，因为微信授权弹窗不会阻塞主进程，所以我们并不能稳定控制小页面的显示与隐藏。极端情况下用户的体验仍是不好的。那么我们应该怎么办呢？<strong>捶产品，砍需求</strong>，哈哈当然是不做这个弹框，把这部分的功能<strong>换另一种交互方式咯</strong>。</li></ol><h3 id=\"item-1-2\">需求二: 非微信绑定的域名做微信授权</h3><p>因为现在微信管得太严了，怕被微信拉黑，所以考虑使用其他域名做分享外链。</p><p>但是我们又希望可以<strong>在微信授权登录一下</strong>，这样这个需求就来了。</p><p>微信中绑定的安全域名和回调域名为&nbsp;<code>a.com</code>，<br>我们分享到微信打开的域名为&nbsp;<code>b.com</code>。</p><h4>方案一：跨域方案</h4><p>首先我们要明确几个要点。</p><ol><li><strong>我方服务端判断登录是判断&nbsp;<code>cookie</code>&nbsp;</strong>。</li><li>对于前端来讲&nbsp;<code>a.com</code>&nbsp;和&nbsp;<code>b.com</code>&nbsp;是<strong>跨域</strong>的。</li><li><code>a.com</code>&nbsp;是无法把&nbsp;<code>cookie</code>&nbsp;写到&nbsp;<code>b.com</code>&nbsp;下的。</li><li>同样&nbsp;<code>b.com</code>&nbsp;也无法读取&nbsp;<code>a.com</code>&nbsp;的&nbsp;<code>cookie</code>。</li></ol><p>好了基于上面的要点。我们开始实现功能。</p><ol><li><code>a.com/wxauth</code>&nbsp;会触发微信授权，我们默认用户同意授权</li><li>微信会将页面重定向到 callback 页面。（这里是在公众号配置好的）</li><li>callback 页面写&nbsp;<code>cookie</code>。这个时候我们就能拿到用户登录信息。</li><li>但是基于上面我们跨域的cookie是无法共享的。那么我们可以开<code>CORS</code>来使用，<code>a.com</code>&nbsp;的接口允许&nbsp;<code>b.com</code>的页面发出请求。</li><li>但是跨域的情况下默认是不携带&nbsp;<code>cookie</code>&nbsp;的。这个时候我们可以配置&nbsp;<code>withCredentials</code>&nbsp;来达到携带cookie的目的。</li></ol><p>基于上面的跨域方案，我们&nbsp;<code>b.com</code>&nbsp;下面没有任何&nbsp;<code>cookie</code>，只有页面。<br>我们所有的请求和&nbsp;<code>cookie</code>&nbsp;都放在&nbsp;<code>a.com</code>。</p><h4>方案二：共享，我觉得叫授权验证也可以</h4><p>上个方案是所有请求都走&nbsp;<code>a.com</code>。</p><p>这个方案是所有请求都走当前域名。我网上看了几个别人做好的，也都是这种方案。</p><p>这种方案其实可以把&nbsp;<code>a.com</code>&nbsp;理解成第三方平台。</p><p><img referrerpolicy=\"no-referrer\" src=\"https://segmentfault.com/img/bVbExwp\" alt=\"image.png\" title=\"image.png\"></p>', '2020-03-18 09:44:26', '2021-07-20 10:26:21', 'http://localhost:3001/images/common/9bde6050-6925-11ea-a704-ab781b5ae732.jpeg');
INSERT INTO `article` VALUES (5, 2, 4, '《只有芸知道》：哭湿纸巾的爱情 原来没那么简单', '新西兰Clyde小镇见证了隋东风和罗芸最重要的十五年。', '<p>开篇我先<strong>吐槽</strong>一下微信开发者的文档，<strong>千年不更新</strong>。</p><p><em>写文时间：2020年3月14日</em>，先敲个时间，别那边偷偷改了有人吐槽我。</p><p>文档中写的<strong>拒绝</strong>和<strong>允许</strong>都会触发回调，然后我测试<strong>拒绝的时候就不会触发回调</strong>。</p><h2 id=\"item-1\">微信授权逻辑</h2><p><img referrerpolicy=\"no-referrer\" src=\"https://segmentfault.com/img/bVbExhl\" alt=\"image.png\" title=\"image.png\"></p><ol><li>进入页面，获取授权状态，（getUserid）一般是看cookie里面有用户信息吗。</li><li>有用户信息，pass。</li><li><p>无用户信息。这里只是打个标记，并不在一进入页面就强制授权。而是在用户操作的时候提示用户授权，因为这样体验比较好。<br>体验上是可以告诉用户你浏览我们是不需要你的信息的，而你在我们平台互动是需要注册登录的。</p><ol><li>用户拒绝授权，这里页面是无感知的，所以不做任何处理。但是页面可以知道用户是非首次互动，这时候可以先弹出一个框告知用户，用户需要允许授权。</li><li>用户允许授权，这个时候会触发刷新页面。这里建议页面给自己加个标记，就是用户触发授权的事件，刷新之后重新调用一下。</li></ol></li></ol><h3 id=\"item-1-1\">需求一:&nbsp;<strong>拒绝授权的时候弹窗</strong></h3><p><em>嘿嘿你猜我在做的是什么</em>。</p><p>我看之前代码是有拒绝回调逻辑的，而且我也在文档中确认过了。<br>但是我在测试的时候发现，拒绝不会触发回调，成功的时候逻辑是对的。</p><p>那么在这个场景下，我们怎么显示呢？</p><ol><li>我们做一个小页面藏在授权弹框后面，因为拒绝的时候页面无变化，用户就可以看到后面的小页面。</li><li>基于方案1我们发现，网慢的情况下，同意授权的用户也会看到弹窗，这对于我们要求体验的前端er来说是不好的。我们这里可以尝试<strong>给一个稍微大一点的setTimeout显示小页面</strong>。</li><li>基于方案2，因为微信授权弹窗不会阻塞主进程，所以我们并不能稳定控制小页面的显示与隐藏。极端情况下用户的体验仍是不好的。那么我们应该怎么办呢？<strong>捶产品，砍需求</strong>，哈哈当然是不做这个弹框，把这部分的功能<strong>换另一种交互方式咯</strong>。</li></ol><h3 id=\"item-1-2\">需求二: 非微信绑定的域名做微信授权</h3><p>因为现在微信管得太严了，怕被微信拉黑，所以考虑使用其他域名做分享外链。</p><p>但是我们又希望可以<strong>在微信授权登录一下</strong>，这样这个需求就来了。</p><p>微信中绑定的安全域名和回调域名为&nbsp;<code>a.com</code>，<br>我们分享到微信打开的域名为&nbsp;<code>b.com</code>。</p><h4>方案一：跨域方案</h4><p>首先我们要明确几个要点。</p><ol><li><strong>我方服务端判断登录是判断&nbsp;<code>cookie</code>&nbsp;</strong>。</li><li>对于前端来讲&nbsp;<code>a.com</code>&nbsp;和&nbsp;<code>b.com</code>&nbsp;是<strong>跨域</strong>的。</li><li><code>a.com</code>&nbsp;是无法把&nbsp;<code>cookie</code>&nbsp;写到&nbsp;<code>b.com</code>&nbsp;下的。</li><li>同样&nbsp;<code>b.com</code>&nbsp;也无法读取&nbsp;<code>a.com</code>&nbsp;的&nbsp;<code>cookie</code>。</li></ol><p>好了基于上面的要点。我们开始实现功能。</p><ol><li><code>a.com/wxauth</code>&nbsp;会触发微信授权，我们默认用户同意授权</li><li>微信会将页面重定向到 callback 页面。（这里是在公众号配置好的）</li><li>callback 页面写&nbsp;<code>cookie</code>。这个时候我们就能拿到用户登录信息。</li><li>但是基于上面我们跨域的cookie是无法共享的。那么我们可以开<code>CORS</code>来使用，<code>a.com</code>&nbsp;的接口允许&nbsp;<code>b.com</code>的页面发出请求。</li><li>但是跨域的情况下默认是不携带&nbsp;<code>cookie</code>&nbsp;的。这个时候我们可以配置&nbsp;<code>withCredentials</code>&nbsp;来达到携带cookie的目的。</li></ol><p>基于上面的跨域方案，我们&nbsp;<code>b.com</code>&nbsp;下面没有任何&nbsp;<code>cookie</code>，只有页面。<br>我们所有的请求和&nbsp;<code>cookie</code>&nbsp;都放在&nbsp;<code>a.com</code>。</p><h4>方案二：共享，我觉得叫授权验证也可以</h4><p>上个方案是所有请求都走&nbsp;<code>a.com</code>。</p><p>这个方案是所有请求都走当前域名。我网上看了几个别人做好的，也都是这种方案。</p><p>这种方案其实可以把&nbsp;<code>a.com</code>&nbsp;理解成第三方平台。</p><p><img referrerpolicy=\"no-referrer\" src=\"https://segmentfault.com/img/bVbExwp\" alt=\"image.png\" title=\"image.png\"></p>', '2020-03-18 09:54:23', '2021-07-20 10:26:23', 'http://localhost:3001/images/common/c9273330-6924-11ea-a704-ab781b5ae732.jpeg');
INSERT INTO `article` VALUES (6, 1, 5, '超大的字号、艳俗的色彩，他的设计风格怎么这么秀', '头顶板寸，脑后长辫，他身着大开三扣的花衬衫，脖子上的刺青会随着走路的摆动而忽隐忽现，我不说他是设计师的话，大家肯定会误以为是那条道上混的兄弟。这位张扬又粗犷的男子以他独特的「台味美学」混迹设计圈，他就是廖小子（本名廖俊裕），下面我们就一起来认识认识这个，痞气十足的设计师吧。', '<p>	 	 	 	 	 	 	    	  	 	 	 <!--[if lte IE 9]>\n	\n	<![endif]-->	 <!--[if lt IE 9]>\n  \n    window.onload=function(){\n    location.href=\"https://www.uisdc.com/ie8/?re=https%3A%2F%2Fwww.uisdc.com%2Fliaojunyu\";\n    }\n  </script>\n	<![endif]-->			 \n\n\n<script>\n		var _hmt = _hmt || [];\n		(function() {\n			var hm = document.createElement(\"script\");\n			hm.src = \"//hm.baidu.com/hm.js?7aeefdb15fe9aede961eee611c7e48a5\";\n			var s = document.getElementsByTagName(\"script\")[0];\n			s.parentNode.insertBefore(hm, s);\n		})();\n	</script>\n	 \n<script>\n		window.ga_tid = \"UA-154264393-2\";\n		window.ga_api = \"https://uiiiuiiicom.disquscdn.workers.dev/\";\n	</script>\n	 \n\n	 </p><div><div><div><div><p>头顶板寸，脑后长辫，他身着大开三扣的花衬衫，脖子上的刺青会随着走路的摆动而忽隐忽现，我不说他是设计师的话，大家肯定会误以为是那条道上混的兄弟。这位张扬又粗犷的男子以他独特的「台味美学」混迹设计圈，他就是廖小子（本名廖俊裕），下面我们就一起来认识认识这个，痞气十足的设计师吧。</p><p><img width=\"400\" height=\"577\" alt=\"\" src=\"https://image.uisdc.com/wp-content/uploads/2020/03/uisdc-yx-20200316-47.jpeg\"/></p><h4><span id=\"menu_0\">设计师简介</span></h4><p>在台湾嘉义长大的廖俊裕，他的父亲是当地建筑工地的一个小型工程承包商，所以家中常有工人走动，那时廖俊裕的父亲对他说，要称这些人为「师傅」。打小起养成对手艺人的敬意，这让廖俊裕对劳动阶级多了一份深厚情感，这份难以割舍的感情，也成为他从台湾草根文化汲取创作养份的源头。</p><p><img width=\"600\" height=\"337\" alt=\"\" src=\"https://image.uisdc.com/wp-content/uploads/2020/03/uisdc-yx-20200316-2.jpeg\"/></p><p>廖俊裕深受父亲的影响。现在袒露胸膛只扣一半花衬衫的打扮，也是耳濡目染了父亲的习惯。</p><p><img width=\"246\" height=\"303\" alt=\"\" src=\"https://image.uisdc.com/wp-content/uploads/2020/03/uisdc-yx-20200316-1.jpeg\"/></p><p>从小他喜欢看功夫电影「好小子」，因此父亲开始叫他「小子」。就这样叫着叫着「廖俊裕」变成了「廖小子」。</p><p><img width=\"600\" height=\"242\" alt=\"\" src=\"https://image.uisdc.com/wp-content/uploads/2020/03/uisdc-yx-20200316-48.jpg\"/></p><p>高三时的一个领悟，使得廖小子背弃了父亲对他成为一名律师的期望。这可不得了，因为他们家族里有从事法律的亲戚，廖小子成绩也不错，做父亲的当然希望儿子能跟着去走法律的康庄大道。</p><p>然而廖小子执意要选美术系，因为这件事父子俩吵得非常凶，还在家里大打出手。两人拿着大型立式电扇互砸，最后「黑带三段」的儿子打赢了老子。无奈劝说没有，渐渐的廖小子的父亲就默许了这件事情。</p><p><img width=\"600\" height=\"450\" alt=\"\" src=\"https://image.uisdc.com/wp-content/uploads/2020/03/uisdc-yx-20200316-3.jpeg\"/></p><p>有一次，廖小子的父亲喝醉了说：自己曾经也热爱绘画，但是没能坚持自己的理想，被你的祖父给劝退了，如果你真要转念美术系的话就要学好，要有决心在这条路上闯出一片天，也圆父亲的一个梦。自此廖小子就开始了他的设计之路。</p><p><img width=\"700\" height=\"466\" alt=\"\" src=\"https://image.uisdc.com/wp-content/uploads/2020/03/uisdc-yx-20200316-4.jpeg\"/></p><p>高中毕业后，廖小子顺利的考上了高雄师范大学美术系，但因家庭条件不好，连买画材的钱都没有，为了自力更生廖小子大学时就开始接活。跟大部分新手设计师一样，一开始接的都是些街头小广告，DM 单之类的设计项目。那时的廖小子也喜欢日系、大气简单的设计，但是能发出这种委托的客户，想要什么东西大家心里都有数。</p><p>完成项目后，客户一直要求改稿，希望字可以再放得大一些、颜色要鲜艳的、图要修得很沙龙、再整个玫瑰顺带一个外框与阴影。</p></div></div></div></div>', '2022-03-27 00:06:04', '2022-03-27 00:06:04', 'http://localhost:3001/images/common/78adf990-6927-11ea-a704-ab781b5ae732.jpeg');

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `article_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '博客ID',
  `tag_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客to标签中间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_tag
-- ----------------------------
INSERT INTO `article_tag` VALUES (3, 1, 1);
INSERT INTO `article_tag` VALUES (6, 6, 4);
INSERT INTO `article_tag` VALUES (7, 6, 5);
INSERT INTO `article_tag` VALUES (8, 5, 6);
INSERT INTO `article_tag` VALUES (9, 5, 1);
INSERT INTO `article_tag` VALUES (10, 5, 2);
INSERT INTO `article_tag` VALUES (11, 4, 4);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `parent_id` int NOT NULL COMMENT '父级id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '科技', 0);
INSERT INTO `category` VALUES (2, '娱乐', 0);
INSERT INTO `category` VALUES (3, '摄影', 2);
INSERT INTO `category` VALUES (4, '电影', 2);
INSERT INTO `category` VALUES (5, '人工智能', 1);
INSERT INTO `category` VALUES (6, '黑客技术', 1);
INSERT INTO `category` VALUES (7, '编程', 0);
INSERT INTO `category` VALUES (8, '前端', 7);
INSERT INTO `category` VALUES (9, 'JAVA', 7);
INSERT INTO `category` VALUES (10, 'PHP', 7);
INSERT INTO `category` VALUES (11, 'IT新闻', 2);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户id',
  `article_id` int NOT NULL COMMENT '文章id',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `reply` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回复内容',
  `is_show` tinyint NOT NULL DEFAULT 1 COMMENT '是否显示，（0否, 1是）',
  `is_reply` tinyint NOT NULL DEFAULT 0 COMMENT '是否回复，（0否, 1是）',
  `is_read` tinyint NOT NULL DEFAULT 0 COMMENT '是否已读，（0否, 1是）',
  `reply_date` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_date` timestamp NOT NULL COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, 1, '宝贝宝贝', '和合格后付', 1, 1, 0, '2022-04-09 00:37:27', '2022-03-09 00:07:22', '2022-04-09 00:37:27');
INSERT INTO `comment` VALUES (2, 1, 1, '呜呜呜呜', '飞得高', 1, 1, 0, '2022-04-09 00:37:20', '2022-03-17 23:38:41', '2022-04-09 00:37:20');
INSERT INTO `comment` VALUES (3, 1, 2, '破哦哦哦哦哦哦哦哦哦', NULL, 1, 0, 0, NULL, '2022-03-17 23:40:14', NULL);

-- ----------------------------
-- Table structure for icon
-- ----------------------------
DROP TABLE IF EXISTS `icon`;
CREATE TABLE `icon`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 281 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of icon
-- ----------------------------
INSERT INTO `icon` VALUES (1, 'platform-eleme');
INSERT INTO `icon` VALUES (2, 'eleme');
INSERT INTO `icon` VALUES (3, 'delete-solid');
INSERT INTO `icon` VALUES (4, 'delete');
INSERT INTO `icon` VALUES (5, 's-tools');
INSERT INTO `icon` VALUES (6, 'setting');
INSERT INTO `icon` VALUES (7, 'user-solid');
INSERT INTO `icon` VALUES (8, 'user');
INSERT INTO `icon` VALUES (9, 'phone');
INSERT INTO `icon` VALUES (10, 'phone-outline');
INSERT INTO `icon` VALUES (11, 'more');
INSERT INTO `icon` VALUES (12, 'more-outline');
INSERT INTO `icon` VALUES (13, 'star-on');
INSERT INTO `icon` VALUES (14, 'star-off');
INSERT INTO `icon` VALUES (15, 's-goods');
INSERT INTO `icon` VALUES (16, 'goods');
INSERT INTO `icon` VALUES (17, 'warning');
INSERT INTO `icon` VALUES (18, 'warning-outline');
INSERT INTO `icon` VALUES (19, 'question');
INSERT INTO `icon` VALUES (20, 'info');
INSERT INTO `icon` VALUES (21, 'remove');
INSERT INTO `icon` VALUES (22, 'circle-plus');
INSERT INTO `icon` VALUES (23, 'success');
INSERT INTO `icon` VALUES (24, 'error');
INSERT INTO `icon` VALUES (25, 'zoom-in');
INSERT INTO `icon` VALUES (26, 'zoom-out');
INSERT INTO `icon` VALUES (27, 'remove-outline');
INSERT INTO `icon` VALUES (28, 'circle-plus-outline');
INSERT INTO `icon` VALUES (29, 'circle-check');
INSERT INTO `icon` VALUES (30, 'circle-close');
INSERT INTO `icon` VALUES (31, 's-help');
INSERT INTO `icon` VALUES (32, 'help');
INSERT INTO `icon` VALUES (33, 'minus');
INSERT INTO `icon` VALUES (34, 'plus');
INSERT INTO `icon` VALUES (35, 'check');
INSERT INTO `icon` VALUES (36, 'close');
INSERT INTO `icon` VALUES (37, 'picture');
INSERT INTO `icon` VALUES (38, 'picture-outline');
INSERT INTO `icon` VALUES (39, 'picture-outline-round');
INSERT INTO `icon` VALUES (40, 'upload');
INSERT INTO `icon` VALUES (41, 'upload2');
INSERT INTO `icon` VALUES (42, 'download');
INSERT INTO `icon` VALUES (43, 'camera-solid');
INSERT INTO `icon` VALUES (44, 'camera');
INSERT INTO `icon` VALUES (45, 'video-camera-solid');
INSERT INTO `icon` VALUES (46, 'video-camera');
INSERT INTO `icon` VALUES (47, 'message-solid');
INSERT INTO `icon` VALUES (48, 'bell');
INSERT INTO `icon` VALUES (49, 's-cooperation');
INSERT INTO `icon` VALUES (50, 's-order');
INSERT INTO `icon` VALUES (51, 's-platform');
INSERT INTO `icon` VALUES (52, 's-fold');
INSERT INTO `icon` VALUES (53, 's-unfold');
INSERT INTO `icon` VALUES (54, 's-operation');
INSERT INTO `icon` VALUES (55, 's-promotion');
INSERT INTO `icon` VALUES (56, 's-home');
INSERT INTO `icon` VALUES (57, 's-release');
INSERT INTO `icon` VALUES (58, 's-ticket');
INSERT INTO `icon` VALUES (59, 's-management');
INSERT INTO `icon` VALUES (60, 's-open');
INSERT INTO `icon` VALUES (61, 's-shop');
INSERT INTO `icon` VALUES (62, 's-marketing');
INSERT INTO `icon` VALUES (63, 's-flag');
INSERT INTO `icon` VALUES (64, 's-comment');
INSERT INTO `icon` VALUES (65, 's-finance');
INSERT INTO `icon` VALUES (66, 's-claim');
INSERT INTO `icon` VALUES (67, 's-custom');
INSERT INTO `icon` VALUES (68, 's-opportunity');
INSERT INTO `icon` VALUES (69, 's-data');
INSERT INTO `icon` VALUES (70, 's-check');
INSERT INTO `icon` VALUES (71, 's-grid');
INSERT INTO `icon` VALUES (72, 'menu');
INSERT INTO `icon` VALUES (73, 'share');
INSERT INTO `icon` VALUES (74, 'd-caret');
INSERT INTO `icon` VALUES (75, 'caret-left');
INSERT INTO `icon` VALUES (76, 'caret-right');
INSERT INTO `icon` VALUES (77, 'caret-bottom');
INSERT INTO `icon` VALUES (78, 'caret-top');
INSERT INTO `icon` VALUES (79, 'bottom-left');
INSERT INTO `icon` VALUES (80, 'bottom-right');
INSERT INTO `icon` VALUES (81, 'back');
INSERT INTO `icon` VALUES (82, 'right');
INSERT INTO `icon` VALUES (83, 'bottom');
INSERT INTO `icon` VALUES (84, 'top');
INSERT INTO `icon` VALUES (85, 'top-left');
INSERT INTO `icon` VALUES (86, 'top-right');
INSERT INTO `icon` VALUES (87, 'arrow-left');
INSERT INTO `icon` VALUES (88, 'arrow-right');
INSERT INTO `icon` VALUES (89, 'arrow-down');
INSERT INTO `icon` VALUES (90, 'arrow-up');
INSERT INTO `icon` VALUES (91, 'd-arrow-left');
INSERT INTO `icon` VALUES (92, 'd-arrow-right');
INSERT INTO `icon` VALUES (93, 'video-pause');
INSERT INTO `icon` VALUES (94, 'video-play');
INSERT INTO `icon` VALUES (95, 'refresh');
INSERT INTO `icon` VALUES (96, 'refresh-right');
INSERT INTO `icon` VALUES (97, 'refresh-left');
INSERT INTO `icon` VALUES (98, 'finished');
INSERT INTO `icon` VALUES (99, 'sort');
INSERT INTO `icon` VALUES (100, 'sort-up');
INSERT INTO `icon` VALUES (101, 'sort-down');
INSERT INTO `icon` VALUES (102, 'rank');
INSERT INTO `icon` VALUES (103, 'loading');
INSERT INTO `icon` VALUES (104, 'view');
INSERT INTO `icon` VALUES (105, 'c-scale-to-original');
INSERT INTO `icon` VALUES (106, 'date');
INSERT INTO `icon` VALUES (107, 'edit');
INSERT INTO `icon` VALUES (108, 'edit-outline');
INSERT INTO `icon` VALUES (109, 'folder');
INSERT INTO `icon` VALUES (110, 'folder-opened');
INSERT INTO `icon` VALUES (111, 'folder-add');
INSERT INTO `icon` VALUES (112, 'folder-remove');
INSERT INTO `icon` VALUES (113, 'folder-delete');
INSERT INTO `icon` VALUES (114, 'folder-checked');
INSERT INTO `icon` VALUES (115, 'tickets');
INSERT INTO `icon` VALUES (116, 'document-remove');
INSERT INTO `icon` VALUES (117, 'document-delete');
INSERT INTO `icon` VALUES (118, 'document-copy');
INSERT INTO `icon` VALUES (119, 'document-checked');
INSERT INTO `icon` VALUES (120, 'document');
INSERT INTO `icon` VALUES (121, 'document-add');
INSERT INTO `icon` VALUES (122, 'printer');
INSERT INTO `icon` VALUES (123, 'paperclip');
INSERT INTO `icon` VALUES (124, 'takeaway-box');
INSERT INTO `icon` VALUES (125, 'search');
INSERT INTO `icon` VALUES (126, 'monitor');
INSERT INTO `icon` VALUES (127, 'attract');
INSERT INTO `icon` VALUES (128, 'mobile');
INSERT INTO `icon` VALUES (129, 'scissors');
INSERT INTO `icon` VALUES (130, 'umbrella');
INSERT INTO `icon` VALUES (131, 'headset');
INSERT INTO `icon` VALUES (132, 'brush');
INSERT INTO `icon` VALUES (133, 'mouse');
INSERT INTO `icon` VALUES (134, 'coordinate');
INSERT INTO `icon` VALUES (135, 'magic-stick');
INSERT INTO `icon` VALUES (136, 'reading');
INSERT INTO `icon` VALUES (137, 'data-line');
INSERT INTO `icon` VALUES (138, 'data-board');
INSERT INTO `icon` VALUES (139, 'pie-chart');
INSERT INTO `icon` VALUES (140, 'data-analysis');
INSERT INTO `icon` VALUES (141, 'collection-tag');
INSERT INTO `icon` VALUES (142, 'film');
INSERT INTO `icon` VALUES (143, 'suitcase');
INSERT INTO `icon` VALUES (144, 'suitcase-1');
INSERT INTO `icon` VALUES (145, 'receiving');
INSERT INTO `icon` VALUES (146, 'collection');
INSERT INTO `icon` VALUES (147, 'files');
INSERT INTO `icon` VALUES (148, 'notebook-1');
INSERT INTO `icon` VALUES (149, 'notebook-2');
INSERT INTO `icon` VALUES (150, 'toilet-paper');
INSERT INTO `icon` VALUES (151, 'office-building');
INSERT INTO `icon` VALUES (152, 'school');
INSERT INTO `icon` VALUES (153, 'table-lamp');
INSERT INTO `icon` VALUES (154, 'house');
INSERT INTO `icon` VALUES (155, 'no-smoking');
INSERT INTO `icon` VALUES (156, 'smoking');
INSERT INTO `icon` VALUES (157, 'shopping-cart-full');
INSERT INTO `icon` VALUES (158, 'shopping-cart-1');
INSERT INTO `icon` VALUES (159, 'shopping-cart-2');
INSERT INTO `icon` VALUES (160, 'shopping-bag-1');
INSERT INTO `icon` VALUES (161, 'shopping-bag-2');
INSERT INTO `icon` VALUES (162, 'sold-out');
INSERT INTO `icon` VALUES (163, 'sell');
INSERT INTO `icon` VALUES (164, 'present');
INSERT INTO `icon` VALUES (165, 'box');
INSERT INTO `icon` VALUES (166, 'bank-card');
INSERT INTO `icon` VALUES (167, 'money');
INSERT INTO `icon` VALUES (168, 'coin');
INSERT INTO `icon` VALUES (169, 'wallet');
INSERT INTO `icon` VALUES (170, 'discount');
INSERT INTO `icon` VALUES (171, 'price-tag');
INSERT INTO `icon` VALUES (172, 'news');
INSERT INTO `icon` VALUES (173, 'guide');
INSERT INTO `icon` VALUES (174, 'male');
INSERT INTO `icon` VALUES (175, 'female');
INSERT INTO `icon` VALUES (176, 'thumb');
INSERT INTO `icon` VALUES (177, 'cpu');
INSERT INTO `icon` VALUES (178, 'link');
INSERT INTO `icon` VALUES (179, 'connection');
INSERT INTO `icon` VALUES (180, 'open');
INSERT INTO `icon` VALUES (181, 'turn-off');
INSERT INTO `icon` VALUES (182, 'set-up');
INSERT INTO `icon` VALUES (183, 'chat-round');
INSERT INTO `icon` VALUES (184, 'chat-line-round');
INSERT INTO `icon` VALUES (185, 'chat-square');
INSERT INTO `icon` VALUES (186, 'chat-dot-round');
INSERT INTO `icon` VALUES (187, 'chat-dot-square');
INSERT INTO `icon` VALUES (188, 'chat-line-square');
INSERT INTO `icon` VALUES (189, 'message');
INSERT INTO `icon` VALUES (190, 'postcard');
INSERT INTO `icon` VALUES (191, 'position');
INSERT INTO `icon` VALUES (192, 'turn-off-microphone');
INSERT INTO `icon` VALUES (193, 'microphone');
INSERT INTO `icon` VALUES (194, 'close-notification');
INSERT INTO `icon` VALUES (195, 'bangzhu');
INSERT INTO `icon` VALUES (196, 'time');
INSERT INTO `icon` VALUES (197, 'odometer');
INSERT INTO `icon` VALUES (198, 'crop');
INSERT INTO `icon` VALUES (199, 'aim');
INSERT INTO `icon` VALUES (200, 'switch-button');
INSERT INTO `icon` VALUES (201, 'full-screen');
INSERT INTO `icon` VALUES (202, 'copy-document');
INSERT INTO `icon` VALUES (203, 'mic');
INSERT INTO `icon` VALUES (204, 'stopwatch');
INSERT INTO `icon` VALUES (205, 'medal-1');
INSERT INTO `icon` VALUES (206, 'medal');
INSERT INTO `icon` VALUES (207, 'trophy');
INSERT INTO `icon` VALUES (208, 'trophy-1');
INSERT INTO `icon` VALUES (209, 'first-aid-kit');
INSERT INTO `icon` VALUES (210, 'discover');
INSERT INTO `icon` VALUES (211, 'place');
INSERT INTO `icon` VALUES (212, 'location');
INSERT INTO `icon` VALUES (213, 'location-outline');
INSERT INTO `icon` VALUES (214, 'location-information');
INSERT INTO `icon` VALUES (215, 'add-location');
INSERT INTO `icon` VALUES (216, 'delete-location');
INSERT INTO `icon` VALUES (217, 'map-location');
INSERT INTO `icon` VALUES (218, 'alarm-clock');
INSERT INTO `icon` VALUES (219, 'timer');
INSERT INTO `icon` VALUES (220, 'watch-1');
INSERT INTO `icon` VALUES (221, 'watch');
INSERT INTO `icon` VALUES (222, 'lock');
INSERT INTO `icon` VALUES (223, 'unlock');
INSERT INTO `icon` VALUES (224, 'key');
INSERT INTO `icon` VALUES (225, 'service');
INSERT INTO `icon` VALUES (226, 'mobile-phone');
INSERT INTO `icon` VALUES (227, 'bicycle');
INSERT INTO `icon` VALUES (228, 'truck');
INSERT INTO `icon` VALUES (229, 'ship');
INSERT INTO `icon` VALUES (230, 'basketball');
INSERT INTO `icon` VALUES (231, 'football');
INSERT INTO `icon` VALUES (232, 'soccer');
INSERT INTO `icon` VALUES (233, 'baseball');
INSERT INTO `icon` VALUES (234, 'wind-power');
INSERT INTO `icon` VALUES (235, 'light-rain');
INSERT INTO `icon` VALUES (236, 'lightning');
INSERT INTO `icon` VALUES (237, 'heavy-rain');
INSERT INTO `icon` VALUES (238, 'sunrise');
INSERT INTO `icon` VALUES (239, 'sunrise-1');
INSERT INTO `icon` VALUES (240, 'sunset');
INSERT INTO `icon` VALUES (241, 'sunny');
INSERT INTO `icon` VALUES (242, 'cloudy');
INSERT INTO `icon` VALUES (243, 'partly-cloudy');
INSERT INTO `icon` VALUES (244, 'cloudy-and-sunny');
INSERT INTO `icon` VALUES (245, 'moon');
INSERT INTO `icon` VALUES (246, 'moon-night');
INSERT INTO `icon` VALUES (247, 'dish');
INSERT INTO `icon` VALUES (248, 'dish-1');
INSERT INTO `icon` VALUES (249, 'food');
INSERT INTO `icon` VALUES (250, 'chicken');
INSERT INTO `icon` VALUES (251, 'fork-spoon');
INSERT INTO `icon` VALUES (252, 'knife-fork');
INSERT INTO `icon` VALUES (253, 'burger');
INSERT INTO `icon` VALUES (254, 'tableware');
INSERT INTO `icon` VALUES (255, 'sugar');
INSERT INTO `icon` VALUES (256, 'dessert');
INSERT INTO `icon` VALUES (257, 'ice-cream');
INSERT INTO `icon` VALUES (258, 'hot-water');
INSERT INTO `icon` VALUES (259, 'water-cup');
INSERT INTO `icon` VALUES (260, 'coffee-cup');
INSERT INTO `icon` VALUES (261, 'cold-drink');
INSERT INTO `icon` VALUES (262, 'goblet');
INSERT INTO `icon` VALUES (263, 'goblet-full');
INSERT INTO `icon` VALUES (264, 'goblet-square');
INSERT INTO `icon` VALUES (265, 'goblet-square-full');
INSERT INTO `icon` VALUES (266, 'refrigerator');
INSERT INTO `icon` VALUES (267, 'grape');
INSERT INTO `icon` VALUES (268, 'watermelon');
INSERT INTO `icon` VALUES (269, 'cherry');
INSERT INTO `icon` VALUES (270, 'apple');
INSERT INTO `icon` VALUES (271, 'pear');
INSERT INTO `icon` VALUES (272, 'orange');
INSERT INTO `icon` VALUES (273, 'coffee');
INSERT INTO `icon` VALUES (274, 'ice-tea');
INSERT INTO `icon` VALUES (275, 'ice-drink');
INSERT INTO `icon` VALUES (276, 'milk-tea');
INSERT INTO `icon` VALUES (277, 'potato-strips');
INSERT INTO `icon` VALUES (278, 'lollipop');
INSERT INTO `icon` VALUES (279, 'ice-cream-square');
INSERT INTO `icon` VALUES (280, 'ice-cream-round');

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跳转的url',
  `link_order` int NULL DEFAULT NULL COMMENT '排序',
  `usable` tinyint NULL DEFAULT 1 COMMENT '状态,1-正常，-1-禁用',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES (1, '苦瓜甘甜', 'https://www.kuguagantian.com/', 1, 1, '2022-05-04 23:26:02', '2022-05-04 23:30:51');
INSERT INTO `link` VALUES (2, '优设网', 'https://www.uisdc.com/', 2, 1, '2022-05-04 23:31:34', '2022-05-04 23:32:13');
INSERT INTO `link` VALUES (3, '站酷', 'https://www.zcool.com.cn/', 3, 1, '2022-05-04 23:32:58', NULL);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `pId` int NULL DEFAULT NULL COMMENT '父级id',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接url',
  `menu_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示顺序',
  `icon_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标id',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '全部菜单', 0, '', '0', NULL, NULL);
INSERT INTO `menu` VALUES (2, '信息面板', 1, '', '2000', '139', NULL);
INSERT INTO `menu` VALUES (3, '文章管理', 1, '', '3000', '172', NULL);
INSERT INTO `menu` VALUES (4, '分类管理', 1, '/category/list', '4000', '140', NULL);
INSERT INTO `menu` VALUES (5, '公告管理', 1, '', '5000', '138', NULL);
INSERT INTO `menu` VALUES (6, '用户管理', 1, '', '6000', '151', NULL);
INSERT INTO `menu` VALUES (7, '推广管理', 1, '', '7000', '182', NULL);
INSERT INTO `menu` VALUES (8, '系统管理', 1, '', '8000', '6', NULL);
INSERT INTO `menu` VALUES (9, '账户设置', 1, '/admin/info', '9000', '190', NULL);
INSERT INTO `menu` VALUES (10, '发布文章', 3, '/article/release', '3001', '121', NULL);
INSERT INTO `menu` VALUES (11, '文章列表', 3, '/article/list', '3002', '149', NULL);
INSERT INTO `menu` VALUES (13, '用户列表', 6, '/user/list', '6001', '8', NULL);
INSERT INTO `menu` VALUES (14, '轮播图管理', 7, '/slide/list', '7001', '38', NULL);
INSERT INTO `menu` VALUES (15, '权限角色', 8, '/auth/role', '8002', '180', NULL);
INSERT INTO `menu` VALUES (16, '友情链接', 7, '/link/list', '7002', '178', '');
INSERT INTO `menu` VALUES (17, '管理员管理', 8, '/admin/list', '8001', '206', '');
INSERT INTO `menu` VALUES (18, '菜单管理', 8, '/auth/menu', '8003', '182', '');
INSERT INTO `menu` VALUES (19, '发布公告', 5, '/notice/release/', '5001', '106', '');
INSERT INTO `menu` VALUES (20, '公告列表', 5, '/notice/list', '5002', '140', '');
INSERT INTO `menu` VALUES (21, '标签管理', 3, '/tag/list', '3003', '171', '');
INSERT INTO `menu` VALUES (22, '评论管理', 3, '/comment/list', '3004', '188', '');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告内容',
  `create_date` timestamp NOT NULL COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '编辑时间',
  `is_sticky` tinyint NOT NULL DEFAULT 0 COMMENT '是否置顶，1-置顶，0-正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '桃花诗', '<p style=\"text-align:center;\">《桃花诗》</p><p style=\"text-align:center;\">&nbsp;明.唐寅</p><p style=\"text-align:center;\">桃花坞里桃花庵，桃花庵下桃花仙。</p><p style=\"text-align:center;\">桃花仙人种桃树，又折花枝当酒钱。</p><p style=\"text-align:center;\">酒醒只在花前坐，酒醉还须花下眠。</p><p style=\"text-align:center;\">花前花后日复日，酒醉酒醒年复年。</p><p style=\"text-align:center;\">不愿鞠躬车马前，但愿老死花酒间。</p><p style=\"text-align:center;\">&nbsp;车尘马足贵者趣，酒盏花枝贫者缘。</p><p style=\"text-align:center;\">若将富贵比贫贱，一在平地一在天。</p><p style=\"text-align:center;\">若将贫贱比车马，他得驱驰我得闲。</p><p style=\"text-align:center;\">世人笑我忒疯癫，我笑世人看不穿。</p><p style=\"text-align:center;\">记得五陵豪杰墓，无酒无花锄作田。</p>', '2022-03-06 16:37:01', '2022-04-08 01:08:16', 1);
INSERT INTO `notice` VALUES (2, '登鹳雀楼', '<p>白日依山尽，黄河入海流。\n欲穷千里目，更上一层楼。</p>', '2022-03-06 16:38:59', '2022-04-08 01:07:41', 1);
INSERT INTO `notice` VALUES (3, '江雪', '千山鸟飞绝，万径人踪灭。\r\n孤舟蓑笠翁，独钓寒江雪。', '2022-03-06 16:39:48', '2022-04-08 01:09:45', 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员');
INSERT INTO `role` VALUES (2, '管理员');
INSERT INTO `role` VALUES (3, '编辑');
INSERT INTO `role` VALUES (4, '设计');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` int NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1, 1, 2);
INSERT INTO `role_menu` VALUES (2, 1, 3);
INSERT INTO `role_menu` VALUES (3, 1, 4);
INSERT INTO `role_menu` VALUES (4, 1, 5);
INSERT INTO `role_menu` VALUES (5, 1, 6);
INSERT INTO `role_menu` VALUES (6, 1, 7);
INSERT INTO `role_menu` VALUES (7, 1, 8);
INSERT INTO `role_menu` VALUES (8, 1, 9);
INSERT INTO `role_menu` VALUES (9, 1, 10);
INSERT INTO `role_menu` VALUES (10, 1, 11);
INSERT INTO `role_menu` VALUES (12, 1, 13);
INSERT INTO `role_menu` VALUES (13, 1, 14);
INSERT INTO `role_menu` VALUES (14, 1, 15);
INSERT INTO `role_menu` VALUES (15, 2, 2);
INSERT INTO `role_menu` VALUES (16, 2, 3);
INSERT INTO `role_menu` VALUES (17, 2, 4);
INSERT INTO `role_menu` VALUES (18, 2, 5);
INSERT INTO `role_menu` VALUES (19, 2, 6);
INSERT INTO `role_menu` VALUES (20, 2, 9);
INSERT INTO `role_menu` VALUES (21, 2, 10);
INSERT INTO `role_menu` VALUES (22, 2, 11);
INSERT INTO `role_menu` VALUES (24, 2, 13);
INSERT INTO `role_menu` VALUES (25, 3, 2);
INSERT INTO `role_menu` VALUES (26, 3, 3);
INSERT INTO `role_menu` VALUES (27, 3, 4);
INSERT INTO `role_menu` VALUES (28, 3, 5);
INSERT INTO `role_menu` VALUES (29, 3, 9);
INSERT INTO `role_menu` VALUES (30, 3, 10);
INSERT INTO `role_menu` VALUES (31, 3, 11);
INSERT INTO `role_menu` VALUES (33, 1, 16);
INSERT INTO `role_menu` VALUES (34, 1, 17);
INSERT INTO `role_menu` VALUES (35, 1, 18);
INSERT INTO `role_menu` VALUES (36, 1, 19);
INSERT INTO `role_menu` VALUES (37, 1, 20);
INSERT INTO `role_menu` VALUES (38, 1, 21);
INSERT INTO `role_menu` VALUES (39, 1, 22);
INSERT INTO `role_menu` VALUES (40, 1, 1);
INSERT INTO `role_menu` VALUES (41, 2, 1);
INSERT INTO `role_menu` VALUES (42, 2, 21);
INSERT INTO `role_menu` VALUES (43, 2, 22);
INSERT INTO `role_menu` VALUES (44, 2, 19);
INSERT INTO `role_menu` VALUES (45, 2, 20);
INSERT INTO `role_menu` VALUES (46, 2, 7);
INSERT INTO `role_menu` VALUES (47, 2, 14);
INSERT INTO `role_menu` VALUES (48, 2, 16);
INSERT INTO `role_menu` VALUES (49, 3, 1);
INSERT INTO `role_menu` VALUES (50, 3, 21);
INSERT INTO `role_menu` VALUES (51, 3, 22);
INSERT INTO `role_menu` VALUES (52, 3, 19);
INSERT INTO `role_menu` VALUES (53, 3, 20);
INSERT INTO `role_menu` VALUES (54, 3, 7);
INSERT INTO `role_menu` VALUES (55, 3, 14);
INSERT INTO `role_menu` VALUES (56, 4, 1);
INSERT INTO `role_menu` VALUES (57, 4, 3);
INSERT INTO `role_menu` VALUES (58, 4, 10);
INSERT INTO `role_menu` VALUES (59, 4, 11);
INSERT INTO `role_menu` VALUES (60, 4, 5);
INSERT INTO `role_menu` VALUES (61, 4, 19);
INSERT INTO `role_menu` VALUES (62, 4, 20);
INSERT INTO `role_menu` VALUES (63, 4, 7);
INSERT INTO `role_menu` VALUES (64, 4, 14);

-- ----------------------------
-- Table structure for slide
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片地址',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跳转的url',
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '_blank' COMMENT '跳转方式，_blank，_self',
  `slide_order` int NULL DEFAULT NULL COMMENT '排序',
  `usable` tinyint NULL DEFAULT 1 COMMENT '状态,1-正常，-1-禁用',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES (1, '1', 'http://localhost:3001/images/common/4cb37c20-b42a-11ec-9686-9534ec65c3ac.jpeg', 'http://www.test.com/', '_blank', 1, 1, '2022-04-04 23:36:36', '2022-04-07 01:59:22');
INSERT INTO `slide` VALUES (2, '测试标题', 'http://localhost:3001/images/common/2647d170-b435-11ec-a1e0-9ff51000691e.jpeg', 'http://www.123.com', '_blank', 2, 1, '2022-04-05 00:35:14', '2022-05-04 13:02:09');
INSERT INTO `slide` VALUES (3, 'test', 'http://localhost:3001/images/common/14858e90-b43b-11ec-8b84-0b17af77884d.jpeg', 'http://www.vote.com', '_self', 3, -1, '2022-04-05 01:18:03', '2022-04-07 17:02:52');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 'Web前端');
INSERT INTO `tag` VALUES (2, '后台编程');
INSERT INTO `tag` VALUES (3, '数据库');
INSERT INTO `tag` VALUES (4, 'Javascript');
INSERT INTO `tag` VALUES (5, 'CSS3');
INSERT INTO `tag` VALUES (6, 'UI设计');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `usable` tinyint NOT NULL DEFAULT 1 COMMENT '状态，1-正常，0-禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user1', '123', 'papi酱', '女', '15863008280', 1);
INSERT INTO `user` VALUES (2, 'user2', '123', '夏目友人帐', '女', '13475829262', 1);
INSERT INTO `user` VALUES (3, 'user3', '123', '乌鸦校尉', '男', '13485956526', 0);

SET FOREIGN_KEY_CHECKS = 1;
