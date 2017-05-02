/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_blog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-05-02 17:59:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL COMMENT '主人id',
  `followed_id` int(11) DEFAULT NULL COMMENT '好友id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow
-- ----------------------------

-- ----------------------------
-- Table structure for response
-- ----------------------------
DROP TABLE IF EXISTS `response`;
CREATE TABLE `response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of response
-- ----------------------------

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `author` varchar(255) DEFAULT NULL COMMENT '文章作者',
  `type` int(255) DEFAULT NULL COMMENT '文章类型（0：原创、1：转载）',
  `loadURL` varchar(255) DEFAULT NULL COMMENT '转载地址',
  `label` varchar(255) DEFAULT NULL COMMENT '文章标签',
  `decoration` varchar(500) DEFAULT NULL COMMENT '文章描述信息',
  `content` text COMMENT '内容',
  `create_id` int(11) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `alter_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `state` int(2) DEFAULT '2' COMMENT '文章状态（"未审核","草稿","已发布"，“删除”）',
  `is_comment` tinyint(1) DEFAULT '1' COMMENT '评论：1是 0否',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '置顶 1：是 0 否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '测试JAVA', '耿强', '1', null, '测试JAVA', '测试JAVA', '<p>\n	测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA\n</p>\n<p>\n	测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA\n</p>\n<p>\n	测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA\n</p>\n<p>\n	测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA\n</p>\n<p>\n	测试JAVA测试JAVA测试JAVA测试JAVA\n</p>\n<p>\n	测试JAVA测试JAVA测试JAVA\n</p>\n<p>\n	测试JAVA测试JAVA\n</p>\n<p>\n	测试JAVA\n</p>\n<p>\n	测试JAVA测试JAVA\n</p>\n<p>\n	测试JAVA测试JAVA测试JAVA\n</p>\n<p>\n	测试JAVA测试JAVA测试JAVA测试JAVA\n</p>\n<p>\n	测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA\n</p>\n<p>\n	测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA\n</p>\n<p>\n	测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA\n</p>\n<p>\n	测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA测试JAVA\n</p>', null, null, '2017-04-27 14:38:57', '2', '1', null);
INSERT INTO `topic` VALUES ('2', '测试', '耿强', null, null, null, null, null, null, null, '2017-04-26 15:30:16', '2', '1', null);
INSERT INTO `topic` VALUES ('3', '测试', '耿强', null, null, null, null, null, null, null, '2017-04-26 15:30:16', '2', '1', null);
INSERT INTO `topic` VALUES ('4', '测试', '耿强', null, null, null, null, null, null, null, '2017-04-26 15:30:16', '2', '1', null);
INSERT INTO `topic` VALUES ('5', '测试', '耿强', null, null, null, null, null, null, null, '2017-04-26 15:30:16', '2', '1', null);
INSERT INTO `topic` VALUES ('6', '测试', '耿强', null, null, null, null, null, null, null, '2017-04-26 15:30:16', '2', '1', null);
INSERT INTO `topic` VALUES ('7', 'Java 跨语言实现方案', null, '1', null, 'Java跨语言调用实现方案,java基础', 'Java 跨语言实现方案', '<h2 id=\"背景：\" style=\"font-family:Lato, \" font-size:20px;color:#555555;text-align:justify;background-color:#ffffff;\"=\"\">\n	背景：\n	</h2>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	在大型分布式 java 应用中，为了方便开发者，通常底层的 rpc 框架都会做一些调用的封装，让应用层开发人员在开发服务的时候只用编写简单的 pojo 对象就可以了，如流行的 spring remoting ， jboss remoting 等等，都有这样的效果。\n		</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	随着业务的需要，可能上层应用希望采用非 java 技术，如 php ， ruby on rails ，而由于 java gc 和内存模型的限制，可能有的底层服务又需要采用更高性能和更加灵活的技术，如果 c++ ， python 等。\n	</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	这时候就会考虑跨语言的问题了，在如何不改动原有 pojo 实现的 rpc 框架，而让系统实现跨语言，这个难题摆在了中间件开发者的头上。\n		</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	问题 :\n	</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	现在我们不妨把上面说涉及的问题提取出来：\n		</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	1） 不能改变原有的 java rpc 服务的发布方式，仍然采用 pojo 。\n	</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	2） 上层非 java 应用可以调用到由 server 端 pojo 形式发布的服务。\n		</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	3） 底层非 java 应用，如 c++ ， python 等可以发布格式和 pojo service 一样的服务\n	</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	4） 提供优雅的借口给应用开发者。\n		</p>\n<a id=\"more\"></a><span style=\"color:#555555;font-family:Lato, \" font-size:14px;background-color:#ffffff;\"=\"\"></span> <h2 id=\"业界考察：\" style=\"font-family:Lato, \" font-size:20px;color:#555555;text-align:justify;background-color:#ffffff;\"=\"\"> <a href=\"http://jm.taobao.org/2013/12/04/389/#业界考察：\" class=\"headerlink\"></a>业界考察：\n			</h2>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	好在我们并不是第一个遇到这个问题的人，那我们来看看在我们业界的前辈们都给我们留下了哪些宝贵的财富（主要是互联网行业）。\n				</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\"> <strong>Google protocol buffers **</strong>： **Google 大神总是早人一步，在 google 架构的初期就意识到了跨语言的重要性，在构建 bigtable ， GFS 的同一时期就是定制出了一套跨语言方案。那就是 google protocol buffers ，不过直到 08 年， google protocl buffers 才开源出来，正所谓国之利器不可以示人，我们所看到的， google protocl buffers 其实是阉割版，如没有 map 的支持 ( 根据一些资料表明， google 内部是有这个东西的) ， python 的 native c 性能优化，不包括 rpc service ，虽然后面补了一个，但是可用性差强人意，不能多参，不能抛异常。不过在这方面我们确实不应该报太大的希望，因为 google 自己都说了 protocol buffers – a language-neutral, platform-neutral, extensible way of serializing structured data ，好吧，他只是一个序列化格式，而和 hessian ， java 序列化有所不同的是， protocol buffers 可以用通过定义好数据结构的 proto （ IDL ）文件产生目标语言代码，大大了减少了开发量，不过遗憾的是生成的代码有很强的侵入性，并不能产生我们需要的pojo java 对象。\n			</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	不过即使是这样，我们也从 google protocol buffers 身上学到了很多东西。\n				</p>\n<ol style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n				<li>\n					编码的压缩，采用 Base 128 Varints 序列化数字，减少网络传输开销。\n				</li>\n				<li>\n					非自描述数据， protocol buffers 将每个数据结构的描述信息嵌入到代码中，因此只需要传输数据过来，就可以反序列化出来该数据结构的实例了。\n				</li>\n				<li>\n					<a href=\"http://en.wikipedia.org/wiki/Immutable_object\" target=\"_blank\">Immutable object</a> ， protocol buffers 在生成的 java 代码中采用 builder&amp;message 模式， message 是一个不能变的对象，即只有getter ，没有 setter ，而每一个 message 的生成由一个对应的 builder 来完成，从这点可以看出， google 已经用上了函数式编程。\n				</li>\n				<li>\n					Rpc 异步话，虽然 protocol buffers 的 rpc 很简陋，但是一开始就只提供异步 callback 调用形式，可见 google 已经实现异步话，如果在互联网行业的人会知道，这点是相当不容易。<br />\n<strong>Facebook thrift **</strong>： **4 月 1 号，呵呵，没错， thrift 是 Facebook 于 07 年愚人节开源出来的，有点 google 的作风。 Thrift 是facebook 自己的一套跨语言实现。有人会问这个和 protocol buffers 有啥区别。 Ok ，先看看它的定义吧。\n				</li>\n					</ol>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	Thrift is a software framework for scalable cross-language services development. It combines a software stack with a code generation engine to build services that work efficiently and seamlessly between C++, Java, Python, PHP, Ruby, Erlang, Perl, Haskell, C#, Cocoa, Smalltalk, and OCaml.\n						</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	说得很清楚是一个跨语言的服务开发框架。包括的功能有 code generation （代码生成， protocol buffers 也有）， cross-language （跨语言， protocol buffers 也有）， service development （好吧，这个 protocol buffers 也有）。晕倒，这样看起来，它和 google protocol buffers 完全是同一个领域的东西，而其有点重复发明轮子的味道。\n					</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	刚开始，我们也有这样一个疑惑，好吧，接着往下看， here we go 。其实除了这些共同性以外（都是解决跨语言问题嘛）， thrift 还是和protocol buffers 有很大不同的。不同点如下：\n						</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	1） 提供一个完整的 service stack ，定义了一整套的 rpc 服务框架栈，这个 protocol buffers 是没有，这个绝对是 thrift 的利器，如果你想要开发一个服务， thrift 甚至有个栈层的实现，我靠，爽。\n					</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	2） Ok ，在 thrift 论文有这样一句话。 Thrift enforces a certain messaging structure when transporting data, but it is agnostic to the protocol encoding in use. 嗯哼，我懂了，它是不会管，你到底采用哪种序列化方式的，hessian ，xml 甚至是protocol buffers 。Oh ，my god 。\n						</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	3） 接下来不得不膜拜一下thrift 的service 接口的强大了，多参，异常，同步，异步调用的支持，这正是我们想要的, 瞬间给protocol buffers 比下去了。\n					</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	4） 多集合的支持 map ， set 都有，让你爽歪歪。 Protocol buffers 颤抖吧。\n						</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	这时候我们亲爱的读者就会问了，那我们的问题不就解决了吗，就是 thrift 。我笑而不语 , 虽然 thrift 是如此的强大，但是它仍然不是我们想要的， thrift 生成的代码也是强侵入性的，这样 pojo 的对象是无法发布服务的。还有一个硬伤是虽然 thrift 的 stack 很强大，当时这和我们原有系统的 stack 肯定是不兼容的，如 jboss remoting ， spring remoting ，它们都会加一些 header 信息，而 thrift 已有实现的传输中式没有header 信息的。值得一提的是现有的 thrift service 实现中，不是线程安全的，考虑到有些语言没有对线程很好的支持，尤其是 Facebook 最常用的 PHP 语言，所以现有的实现中没有线程安全 Client 的实现。这样就会造成 client 端 connection 不能复用的问题，相当于短连接了。（ ps ：其实短连接就真的比长连接性能差吗？这是个问题。）\n					</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	总结一下从 Facebook thrift 学到的东西：\n						</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	1） 同步，异步都支持，这个很强悍，一般的做法是对性能要求高的服务器端采用异步方式开发，对易用性有要求的客户端采用同步方式调用，是比较完美的。\n					</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	2） 从现有的非线程安全的实现看， Facebook 很有可能自己有一套更高效的线程安全的实现，估计考虑到和 thrift 关系不到，或者是核心技术，所以没有放出来，其实想自己做，也不是太难。\n						</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	3） Thrift 对很多脚本语言都进行了 native c 的性能优化，如 python 端，采用 native c 以后性能提高 20 倍。 Protocol buffers 一直在做这方面的优化，打算在 2.4 中加入，不过 protocol buffers 就像 jdk 7 一样难产，跟让人崩溃的是，前不久在论坛爆出做这块优化的哥们已经离开了 google ，不再负责了，好吧，我关心的是他去哪儿了，泪奔。\n					</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\"> <strong>Apache Hadoop avro **</strong>： **Avro is a data serialization system. Avro provides functionality similar to systems such as Thrift, Protocol Buffers, etc. 好吧它自己都承认了，我们就不去纠结了。\n						</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	简单介绍一下， avo 是 hadoop 项目下面用来传输数据的一个架构。也是一个跨语言解决方案。不过 avro 有自己的亮点。 1 ， <em>Dynamic typing</em>， 2 ， <em>Untagged data </em>， 3 ， . <em>No manually-assigned field Ids </em>。\n					</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	眼前一亮， Dynamic typing ， oh ， my god 。没错， avro 通过将 metadata 放在一个叫 schema 的对象里面，然后可以序列化对应的 pojo兑现。这个正是我想要的，至于其他的特性，的确没有咋仔细看 avro ，感觉上比 thrift ，和 protocol buffers 跟难学习，有熟悉的读者可以给我科普一下。\n						</p>\n<h2 id=\"解决方案：\" style=\"font-family:Lato, \" font-size:20px;color:#555555;text-align:justify;background-color:#ffffff;\"=\"\"> <a href=\"http://jm.taobao.org/2013/12/04/389/#解决方案：\" class=\"headerlink\"></a>解决方案：\n							</h2>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	好了，到了这里，读者大概心里也有数了， protocol buffers ， thrift ， avro 都有我们想要的和我们不想要的。要解决我们的问题，我们只需要扬长避短就可以了。揉揉就是我们的东西了。方案如下：\n								</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	1） 采用 protocol buffers 的 message 序列化格式和代码生成。\n							</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	2） 采用 thrift 的 service 生成格式，以及实现兼容 jboss remoting 或者 spring remoting 的 thrift （ jboss remoting ） stack 。\n								</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	3） 原有的 pojo 对象采用 avro 的 schema 方式序列化和反序列化该对象。\n							</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	Ok 了，一切看起来是那样的完美。呵呵，不要被迷惑，还有很多 detail 的事情需要解决，时候不早，吃碗泡面，洗洗睡了，有时间，再把具体实现 detail 分享给大家。\n								</p>\n<p style=\"color:#555555;font-family:Lato, \" font-size:14px;text-align:justify;background-color:#ffffff;\"=\"\">\n	10/24/2010 1:22 AM 小丑鱼\n							</p>', null, null, '2017-04-27 14:58:12', '2', '0', null);

-- ----------------------------
-- Table structure for topic_stat
-- ----------------------------
DROP TABLE IF EXISTS `topic_stat`;
CREATE TABLE `topic_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `read_count` int(11) DEFAULT '0' COMMENT '文章点击数',
  `up_vote` int(11) DEFAULT '0' COMMENT '点赞数',
  `comment_count` int(11) DEFAULT '0' COMMENT '评论数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic_stat
-- ----------------------------
INSERT INTO `topic_stat` VALUES ('1', '10', '10', '10');
INSERT INTO `topic_stat` VALUES ('2', '10', '10', '10');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) DEFAULT NULL COMMENT '密码MD5',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(2) DEFAULT '1' COMMENT '用户状态：0：未激活 1：已激活',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '/file/img/avatar/170502/65a9d9ad2bb8478dbd660ca78da1f762.jpg', '2017-04-21 15:14:27', '1');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `birthday` varchar(255) DEFAULT NULL COMMENT '出生年月日',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `introduce` text COMMENT '自我介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '耿强', '1', '1994-05-29', '935860278@qq.com', '15705273195', '帅');
