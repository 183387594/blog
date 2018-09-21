-- phpMyAdmin SQL Dump
-- version 4.4.15.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-09-07 09:56:30
-- 服务器版本： 5.5.48-log
-- PHP Version: 7.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `last_user_id` int(10) unsigned NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_original` tinyint(1) NOT NULL DEFAULT '0',
  `is_draft` tinyint(1) NOT NULL DEFAULT '0',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0',
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `articles`
--

INSERT INTO `articles` (`id`, `category_id`, `user_id`, `last_user_id`, `slug`, `title`, `subtitle`, `content`, `page_image`, `meta_description`, `is_original`, `is_draft`, `view_count`, `published_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(48, 11, 12, 12, '1-2-3-4-5-6-7-8-9-10', '命令记录', 'linux', '{"raw":"```\\nfind . -name \\"tongji.gamebox.2144.cn-access.log\\" | xargs grep \\"120147930\\"\\n```\\n\\n\\u6279\\u91cf\\u66ff\\u6362\\u5b57\\u6bb5 \\u5f53\\u524d\\u76ee\\u5f55\\n```\\nsed -i \\"s\\/12201\\u5ba4\\/13201\\u5ba4\\/g\\" `grep 12201\\u5ba4 -rl .`\\n```","html":"<pre><code>find . -name \\"tongji.gamebox.2144.cn-access.log\\" | xargs grep \\"120147930\\"<\\/code><\\/pre>\\n<p>\\u6279\\u91cf\\u66ff\\u6362\\u5b57\\u6bb5 \\u5f53\\u524d\\u76ee\\u5f55<\\/p>\\n<pre><code>sed -i \\"s\\/12201\\u5ba4\\/13201\\u5ba4\\/g\\" `grep 12201\\u5ba4 -rl .`<\\/code><\\/pre>"}', NULL, NULL, 0, 0, 735, '2017-06-20 13:57:00', '2017-06-06 23:26:53', '2018-05-26 20:00:46', NULL),
(49, 13, 12, 12, 'crontab', 'crontab 维持单例执行，避免重复执行', 'cron', '{"raw":"```\\npublic function handle()\\n\\t{\\n\\t\\t\\t\\t\\t$lock = Cache::tags([''lock''])->get(''format_lock'');\\n\\t\\t\\t\\t\\tif(!empty($lock)&&$lock == 1){\\n\\t\\t\\t\\t\\t\\t\\t\\techo ''this cron is lock'';\\n\\t\\t\\t\\t\\t\\t\\t\\texit;\\n\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\tCache::tags([''lock''])->put(''format_lock'', 1, 3);\\n\\t\\t\\t\\t\\trun();\\n\\t\\t\\t\\t\\tCache::tags([''lock''])->put(''format_lock'', 0, 3);\\n\\t}\\n```","html":"<pre><code>public function handle()\\n    {\\n                    $lock = Cache::tags([''lock''])-&gt;get(''format_lock'');\\n                    if(!empty($lock)&amp;&amp;$lock == 1){\\n                                echo ''this cron is lock'';\\n                                exit;\\n                    }\\n                    Cache::tags([''lock''])-&gt;put(''format_lock'', 1, 3);\\n                    run();\\n                    Cache::tags([''lock''])-&gt;put(''format_lock'', 0, 3);\\n    }<\\/code><\\/pre>"}', NULL, NULL, 0, 0, 723, '2017-06-15 13:57:00', '2017-06-09 01:55:01', '2018-05-22 22:19:52', NULL),
(74, 12, 12, 12, 'Laravel-migration-bug-database', 'laravel迁移数据库bug', 'Specified key was too long; max key length is 1000 bytes', '{"raw":"Laravel 5.4\\u9ed8\\u8ba4\\u4f7f\\u7528utf8mb4\\u5b57\\u7b26\\u7f16\\u7801\\uff0c\\u800c\\u4e0d\\u662f\\u4e4b\\u524d\\u7684utf8\\u7f16\\u7801\\u3002\\u56e0\\u6b64\\u8fd0\\u884cPHP artisan migrate \\u4f1a\\u51fa\\u73b0\\u5982\\u4e0b\\u9519\\u8bef\\uff1a\\n```linux\\n[Illuminate\\\\Database\\\\QueryException]\\nSQLSTATE[42000]: Syntax error or access violation: 1071 Specified key was too long; max key length is 767 bytes (SQL: alter table users add unique users_email_unique(email))\\n\\n[PDOException]\\nSQLSTATE[42000]: Syntax error or access violation: 1071 Specified key was too long; max key length is 767 bytes\\n```\\n\\u95ee\\u9898\\u6839\\u6e90\\n\\nMySQL\\u652f\\u6301\\u7684utf8\\u7f16\\u7801\\u6700\\u5927\\u5b57\\u7b26\\u957f\\u5ea6\\u4e3a3\\u5b57\\u8282\\uff0c\\u5982\\u679c\\u9047\\u52304\\u5b57\\u8282\\u7684\\u5bbd\\u5b57\\u7b26\\u5c31\\u4f1a\\u51fa\\u73b0\\u63d2\\u5165\\u5f02\\u5e38\\u3002\\u4e09\\u4e2a\\u5b57\\u8282UTF-8\\u6700\\u5927\\u80fd\\u7f16\\u7801\\u7684Unicode\\u5b57\\u7b26\\u662f0xffff\\uff0c\\u5373Unicode\\u4e2d\\u7684\\u57fa\\u672c\\u591a\\u6587\\u79cd\\u5e73\\u9762\\uff08BMP\\uff09\\u3002\\u56e0\\u800c\\u5305\\u62ecEmoji\\u8868\\u60c5\\uff08Emoji\\u662f\\u4e00\\u79cd\\u7279\\u6b8a\\u7684Unicode\\u7f16\\u7801\\uff09\\u5728\\u5185\\u7684\\u975e\\u57fa\\u672c\\u591a\\u6587\\u79cd\\u5e73\\u9762\\u7684Unicode\\u5b57\\u7b26\\u90fd\\u65e0\\u6cd5\\u4f7f\\u7528mysql\\u7684utf8\\u5b57\\u7b26\\u96c6\\u5b58\\u50a8\\u3002\\n\\n\\u8fd9\\u4e5f\\u5e94\\u8be5\\u5c31\\u662fLaravel 5.4\\u6539\\u75284\\u5b57\\u8282\\u957f\\u5ea6\\u7684utf8mb4\\u5b57\\u7b26\\u7f16\\u7801\\u7684\\u539f\\u56e0\\u4e4b\\u4e00\\u3002\\u4e0d\\u8fc7\\u8981\\u6ce8\\u610f\\u7684\\u662f\\uff0c\\u53ea\\u6709MySql 5.5.3\\u7248\\u672c\\u4ee5\\u540e\\u624d\\u5f00\\u59cb\\u652f\\u6301utf8mb4\\u5b57\\u7b26\\u7f16\\u7801\\uff08\\u67e5\\u770b\\u7248\\u672c\\uff1aselection version();\\uff09\\u3002\\u5982\\u679cMySql\\u7248\\u672c\\u8fc7\\u4f4e\\uff0c\\u9700\\u8981\\u8fdb\\u884c\\u7248\\u672c\\u66f4\\u65b0\\u3002\\n\\n\\u6ce8\\uff1a\\u5982\\u679c\\u662f\\u4eceLaravel 5.3\\u5347\\u7ea7\\u5230Laravel 5.4\\uff0c\\u4e0d\\u9700\\u8981\\u5bf9\\u5b57\\u7b26\\u7f16\\u7801\\u505a\\u5207\\u6362\\u3002\\n\\n\\u89e3\\u51b3\\u95ee\\u9898\\n\\n\\u5347\\u7ea7MySql\\u7248\\u672c\\u52305.5.3\\u4ee5\\u4e0a\\u3002\\n\\u624b\\u52a8\\u914d\\u7f6e\\u8fc1\\u79fb\\u547d\\u4ee4migrate\\u751f\\u6210\\u7684\\u9ed8\\u8ba4\\u5b57\\u7b26\\u4e32\\u957f\\u5ea6\\uff0c\\u5728AppServiceProvider\\u4e2d\\u8c03\\u7528Schema::defaultStringLength\\u65b9\\u6cd5\\u6765\\u5b9e\\u73b0\\u914d\\u7f6e\\uff1a\\n``` php\\nuse Illuminate\\\\Support\\\\Facades\\\\Schema;\\n\\n \\/**\\n* Bootstrap any application services.\\n*\\n* @return void\\n*\\/\\npublic function boot()\\n{\\n   Schema::defaultStringLength(191);\\n}\\n```","html":"<p>Laravel 5.4\\u9ed8\\u8ba4\\u4f7f\\u7528utf8mb4\\u5b57\\u7b26\\u7f16\\u7801\\uff0c\\u800c\\u4e0d\\u662f\\u4e4b\\u524d\\u7684utf8\\u7f16\\u7801\\u3002\\u56e0\\u6b64\\u8fd0\\u884cPHP artisan migrate \\u4f1a\\u51fa\\u73b0\\u5982\\u4e0b\\u9519\\u8bef\\uff1a<\\/p>\\n<pre><code class=\\"language-linux\\">[Illuminate\\\\Database\\\\QueryException]\\nSQLSTATE[42000]: Syntax error or access violation: 1071 Specified key was too long; max key length is 767 bytes (SQL: alter table users add unique users_email_unique(email))\\n\\n[PDOException]\\nSQLSTATE[42000]: Syntax error or access violation: 1071 Specified key was too long; max key length is 767 bytes<\\/code><\\/pre>\\n<p>\\u95ee\\u9898\\u6839\\u6e90<\\/p>\\n<p>MySQL\\u652f\\u6301\\u7684utf8\\u7f16\\u7801\\u6700\\u5927\\u5b57\\u7b26\\u957f\\u5ea6\\u4e3a3\\u5b57\\u8282\\uff0c\\u5982\\u679c\\u9047\\u52304\\u5b57\\u8282\\u7684\\u5bbd\\u5b57\\u7b26\\u5c31\\u4f1a\\u51fa\\u73b0\\u63d2\\u5165\\u5f02\\u5e38\\u3002\\u4e09\\u4e2a\\u5b57\\u8282UTF-8\\u6700\\u5927\\u80fd\\u7f16\\u7801\\u7684Unicode\\u5b57\\u7b26\\u662f0xffff\\uff0c\\u5373Unicode\\u4e2d\\u7684\\u57fa\\u672c\\u591a\\u6587\\u79cd\\u5e73\\u9762\\uff08BMP\\uff09\\u3002\\u56e0\\u800c\\u5305\\u62ecEmoji\\u8868\\u60c5\\uff08Emoji\\u662f\\u4e00\\u79cd\\u7279\\u6b8a\\u7684Unicode\\u7f16\\u7801\\uff09\\u5728\\u5185\\u7684\\u975e\\u57fa\\u672c\\u591a\\u6587\\u79cd\\u5e73\\u9762\\u7684Unicode\\u5b57\\u7b26\\u90fd\\u65e0\\u6cd5\\u4f7f\\u7528mysql\\u7684utf8\\u5b57\\u7b26\\u96c6\\u5b58\\u50a8\\u3002<\\/p>\\n<p>\\u8fd9\\u4e5f\\u5e94\\u8be5\\u5c31\\u662fLaravel 5.4\\u6539\\u75284\\u5b57\\u8282\\u957f\\u5ea6\\u7684utf8mb4\\u5b57\\u7b26\\u7f16\\u7801\\u7684\\u539f\\u56e0\\u4e4b\\u4e00\\u3002\\u4e0d\\u8fc7\\u8981\\u6ce8\\u610f\\u7684\\u662f\\uff0c\\u53ea\\u6709MySql 5.5.3\\u7248\\u672c\\u4ee5\\u540e\\u624d\\u5f00\\u59cb\\u652f\\u6301utf8mb4\\u5b57\\u7b26\\u7f16\\u7801\\uff08\\u67e5\\u770b\\u7248\\u672c\\uff1aselection version();\\uff09\\u3002\\u5982\\u679cMySql\\u7248\\u672c\\u8fc7\\u4f4e\\uff0c\\u9700\\u8981\\u8fdb\\u884c\\u7248\\u672c\\u66f4\\u65b0\\u3002<\\/p>\\n<p>\\u6ce8\\uff1a\\u5982\\u679c\\u662f\\u4eceLaravel 5.3\\u5347\\u7ea7\\u5230Laravel 5.4\\uff0c\\u4e0d\\u9700\\u8981\\u5bf9\\u5b57\\u7b26\\u7f16\\u7801\\u505a\\u5207\\u6362\\u3002<\\/p>\\n<p>\\u89e3\\u51b3\\u95ee\\u9898<\\/p>\\n<p>\\u5347\\u7ea7MySql\\u7248\\u672c\\u52305.5.3\\u4ee5\\u4e0a\\u3002<br \\/>\\n\\u624b\\u52a8\\u914d\\u7f6e\\u8fc1\\u79fb\\u547d\\u4ee4migrate\\u751f\\u6210\\u7684\\u9ed8\\u8ba4\\u5b57\\u7b26\\u4e32\\u957f\\u5ea6\\uff0c\\u5728AppServiceProvider\\u4e2d\\u8c03\\u7528Schema::defaultStringLength\\u65b9\\u6cd5\\u6765\\u5b9e\\u73b0\\u914d\\u7f6e\\uff1a<\\/p>\\n<pre><code class=\\"language-php\\">use Illuminate\\\\Support\\\\Facades\\\\Schema;\\n\\n \\/**\\n* Bootstrap any application services.\\n*\\n* @return void\\n*\\/\\npublic function boot()\\n{\\n   Schema::defaultStringLength(191);\\n}<\\/code><\\/pre>"}', 'http://or0z8sgc6.bkt.clouddn.com/cover/2017/06/13/XYWEwd66FGZxg19zrobuFW6lqiFFq2YnTBRh6I4E.jpg', 'laravel', 0, 0, 736, '2017-06-01 14:57:00', '2017-06-12 18:00:34', '2018-05-27 23:31:53', NULL),
(75, 14, 12, 12, 'Cross-domain-solutions', '跨域解决方案', 'jsonp cors', '{"raw":"###\\u4ee3\\u7406\\n\\t\\t\\u7531\\u540e\\u53f0\\u83b7\\u53d6\\n###JSONP\\n\\t\\t\\n###XHR2\\n###CORS\\n\\t\\t\\u652f\\u6301IE10\\u4ee5\\u4e0a\\u53ca\\u5176\\u4ed6\\u73b0\\u4ee3\\u6d4f\\u89c8\\u5668\\n\\t\\t\\n\\t\\t```php\\n\\t\\theader(''P3P: CP=\\"CURa ADMa DEVa PSAo PSDo OUR BUS UNI PUR INT DEM STA PRE COM NAV OTC NOI DSP COR\\"''); \\n\\t\\t```","html":"<h3>\\u4ee3\\u7406<\\/h3>\\n<pre><code>    \\u7531\\u540e\\u53f0\\u83b7\\u53d6<\\/code><\\/pre>\\n<h3>JSONP<\\/h3>\\n<h3>XHR2<\\/h3>\\n<h3>CORS<\\/h3>\\n<pre><code>    \\u652f\\u6301IE10\\u4ee5\\u4e0a\\u53ca\\u5176\\u4ed6\\u73b0\\u4ee3\\u6d4f\\u89c8\\u5668\\n\\n    ```php\\n    header(''P3P: CP=\\"CURa ADMa DEVa PSAo PSDo OUR BUS UNI PUR INT DEM STA PRE COM NAV OTC NOI DSP COR\\"''); \\n    ```<\\/code><\\/pre>"}', NULL, NULL, 0, 0, 701, '2017-06-07 13:58:00', '2017-06-22 23:43:58', '2018-05-26 08:16:18', NULL),
(78, 14, 12, 12, 'Cross-domain-problem-solving', '跨域问题解决', 'jsonp cors', '{"raw":"##\\u4ee3\\u7406\\n\\t\\t\\u7531\\u540e\\u53f0\\u83b7\\u53d6\\n##JSONP\\n\\t\\t\\n##XHR2\\n##CORS\\n\\t\\t\\u652f\\u6301IE10\\u4ee5\\u4e0a\\u53ca\\u5176\\u4ed6\\u73b0\\u4ee3\\u6d4f\\u89c8\\u5668","html":"<h2>\\u4ee3\\u7406<\\/h2>\\n<pre><code>    \\u7531\\u540e\\u53f0\\u83b7\\u53d6<\\/code><\\/pre>\\n<h2>JSONP<\\/h2>\\n<h2>XHR2<\\/h2>\\n<h2>CORS<\\/h2>\\n<pre><code>    \\u652f\\u6301IE10\\u4ee5\\u4e0a\\u53ca\\u5176\\u4ed6\\u73b0\\u4ee3\\u6d4f\\u89c8\\u5668<\\/code><\\/pre>"}', NULL, '跨域', 0, 0, 540, '2017-06-07 13:58:00', '2017-06-22 23:44:55', '2018-03-06 01:20:42', '2018-03-06 01:20:42'),
(79, 15, 12, 12, 'The-git-command-record', 'git命令记录', 'git', '{"raw":"```\\n\\u57fa\\u672c\\u547d\\u4ee4\\ngit init  \\u521d\\u59cb\\u5316\\u4e00\\u4e2a\\u7248\\u672c\\u5e93\\ngit add \\u5c06\\u9700\\u8981\\u63d0\\u4ea4\\u7684\\u6587\\u4ef6\\u6dfb\\u52a0\\u5230git\\u7d22\\u5f15\\u5e93\\uff0c\\u4e5f\\u79f0\\u4e3a\\u6682\\u5b58\\u533a\\uff0c\\u6b64\\u65f6\\u6587\\u4ef6\\u53d7\\u5230GIT\\u7ba1\\u7406\\ngit commit -m    \\u5c06\\u7d22\\u5f15\\u5e93\\u4e5f\\u5c31\\u662f\\u6682\\u5b58\\u533a\\u7684\\u5185\\u5bb9\\u8fdb\\u884c\\u63d0\\u4ea4\\uff0c\\u63d0\\u4ea4\\u81f3\\u5f53\\u524d\\u5206\\u652f\\ngit rm \\u7528\\u4e8e\\u5220\\u9664\\u4e00\\u4e2a\\u6587\\u4ef6\\u3002\\ngit status \\u67e5\\u770b\\u7248\\u672c\\u5e93\\u72b6\\u6001\\ngit log \\u67e5\\u770b\\u63d0\\u4ea4\\u5386\\u53f2   --pretty=oneline  \\u66f4\\u597d\\u7684\\u663e\\u793a\\ngit reflog \\u67e5\\u770b\\u547d\\u4ee4\\u5386\\u53f2\\ngit reset -hard commit_id    \\uff08HEAD \\u6307\\u5411\\u5f53\\u524d\\u7248\\u672c\\uff0c^\\u4e0a\\u4e00\\u4e2a\\u7248\\u672c\\uff09\\ngit reset \\u7248\\u672c\\u53f7 \\u6587\\u4ef6    \\u6062\\u590d\\u6307\\u5b9a\\u6587\\u4ef6\\nssh-keygen -t rsa -C \\"youremail@example.com\\" \\u521b\\u5efaSSH Key\\ngit remote add origin git@github.com:\\u7528\\u6237\\u540d\\/\\u9879\\u76ee\\u540d.git  \\u672c\\u5730\\u548c\\u8fdc\\u7a0b\\u5e93\\u5173\\u8054\\ngit push -u origin master Git\\u4e0d\\u4f46\\u4f1a\\u628a\\u672c\\u5730\\u7684master\\u5206\\u652f\\u5185\\u5bb9\\u63a8\\u9001\\u7684\\u8fdc\\u7a0b\\u65b0\\u7684master\\u5206\\u652f\\uff0c\\u8fd8\\u4f1a\\u628a\\u672c\\u5730\\u7684master\\u5206\\u652f\\u548c\\u8fdc\\u7a0b\\u7684master\\u5206\\u652f\\u5173\\u8054\\u8d77\\u6765\\uff0c\\u5728\\u4ee5\\u540e\\u7684\\u63a8\\u9001\\u6216\\u8005\\u62c9\\u53d6\\u65f6\\u5c31\\u53ef\\u4ee5\\u7b80\\u5316\\u547d\\u4ee4\\u3002\\ngit clone \\u4ece\\u8fdc\\u7a0b\\u7248\\u672c\\u5e93\\u514b\\u9686\\u4e00\\u4e2a\\u672c\\u5730\\u5e93\\ngit branch \\u67e5\\u770b\\u5206\\u652f\\ngit branch <name> \\u521b\\u5efa\\u5206\\u652f\\ngit checkout <name> \\u5207\\u6362\\u5206\\u652f\\ngit checkout -b <name>\\u521b\\u5efa+\\u5207\\u6362\\u5206\\u652f\\ngit merge <name> \\u5408\\u5e76\\u67d0\\u5206\\u652f\\u5230\\u5f53\\u524d\\u5206\\u652f --no-ff\\u5f3a\\u5236\\u7981\\u7528Fast forward\\u6a21\\u5f0f\\ngit branch -d <name> \\u5220\\u9664\\u5206\\u652f\\ngit branch -D <name> \\u5f3a\\u884c\\u5220\\u9664\\u5206\\u652f\\uff0c\\u5220\\u9664\\u4e00\\u4e2a\\u6ca1\\u6709\\u5408\\u5e76\\u8fc7\\u7684\\u5206\\u652f\\ngit log --graph \\u67e5\\u770b\\u5206\\u652f\\u5408\\u5e76\\u56fe git log --graph --pretty=oneline --abbrev-commit\\ngit stash \\u5f53\\u524d\\u5de5\\u4f5c\\u73b0\\u573a\\u201c\\u50a8\\u85cf\\u201d\\u8d77\\u6765\\uff0c\\u7528\\u4e8e\\u8fd8\\u4e0d\\u60f3\\u63d0\\u4ea4\\uff0c\\u4f46\\u662f\\u60f3\\u5207\\u6362\\u5206\\u652f\\u65f6\\u4f7f\\u7528\\ngit stash list  \\u4fdd\\u5b58\\u7684\\u5217\\u8868\\ngit stash apply  \\u5207\\u6362\\u5230\\u4fdd\\u5b58\\u7684\\u72b6\\u6001\\ngit stash drop   \\u5c06\\u4fdd\\u5b58\\u7684\\u72b6\\u6001\\u5220\\u9664\\ngit stash pop \\u5207\\u6362\\u5230\\u4fdd\\u5b58\\u7684\\u72b6\\u6001\\u5e76\\u5220\\u9664\\ngit remote\\u67e5\\u770b\\u8fdc\\u7a0b\\u5e93\\u7684\\u4fe1\\u606f -v\\u663e\\u793a\\u66f4\\u8be6\\u7ec6\\u7684\\u4fe1\\u606f\\ngit tag <name> <\\u7248\\u672c\\u53f7> \\u6253\\u6807\\u7b7e\\uff0c\\u9ed8\\u8ba4\\u6807\\u7b7e\\u662f\\u6253\\u5728\\u6700\\u65b0\\u63d0\\u4ea4\\u7684commit\\u4e0a\\u7684\\uff0c-a\\u6307\\u5b9a\\u6807\\u7b7e\\u540d\\uff0c-m\\u6307\\u5b9a\\u8bf4\\u660e\\u6587\\u5b57\\ngit tag \\u67e5\\u770b\\u6807\\u7b7e\\ngit show <tagname>\\u67e5\\u770b\\u6807\\u7b7e\\u4fe1\\u606f\\ngit tag -d <name> \\u5220\\u9664\\u6807\\u7b7e\\ngit push origin <tagname> | --tags \\u5c06\\u6807\\u7b7e\\u63a8\\u9001\\u5230\\u8fdc\\u7a0b\\ngit push origin :refs\\/tags\\/<tagname>\\u53ef\\u4ee5\\u5220\\u9664\\u4e00\\u4e2a\\u8fdc\\u7a0b\\u6807\\u7b7e\\ngit check-ignore \\u68c0\\u67e5\\u5ffd\\u7565\\u6587\\u4ef6\\n\\u5de5\\u4f5c\\u533a\\u548c\\u6682\\u5b58\\u533a\\u7684\\u6982\\u5ff5\\n\\u5de5\\u4f5c\\u533a \\uff08Working Directory\\uff09 \\uff0c\\u5c31\\u662f\\u4f60\\u518d\\u7535\\u8111\\u91cc\\u80fd\\u770b\\u5230\\u7684\\u76ee\\u5f55\\n\\u7248\\u672c\\u5e93 \\uff08Repository\\uff09,\\u5de5\\u4f5c\\u533a\\u6709\\u4e00\\u4e2a\\u9690\\u85cf\\u76ee\\u5f55.git\\uff0c\\u8fd9\\u4e2a\\u4e0d\\u7b97\\u5de5\\u4f5c\\u533a\\uff0c\\u800c\\u662fGit\\u7684\\u7248\\u672c\\u5e93\\nGit\\u7684\\u7248\\u672c\\u5e93\\u91cc\\u5b58\\u4e86\\u5f88\\u591a\\u4e1c\\u897f\\uff0c\\u5176\\u4e2d\\u6700\\u91cd\\u8981\\u7684\\u5c31\\u662f\\u79f0\\u4e3astage\\uff08\\u6216\\u8005\\u53ebindex\\uff09\\u7684\\u6682\\u5b58\\u533a\\uff0c\\u8fd8\\u6709Git\\u4e3a\\u6211\\u4eec\\u81ea\\u52a8\\u521b\\u5efa\\u7684\\u7b2c\\u4e00\\u4e2a\\u5206\\u652fmaster\\uff0c\\u4ee5\\u53ca\\u6307\\u5411master\\u7684\\u4e00\\u4e2a\\u6307\\u9488\\u53ebHEAD\\u3002\\n\\u6bcf\\u6b21\\u4fee\\u6539\\uff0c\\u5982\\u679c\\u4e0dadd\\u5230\\u6682\\u5b58\\u533a\\uff0c\\u90a3\\u5c31\\u4e0d\\u4f1a\\u52a0\\u5165\\u5230commit\\u4e2d\\u3002\\n\\n\\u64a4\\u9500\\u4fee\\u6539\\n\\u6587\\u4ef6\\u5df2\\u4fee\\u6539\\uff0c\\u672aadd\\u5230\\u6682\\u5b58\\u533a:git checkout -- file\\u53ef\\u8fd8\\u539f\\n\\u6587\\u4ef6\\u5df2\\u4fee\\u6539\\uff0c\\u5e76add\\u5230\\u6682\\u5b58\\u533a\\u672acommit\\uff1agit reset HEAD file  git checkout -- file\\u53ef\\u8fd8\\u539f\\n\\n\\u64a4\\u9500\\u5220\\u9664\\n\\u6587\\u4ef6\\u4f7f\\u7528git rm\\u5220\\u9664\\u4f46\\u662f\\u5e76\\u672acommit\\uff1agit reset HEAD file  git checkout -- file\\u53ef\\u8fd8\\u539f\\n\\n\\u5206\\u652f\\u7ba1\\u7406\\ngit checkout\\u547d\\u4ee4\\u52a0\\u4e0a-b\\u53c2\\u6570\\u8868\\u793a\\u521b\\u5efa\\u5e76\\u5207\\u6362\\uff0c\\u76f8\\u5f53\\u4e8e\\u4ee5\\u4e0b\\u4e24\\u6761\\u547d\\u4ee4\\uff1a\\ngit branch dev\\ngit checkout dev\\n```\\n\\n```git\\ngit cheery-pick <commit-id> \\u5c06\\u4e00\\u4e2acommit\\u63d0\\u4ea4\\u5230\\u672c\\u5206\\u652f\\n```","html":"<pre><code>\\u57fa\\u672c\\u547d\\u4ee4\\ngit init  \\u521d\\u59cb\\u5316\\u4e00\\u4e2a\\u7248\\u672c\\u5e93\\ngit add \\u5c06\\u9700\\u8981\\u63d0\\u4ea4\\u7684\\u6587\\u4ef6\\u6dfb\\u52a0\\u5230git\\u7d22\\u5f15\\u5e93\\uff0c\\u4e5f\\u79f0\\u4e3a\\u6682\\u5b58\\u533a\\uff0c\\u6b64\\u65f6\\u6587\\u4ef6\\u53d7\\u5230GIT\\u7ba1\\u7406\\ngit commit -m    \\u5c06\\u7d22\\u5f15\\u5e93\\u4e5f\\u5c31\\u662f\\u6682\\u5b58\\u533a\\u7684\\u5185\\u5bb9\\u8fdb\\u884c\\u63d0\\u4ea4\\uff0c\\u63d0\\u4ea4\\u81f3\\u5f53\\u524d\\u5206\\u652f\\ngit rm \\u7528\\u4e8e\\u5220\\u9664\\u4e00\\u4e2a\\u6587\\u4ef6\\u3002\\ngit status \\u67e5\\u770b\\u7248\\u672c\\u5e93\\u72b6\\u6001\\ngit log \\u67e5\\u770b\\u63d0\\u4ea4\\u5386\\u53f2   --pretty=oneline  \\u66f4\\u597d\\u7684\\u663e\\u793a\\ngit reflog \\u67e5\\u770b\\u547d\\u4ee4\\u5386\\u53f2\\ngit reset -hard commit_id    \\uff08HEAD \\u6307\\u5411\\u5f53\\u524d\\u7248\\u672c\\uff0c^\\u4e0a\\u4e00\\u4e2a\\u7248\\u672c\\uff09\\ngit reset \\u7248\\u672c\\u53f7 \\u6587\\u4ef6    \\u6062\\u590d\\u6307\\u5b9a\\u6587\\u4ef6\\nssh-keygen -t rsa -C \\"youremail@example.com\\" \\u521b\\u5efaSSH Key\\ngit remote add origin git@github.com:\\u7528\\u6237\\u540d\\/\\u9879\\u76ee\\u540d.git  \\u672c\\u5730\\u548c\\u8fdc\\u7a0b\\u5e93\\u5173\\u8054\\ngit push -u origin master Git\\u4e0d\\u4f46\\u4f1a\\u628a\\u672c\\u5730\\u7684master\\u5206\\u652f\\u5185\\u5bb9\\u63a8\\u9001\\u7684\\u8fdc\\u7a0b\\u65b0\\u7684master\\u5206\\u652f\\uff0c\\u8fd8\\u4f1a\\u628a\\u672c\\u5730\\u7684master\\u5206\\u652f\\u548c\\u8fdc\\u7a0b\\u7684master\\u5206\\u652f\\u5173\\u8054\\u8d77\\u6765\\uff0c\\u5728\\u4ee5\\u540e\\u7684\\u63a8\\u9001\\u6216\\u8005\\u62c9\\u53d6\\u65f6\\u5c31\\u53ef\\u4ee5\\u7b80\\u5316\\u547d\\u4ee4\\u3002\\ngit clone \\u4ece\\u8fdc\\u7a0b\\u7248\\u672c\\u5e93\\u514b\\u9686\\u4e00\\u4e2a\\u672c\\u5730\\u5e93\\ngit branch \\u67e5\\u770b\\u5206\\u652f\\ngit branch &lt;name&gt; \\u521b\\u5efa\\u5206\\u652f\\ngit checkout &lt;name&gt; \\u5207\\u6362\\u5206\\u652f\\ngit checkout -b &lt;name&gt;\\u521b\\u5efa+\\u5207\\u6362\\u5206\\u652f\\ngit merge &lt;name&gt; \\u5408\\u5e76\\u67d0\\u5206\\u652f\\u5230\\u5f53\\u524d\\u5206\\u652f --no-ff\\u5f3a\\u5236\\u7981\\u7528Fast forward\\u6a21\\u5f0f\\ngit branch -d &lt;name&gt; \\u5220\\u9664\\u5206\\u652f\\ngit branch -D &lt;name&gt; \\u5f3a\\u884c\\u5220\\u9664\\u5206\\u652f\\uff0c\\u5220\\u9664\\u4e00\\u4e2a\\u6ca1\\u6709\\u5408\\u5e76\\u8fc7\\u7684\\u5206\\u652f\\ngit log --graph \\u67e5\\u770b\\u5206\\u652f\\u5408\\u5e76\\u56fe git log --graph --pretty=oneline --abbrev-commit\\ngit stash \\u5f53\\u524d\\u5de5\\u4f5c\\u73b0\\u573a\\u201c\\u50a8\\u85cf\\u201d\\u8d77\\u6765\\uff0c\\u7528\\u4e8e\\u8fd8\\u4e0d\\u60f3\\u63d0\\u4ea4\\uff0c\\u4f46\\u662f\\u60f3\\u5207\\u6362\\u5206\\u652f\\u65f6\\u4f7f\\u7528\\ngit stash list  \\u4fdd\\u5b58\\u7684\\u5217\\u8868\\ngit stash apply  \\u5207\\u6362\\u5230\\u4fdd\\u5b58\\u7684\\u72b6\\u6001\\ngit stash drop   \\u5c06\\u4fdd\\u5b58\\u7684\\u72b6\\u6001\\u5220\\u9664\\ngit stash pop \\u5207\\u6362\\u5230\\u4fdd\\u5b58\\u7684\\u72b6\\u6001\\u5e76\\u5220\\u9664\\ngit remote\\u67e5\\u770b\\u8fdc\\u7a0b\\u5e93\\u7684\\u4fe1\\u606f -v\\u663e\\u793a\\u66f4\\u8be6\\u7ec6\\u7684\\u4fe1\\u606f\\ngit tag &lt;name&gt; &lt;\\u7248\\u672c\\u53f7&gt; \\u6253\\u6807\\u7b7e\\uff0c\\u9ed8\\u8ba4\\u6807\\u7b7e\\u662f\\u6253\\u5728\\u6700\\u65b0\\u63d0\\u4ea4\\u7684commit\\u4e0a\\u7684\\uff0c-a\\u6307\\u5b9a\\u6807\\u7b7e\\u540d\\uff0c-m\\u6307\\u5b9a\\u8bf4\\u660e\\u6587\\u5b57\\ngit tag \\u67e5\\u770b\\u6807\\u7b7e\\ngit show &lt;tagname&gt;\\u67e5\\u770b\\u6807\\u7b7e\\u4fe1\\u606f\\ngit tag -d &lt;name&gt; \\u5220\\u9664\\u6807\\u7b7e\\ngit push origin &lt;tagname&gt; | --tags \\u5c06\\u6807\\u7b7e\\u63a8\\u9001\\u5230\\u8fdc\\u7a0b\\ngit push origin :refs\\/tags\\/&lt;tagname&gt;\\u53ef\\u4ee5\\u5220\\u9664\\u4e00\\u4e2a\\u8fdc\\u7a0b\\u6807\\u7b7e\\ngit check-ignore \\u68c0\\u67e5\\u5ffd\\u7565\\u6587\\u4ef6\\n\\u5de5\\u4f5c\\u533a\\u548c\\u6682\\u5b58\\u533a\\u7684\\u6982\\u5ff5\\n\\u5de5\\u4f5c\\u533a \\uff08Working Directory\\uff09 \\uff0c\\u5c31\\u662f\\u4f60\\u518d\\u7535\\u8111\\u91cc\\u80fd\\u770b\\u5230\\u7684\\u76ee\\u5f55\\n\\u7248\\u672c\\u5e93 \\uff08Repository\\uff09,\\u5de5\\u4f5c\\u533a\\u6709\\u4e00\\u4e2a\\u9690\\u85cf\\u76ee\\u5f55.git\\uff0c\\u8fd9\\u4e2a\\u4e0d\\u7b97\\u5de5\\u4f5c\\u533a\\uff0c\\u800c\\u662fGit\\u7684\\u7248\\u672c\\u5e93\\nGit\\u7684\\u7248\\u672c\\u5e93\\u91cc\\u5b58\\u4e86\\u5f88\\u591a\\u4e1c\\u897f\\uff0c\\u5176\\u4e2d\\u6700\\u91cd\\u8981\\u7684\\u5c31\\u662f\\u79f0\\u4e3astage\\uff08\\u6216\\u8005\\u53ebindex\\uff09\\u7684\\u6682\\u5b58\\u533a\\uff0c\\u8fd8\\u6709Git\\u4e3a\\u6211\\u4eec\\u81ea\\u52a8\\u521b\\u5efa\\u7684\\u7b2c\\u4e00\\u4e2a\\u5206\\u652fmaster\\uff0c\\u4ee5\\u53ca\\u6307\\u5411master\\u7684\\u4e00\\u4e2a\\u6307\\u9488\\u53ebHEAD\\u3002\\n\\u6bcf\\u6b21\\u4fee\\u6539\\uff0c\\u5982\\u679c\\u4e0dadd\\u5230\\u6682\\u5b58\\u533a\\uff0c\\u90a3\\u5c31\\u4e0d\\u4f1a\\u52a0\\u5165\\u5230commit\\u4e2d\\u3002\\n\\n\\u64a4\\u9500\\u4fee\\u6539\\n\\u6587\\u4ef6\\u5df2\\u4fee\\u6539\\uff0c\\u672aadd\\u5230\\u6682\\u5b58\\u533a:git checkout -- file\\u53ef\\u8fd8\\u539f\\n\\u6587\\u4ef6\\u5df2\\u4fee\\u6539\\uff0c\\u5e76add\\u5230\\u6682\\u5b58\\u533a\\u672acommit\\uff1agit reset HEAD file  git checkout -- file\\u53ef\\u8fd8\\u539f\\n\\n\\u64a4\\u9500\\u5220\\u9664\\n\\u6587\\u4ef6\\u4f7f\\u7528git rm\\u5220\\u9664\\u4f46\\u662f\\u5e76\\u672acommit\\uff1agit reset HEAD file  git checkout -- file\\u53ef\\u8fd8\\u539f\\n\\n\\u5206\\u652f\\u7ba1\\u7406\\ngit checkout\\u547d\\u4ee4\\u52a0\\u4e0a-b\\u53c2\\u6570\\u8868\\u793a\\u521b\\u5efa\\u5e76\\u5207\\u6362\\uff0c\\u76f8\\u5f53\\u4e8e\\u4ee5\\u4e0b\\u4e24\\u6761\\u547d\\u4ee4\\uff1a\\ngit branch dev\\ngit checkout dev<\\/code><\\/pre>\\n<pre><code class=\\"language-git\\">git cheery-pick &lt;commit-id&gt; \\u5c06\\u4e00\\u4e2acommit\\u63d0\\u4ea4\\u5230\\u672c\\u5206\\u652f<\\/code><\\/pre>"}', NULL, 'des', 0, 0, 645, '2017-07-12 13:57:00', '2017-07-26 19:36:55', '2018-05-28 22:55:03', NULL),
(80, 16, 12, 12, 'Build-the-LNMP-environment-based-on-Docker', '基于Docker搭建LNMP环境x', '使用Docker快速搭建Nginx+PHP-FPM环境', '{"raw":"\\u5173\\u4e8e\\u4ec0\\u4e48\\u662fdocker\\uff0c\\u5efa\\u8bae\\u5927\\u5bb6\\u5148\\u4e0a\\u7f51\\u67e5\\u67e5\\u6709\\u5173\\u7684\\u7528\\u6cd5\\u3002\\u5982\\u679c\\u60a8\\u4e0d\\u4e86\\u89e3\\uff0c\\u5728\\u8fd9\\u7bc7\\u6587\\u7ae0\\u4e2d\\uff0c\\u60a8\\u53ef\\u4ee5\\u7b80\\u5355\\u7684\\u7406\\u89e3\\u4e3a\\u4ed6\\u662f\\u4e00\\u4e2a\\u8f7b\\u91cf\\u7ea7\\u7684\\u865a\\u62df\\u673a\\u3002\\n\\n\\u4e00\\u3001docker\\u5b89\\u88c5mysql \\n\\u9996\\u5148\\uff0c\\u6211\\u4eec\\u4ece\\u4ed3\\u5e93\\u62c9\\u53d6\\u4e00\\u4e2aMySql\\u7684\\u955c\\u50cf\\n\\n\\u7136\\u540e\\u6211\\u4eec\\u53ef\\u4ee5\\u901a\\u8fc7\\u547d\\u4ee4 docker images \\u67e5\\u770b\\u6211\\u4eec\\u521a\\u521a\\u62c9\\u4e0b\\u6765\\u7684mysql\\u7684\\u955c\\u50cf\\n\\u00b7\\u00b7\\u00b7\\ndocker pull php:7.0-fpm\\n\\u00b7\\u00b7\\u00b7","html":"<p>\\u5173\\u4e8e\\u4ec0\\u4e48\\u662fdocker\\uff0c\\u5efa\\u8bae\\u5927\\u5bb6\\u5148\\u4e0a\\u7f51\\u67e5\\u67e5\\u6709\\u5173\\u7684\\u7528\\u6cd5\\u3002\\u5982\\u679c\\u60a8\\u4e0d\\u4e86\\u89e3\\uff0c\\u5728\\u8fd9\\u7bc7\\u6587\\u7ae0\\u4e2d\\uff0c\\u60a8\\u53ef\\u4ee5\\u7b80\\u5355\\u7684\\u7406\\u89e3\\u4e3a\\u4ed6\\u662f\\u4e00\\u4e2a\\u8f7b\\u91cf\\u7ea7\\u7684\\u865a\\u62df\\u673a\\u3002<\\/p>\\n<p>\\u4e00\\u3001docker\\u5b89\\u88c5mysql<br \\/>\\n\\u9996\\u5148\\uff0c\\u6211\\u4eec\\u4ece\\u4ed3\\u5e93\\u62c9\\u53d6\\u4e00\\u4e2aMySql\\u7684\\u955c\\u50cf<\\/p>\\n<p>\\u7136\\u540e\\u6211\\u4eec\\u53ef\\u4ee5\\u901a\\u8fc7\\u547d\\u4ee4 docker images \\u67e5\\u770b\\u6211\\u4eec\\u521a\\u521a\\u62c9\\u4e0b\\u6765\\u7684mysql\\u7684\\u955c\\u50cf<br \\/>\\n\\u00b7\\u00b7\\u00b7<br \\/>\\ndocker pull php:7.0-fpm<br \\/>\\n\\u00b7\\u00b7\\u00b7<\\/p>"}', 'http://or0z8sgc6.bkt.clouddn.com/cover/2018/03/05/3xzoK1QZm2LOw6lh57jvLspSKq137DhGeftl1x8o.png', '11', 0, 0, 180, '2018-03-22 16:57:00', '2018-03-04 22:24:17', '2018-05-23 07:38:13', NULL);
INSERT INTO `articles` (`id`, `category_id`, `user_id`, `last_user_id`, `slug`, `title`, `subtitle`, `content`, `page_image`, `meta_description`, `is_original`, `is_draft`, `view_count`, `published_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(81, 19, 12, 12, 'Redis-installation-and-configuration-commands', 'redis安装及配置命令', 'redis入门', '{"raw":"`\\u76ee\\u5f55 start`\\n \\n- [Redis](#redis)\\n    - [\\u3010windows\\u4e0a\\u7684\\u57fa\\u672c\\u914d\\u7f6e\\u3011](#windows\\u4e0a\\u7684\\u57fa\\u672c\\u914d\\u7f6e)\\n    - [Linux\\u4e0b\\u7684\\u4f7f\\u7528](#linux\\u4e0b\\u7684\\u4f7f\\u7528)\\n        - [\\u547d\\u4ee4\\u5b89\\u88c5](#\\u547d\\u4ee4\\u5b89\\u88c5)\\n        - [\\u89e3\\u538b\\u5373\\u7528](#\\u89e3\\u538b\\u5373\\u7528)\\n    - [docker\\u5b89\\u88c5redis](#docker\\u5b89\\u88c5redis)\\n    - [redis\\u914d\\u7f6e\\u6587\\u4ef6](#redis\\u914d\\u7f6e\\u6587\\u4ef6)\\n    - [Redis\\u547d\\u4ee4\\u884c\\u5e38\\u89c4\\u4f7f\\u7528](#redis\\u547d\\u4ee4\\u884c\\u5e38\\u89c4\\u4f7f\\u7528)\\n        - [\\u5e38\\u7528\\u7684\\u6570\\u636e\\u7c7b\\u578b\\u64cd\\u4f5c](#\\u5e38\\u7528\\u7684\\u6570\\u636e\\u7c7b\\u578b\\u64cd\\u4f5c)\\n            - [\\u8fc7\\u671f\\u7b56\\u7565](#\\u8fc7\\u671f\\u7b56\\u7565)\\n        - [\\u5404\\u6570\\u636e\\u7c7b\\u578b\\u7684\\u9ad8\\u7ea7\\u64cd\\u4f5c](#\\u5404\\u6570\\u636e\\u7c7b\\u578b\\u7684\\u9ad8\\u7ea7\\u64cd\\u4f5c)\\n            - [\\u5b57\\u7b26\\u4e32 String](#\\u5b57\\u7b26\\u4e32-string)\\n            - [\\u5217\\u8868 list](#\\u5217\\u8868-list)\\n            - [\\u96c6\\u5408 set](#\\u96c6\\u5408-set)\\n            - [\\u6709\\u5e8f\\u96c6\\u5408 zset](#\\u6709\\u5e8f\\u96c6\\u5408-zset)\\n            - [\\u6563\\u5217 hash](#\\u6563\\u5217-hash)\\n            - [HyperLogLog](#hyperloglog)\\n            - [GEO\\u3010\\u5730\\u7406\\u4f4d\\u7f6e\\u3011](#geo\\u5730\\u7406\\u4f4d\\u7f6e)\\n        - [Pub\\/Sub\\u53d1\\u5e03\\u8ba2\\u9605](#pubsub\\u53d1\\u5e03\\u8ba2\\u9605)\\n        - [\\u4e8b\\u52a1](#\\u4e8b\\u52a1)\\n        - [\\u670d\\u52a1\\u5668](#\\u670d\\u52a1\\u5668)\\n        - [Run Configuration](#run-configuration)\\n        - [\\u6570\\u636e\\u5b89\\u5168\\u548c\\u6027\\u80fd](#\\u6570\\u636e\\u5b89\\u5168\\u548c\\u6027\\u80fd)\\n            - [\\u6301\\u4e45\\u5316\\u7b56\\u7565](#\\u6301\\u4e45\\u5316\\u7b56\\u7565)\\n            - [\\u590d\\u5236](#\\u590d\\u5236)\\n            - [\\u6570\\u636e\\u8fc1\\u79fb](#\\u6570\\u636e\\u8fc1\\u79fb)\\n    - [\\u3010Redis\\u7684\\u4f7f\\u7528\\u3011](#redis\\u7684\\u4f7f\\u7528)\\n        - [\\u4f5c\\u4e3a\\u65e5\\u5fd7\\u8bb0\\u5f55](#\\u4f5c\\u4e3a\\u65e5\\u5fd7\\u8bb0\\u5f55)\\n        - [\\u4f5c\\u4e3a\\u7f51\\u7ad9\\u7edf\\u8ba1\\u6570\\u636e](#\\u4f5c\\u4e3a\\u7f51\\u7ad9\\u7edf\\u8ba1\\u6570\\u636e)\\n        - [\\u5b58\\u50a8\\u914d\\u7f6e\\u4fe1\\u606f](#\\u5b58\\u50a8\\u914d\\u7f6e\\u4fe1\\u606f)\\n        - [\\u81ea\\u52a8\\u8865\\u5168](#\\u81ea\\u52a8\\u8865\\u5168)\\n        - [\\u6784\\u5efa\\u9501](#\\u6784\\u5efa\\u9501)\\n        - [\\u4efb\\u52a1\\u961f\\u5217](#\\u4efb\\u52a1\\u961f\\u5217)\\n        - [\\u3010Java\\u4f7f\\u7528redis\\u3011](#java\\u4f7f\\u7528redis)\\n        - [jedis\\u9047\\u5230\\u7684\\u5f02\\u5e38](#jedis\\u9047\\u5230\\u7684\\u5f02\\u5e38)\\n        - [SpringBoot\\u4f7f\\u7528Redis](#springboot\\u4f7f\\u7528redis)\\n\\n`\\u76ee\\u5f55 end` *\\u76ee\\u5f55\\u521b\\u5efa\\u4e8e2018-02-02* | \\u66f4\\u591a: [CSDN](http:\\/\\/blog.csdn.net\\/kcp606) | [oschina](https:\\/\\/my.oschina.net\\/kcp1104) | [\\u7801\\u4e91](https:\\/\\/gitee.com\\/kcp1104) \\n****************************************\\n# Redis\\n> [Redis\\u6559\\u7a0b](http:\\/\\/www.runoob.com\\/redis\\/redis-tutorial.html)\\n\\n## \\u3010windows\\u4e0a\\u7684\\u57fa\\u672c\\u914d\\u7f6e\\u3011\\n- \\u6ce8\\u518c\\u4e3a\\u670d\\u52a1\\n\\t- `redis-server --service-install redis.windows.conf --loglevel verbose`\\n- \\u4f7f\\u7528cmder\\n\\t- cmd \\u4e2d\\u8fd0\\u884c `E:\\/redis\\/redis-server.exe E:\\/redis\\/redis.windows.conf`\\n- \\u914d\\u7f6e\\u5bc6\\u7801\\n\\t- `requirepass redis1104`\\n\\t- \\u5ba2\\u6237\\u7aef\\u767b\\u5f55 `auth redis1104`\\n\\n## Linux\\u4e0b\\u7684\\u4f7f\\u7528\\n\\n### \\u547d\\u4ee4\\u5b89\\u88c5\\n- \\u5b89\\u88c5 `apt install redis`\\n- \\u5f00\\u542f\\u6570\\u636e\\u5e93\\u670d\\u52a1 `redis-server`\\n- \\u6253\\u5f00\\u5ba2\\u6237\\u7aef `redis-cli`\\n\\n### \\u89e3\\u538b\\u5373\\u7528\\n> [\\u4e0b\\u8f7d\\u6253\\u5305\\u597d\\u7684](https:\\/\\/github.com\\/Kuangcp\\/Configs\\/tree\\/master\\/Database\\/redis)\\n`\\u6b65\\u9aa4:`\\n- \\u5b98\\u7f51\\u4e0b\\u8f7d\\u6e90\\u7801\\uff0c\\u6267\\u884c`make`\\u8fdb\\u884c\\u7f16\\u8bd1\\uff0c\\u7f16\\u8bd1\\u5b8c\\u6210\\u540e\\uff0c\\u590d\\u5236src\\u76ee\\u5f55\\u4e2d\\u7684`redis-cli redis-server`\\u5c31\\u53ef\\u4ee5\\u7528\\u4e86\\uff0credis-benchmark\\u53ef\\u9009\\uff0c\\u6d4b\\u6027\\u80fd\\n    - \\u518d\\u590d\\u5236\\u4e0b\\u9762\\u7684\\u7b80\\u5316\\u914d\\u7f6e\\u6587\\u4ef6\\uff0c\\u6216\\u8005\\u4f7f\\u7528\\u6e90\\u7801\\u4e2d\\u6839\\u76ee\\u5f55\\u4e0b\\u7684\\u914d\\u7f6e\\u6587\\u4ef6\\u81ea\\u5df1\\u914d\\u7f6e\\u4e0b\\n    - [\\u7b80\\u5316\\u914d\\u7f6e\\u6587\\u4ef6](https:\\/\\/raw.githubusercontent.com\\/Kuangcp\\/Configs\\/master\\/Database\\/redis\\/simple_redis.conf)\\n- \\u518d\\u521b\\u5efa\\u4ee5\\u4e0b\\u4e24\\u4e2a\\u811a\\u672c\\u5c31\\u53ef\\u4ee5\\u4fbf\\u6377\\u7684\\u4f7f\\u7528redis\\u4e86\\n`server_redis.sh`\\n```sh\\n    basepath=$(cd `dirname $0`; pwd)\\n    echo $basepath\\n    $basepath\\/redis-server $basepath\\/redis.conf>redis.log &\\n```\\n`client_redis.sh`\\n```sh\\n    basepath=$(cd `dirname $0`; pwd)\\n    $basepath\\/redis-cli -p 6379\\n```\\n\\n## docker\\u5b89\\u88c5redis\\n- [docker-install-redis](\\/Linux\\/Container\\/Docker_Soft.md)\\n\\n****************************\\n## redis\\u914d\\u7f6e\\u6587\\u4ef6\\n- [\\u914d\\u7f6e\\u6587\\u4ef6\\u8bb2\\u89e3](https:\\/\\/github.com\\/Kuangcp\\/Configs\\/blob\\/master\\/Database\\/redis\\/explain_redis.conf) | [\\u539f\\u59cb\\u914d\\u7f6e\\u6587\\u4ef6](https:\\/\\/github.com\\/Kuangcp\\/Configs\\/blob\\/master\\/Database\\/redis\\/redis.conf)\\n- `\\u4f7f\\u7528ing`[\\u7b80\\u5316\\u914d\\u7f6e\\u6587\\u4ef6](https:\\/\\/github.com\\/Kuangcp\\/Configs\\/blob\\/master\\/Database\\/redis\\/simple_redis.conf) \\n\\n********\\n## Redis\\u547d\\u4ee4\\u884c\\u5e38\\u89c4\\u4f7f\\u7528\\n### \\u5e38\\u7528\\u7684\\u6570\\u636e\\u7c7b\\u578b\\u64cd\\u4f5c\\n- \\u3010`\\u5b57\\u7b26\\u4e32`\\u3011\\n    - get \\n    - set\\n    - del \\n\\n- \\u3010`list \\u5217\\u8868 (\\u7c7b\\u4f3c\\u961f\\u5217)`\\u3011\\n    - rpush \\u53f3\\u5165\\u961f\\u5217\\uff0c\\u672b\\u7aef\\n    - lpush \\u5de6\\n    - lrange \\u83b7\\u53d6\\u8303\\u56f4 0\\uff0c-1 \\u8868\\u793a\\u83b7\\u53d6\\u5168\\u90e8\\n    - lindex \\u83b7\\u53d6\\u6307\\u5b9aindex\\u7684\\u5143\\u7d20\\n    - lpop \\u5de6\\u51fa\\u961f\\u5217\\n    - rpop\\n\\n- \\u3010`set \\u96c6\\u5408 (\\u7c7b\\u4f3c\\u65e0\\u5e8f\\u7684Set)`\\u3011\\n    - sadd \\u6dfb\\u52a0\\u4e00\\u4e2a\\u5bf9\\u8c61`asdd key member`\\n    - smembers \\u83b7\\u53d6\\u67d0Set\\u6240\\u6709\\u5143\\u7d20 `smembers key`\\n    - sismember \\u67e5\\u8be2\\u67d0Set\\u662f\\u5426\\u542b\\u67d0\\u5143\\u7d20\\uff0c\\u8fd4\\u56de\\u7c7b\\u578b\\u662f 0 1 `sismember key member`\\n    - srem \\u5220\\u9664\\u6307\\u5b9aSet\\u4e2d\\u6307\\u5b9a\\u5143\\u7d20 `srem key member`\\n\\n- \\u3010`hash \\u6563\\u5217 (\\u7c7b\\u4f3cMap \\u5d4c\\u5957\\uff0c\\u4e00\\u4e2a\\u5185\\u7f6e\\u7684\\u5fae\\u578bredis)`\\u3011\\n    - hget\\n    - hset\\n    - hgetall \\u83b7\\u53d6\\u67d0\\u6563\\u5217\\u6240\\u6709k-v\\n    - hdel \\u5220\\u9664\\u6563\\u5217\\u4e2d\\u6307\\u5b9ak\\n    - hincrby \\u81ea\\u589e\\n\\n- \\u3010`zset \\u6709\\u5e8f\\u96c6\\u5408(\\u5143\\u7d20\\u662f\\u952e\\u503c\\u5bf9\\uff0c\\u952e\\u662fmember\\u6210\\u5458\\uff0c\\u503c\\u662fscore\\u5206\\u503c\\u5fc5\\u987b\\u662f\\u6d6e\\u70b9\\u6570)`\\u3011\\n    - zadd \\u5c06\\u4e00\\u4e2a\\u7ed9\\u5b9a\\u5206\\u503c\\u7684\\u6210\\u5458\\u6dfb\\u52a0\\u5230\\u6709\\u5e8f\\u96c6\\u5408\\u91cc `zadd key 3.3 member` \\n    - zrange \\u6839\\u636e\\u5143\\u7d20\\u5728\\u6709\\u5e8f\\u96c6\\u5408\\u4e2d\\u7684\\u4f4d\\u7f6e\\uff0c\\u4ece\\u6709\\u5e8f\\u96c6\\u5408\\u4e2d\\u83b7\\u53d6\\u591a\\u4e2a\\u5143\\u7d20\\n        - zrange name 0 -1 withscores \\u83b7\\u53d6\\u6240\\u6709\\u5e76\\u83b7\\u53d6\\u5206\\u503c\\n        - zrange name 2 30 withscores \\n    - zrevrange \\u4ece\\u5927\\u5230\\u5c0f\\u6392\\u5e8f\\u7684\\u83b7\\u53d6\\u96c6\\u5408\\u5143\\u7d20\\n    - zrangebyscore \\u83b7\\u53d6\\u6709\\u5e8f\\u96c6\\u5408\\u5728\\u7ed9\\u5b9a\\u8303\\u56f4\\u4e2d\\u7684\\u6240\\u6709\\u5143\\u7d20\\n        - zrangebyscore name 0 200 withscores \\n    - zrem\\n    - zincrby \\u81ea\\u589e\\n    - zinterstore \\u8fdb\\u884c\\u96c6\\u5408\\u4e4b\\u95f4\\u7684\\u5e76\\u96c6\\uff08\\u53ef\\u4ee5\\u770b\\u4f5c\\u662f\\u591a\\u8868\\u8fde\\u63a5\\uff09\\n    - `\\u7cbe\\u5ea6\\u4e22\\u5931\\u95ee\\u9898`\\t\\n\\n#### \\u8fc7\\u671f\\u7b56\\u7565\\n- `expire key seconds` \\u8bbe\\u7f6e\\u952e\\u7684\\u8fc7\\u671f\\u65f6\\u95f4\\n- `PTTL\\/TTL key ` \\u67e5\\u770b\\u952e\\u5269\\u4f59\\u8fc7\\u671f\\u65f6\\u95f4\\uff08\\u751f\\u5b58\\u65f6\\u95f4\\uff09 ms\\/s\\n    -  -1\\u8868\\u793a\\u6c38\\u4e45 -2\\u8868\\u793a\\u6ca1\\u6709\\u8be5key\\n- \\n\\n*******************\\n### \\u5404\\u6570\\u636e\\u7c7b\\u578b\\u7684\\u9ad8\\u7ea7\\u64cd\\u4f5c\\n> [\\u4e2d\\u6587\\u6587\\u6863](http:\\/\\/redisdoc.com\\/index.html)\\n\\n#### \\u5b57\\u7b26\\u4e32 String\\n- \\u5b57\\u7b26\\u4e32\\u5c31\\u662f\\u5b57\\u8282\\u7ec4\\u6210\\u7684\\u5e8f\\u5217 \\u53ef\\u4ee5\\u653e\\u5b57\\u8282\\u4e32\\uff0c\\u6574\\u6570\\uff0c\\u6d6e\\u70b9\\u6570\\n- `set key newval nx `\\u5b58\\u5728\\u5219set\\u5931\\u8d25\\n- `set key newval xx `\\u4e0d\\u5b58\\u5728\\u5219set\\u5931\\u8d25\\n- \\u5b58\\u5165\\u7684String\\u80fd\\u88ab\\u89e3\\u6790\\u4e3a\\u6570\\u503c \\u5c31\\u80fd\\u4f7f\\u7528 incr incrby decr decrby \\n- `incr` \\u662f\\u539f\\u5b50\\u64cd\\u4f5c\\u5373\\u5e76\\u53d1\\u7684\\u60c5\\u51b5\\u4e0b\\u4e0d\\u4f1a\\u6709\\u810f\\u8bfb(\\u53ef\\u7528\\u4e8e\\u4e3b\\u952e\\u751f\\u6210\\u7b56\\u7565)\\n- `getset key val`  set\\u65b0\\u503c\\uff0cget\\u65e7\\u503c\\n- `mset mget `\\n\\t- `mset key val key val` \\n\\t- `mget key key key` \\u8fd4\\u56de\\u503c\\u7ec4\\u6210\\u7684\\u6570\\u7ec4\\n- `exists key` \\u6709\\u8be5\\u503c\\u5c31\\u8fd4\\u56de1\\u5426\\u52190\\n- `del key` \\u8fd4\\u56de1\\u88ab\\u5220\\u9664\\uff0c0 key\\u4e0d\\u5b58\\u5728\\n- `type key` \\u8fd4\\u56de\\u503c\\u7684\\u7c7b\\u578b\\n- `expire key secondes` \\u8bbe\\u7f6e\\u6216\\u6539\\u53d8\\u8d85\\u65f6\\u65f6\\u95f4\\uff0c\\u7cbe\\u5ea6\\u662f\\u79d2\\u6216\\u6beb\\u79d2\\n\\t- `set key val ex secondes` set\\u65f6\\u8bbe\\u7f6e\\u8d85\\u65f6\\u65f6\\u95f4\\n- `persist key` \\u53bb\\u9664\\u8d85\\u65f6\\u65f6\\u95f4\\n- `ttl key` \\u67e5\\u770b\\u5269\\u4f59\\u5b58\\u6d3b\\u65f6\\u95f4 -1\\u8868\\u793a\\u6c38\\u4e45 -2\\u8868\\u793a\\u6ca1\\u6709\\u8be5key\\n\\n\\n#### \\u5217\\u8868 list\\n- `rpush key val val val `\\u53f3\\/\\u5c3e\\u6dfb\\u52a0\\u5143\\u7d20 lpush\\u662f\\u5de6\\/\\u5934\\uff0c\\u82e5\\u8868\\u4e0d\\u5b58\\u5728\\u5c31\\u65b0\\u5efa\\n- `rpushx key value` \\u82e5\\u8868\\u4e0d\\u5b58\\u5728\\u5c31\\u4ec0\\u4e48\\u90fd\\u4e0d\\u505a\\uff0c\\u5426\\u5219\\u5c3e\\u63d2\\u5143\\u7d20\\n- `rpop key` \\u4ecelist\\u53f3\\/\\u5c3e\\u7aef\\u4e2d\\u5220\\u9664\\u5143\\u7d20\\u8fd4\\u56de\\u5143\\u7d20\\u503c \\u6ca1\\u6709\\u4e86\\u5c31\\u8fd4\\u56denull\\n- \\u963b\\u585e\\u5f0f\\u7684\\u5217\\u8868\\u5f39\\u51fa\\u547d\\u4ee4(block) `\\u961f\\u5217\\u5f88\\u6709\\u7528`\\n    - `blpop`\\n    - `brpop`\\n    - `bpoplpush`\\n    - `brpoplpush` \\u963b\\u585e\\u5f0f\\u5148\\u53f3\\u5f39\\u518d\\u5de6\\u8fdb\\n- `lrange key 0 -1` \\u53d6\\u6307\\u5b9a\\u957f\\u5ea6\\u7684list -1\\u8868\\u793a\\u5168\\u90e8\\n- `ltrim key 0 2` \\u622a\\u53d6\\u5f53\\u524d\\u7684list\\n- `lindex key offset`   \\u8fd4\\u56de\\u504f\\u79fb\\u91cf\\u4e3aoffset\\u7684\\u5143\\u7d20\\n- `LINSERT key BEFORE|AFTER pivot value` \\u5c06\\u503c value \\u63d2\\u5165\\u5230\\u5217\\u8868 key \\u5f53\\u4e2d\\uff0c\\u4f4d\\u4e8e\\u503c pivot \\u4e4b\\u524d\\u6216\\u4e4b\\u540e\\u3002\\n    - \\u5f53 pivot \\u4e0d\\u5b58\\u5728\\u4e8e\\u5217\\u8868 key \\u65f6\\uff0c\\u4e0d\\u6267\\u884c\\u4efb\\u4f55\\u64cd\\u4f5c\\u3002\\u5f53 key \\u4e0d\\u5b58\\u5728\\u65f6\\uff0c key \\u88ab\\u89c6\\u4e3a\\u7a7a\\u5217\\u8868\\uff0c\\u4e0d\\u6267\\u884c\\u4efb\\u4f55\\u64cd\\u4f5c\\u3002\\u5982\\u679c key \\u4e0d\\u662f\\u5217\\u8868\\u7c7b\\u578b\\uff0c\\u8fd4\\u56de\\u4e00\\u4e2a\\u9519\\u8bef\\u3002\\n- `LREM key count value` \\u6839\\u636e\\u53c2\\u6570 count \\u7684\\u503c\\uff0c\\u79fb\\u9664\\u5217\\u8868\\u4e2d\\u4e0e\\u53c2\\u6570 value \\u76f8\\u7b49\\u7684\\u5143\\u7d20\\u3002\\n\\n#### \\u96c6\\u5408 set\\n- `SADD key member [member ...]`\\n- `SCARD key` \\u8fd4\\u56de\\u96c6\\u5408 key \\u7684\\u57fa\\u6570(\\u96c6\\u5408\\u4e2d\\u5143\\u7d20\\u7684\\u6570\\u91cf)\\u3002\\n- `SDIFF key [key ...]`  \\u8fd4\\u56de\\u4e00\\u4e2a\\u96c6\\u5408\\u7684\\u5168\\u90e8\\u6210\\u5458\\uff0c\\u8be5\\u96c6\\u5408\\u662f\\u6240\\u6709\\u7ed9\\u5b9a\\u96c6\\u5408\\u4e4b\\u95f4\\u7684\\u5dee\\u96c6\\u3002\\u4e0d\\u5b58\\u5728\\u7684 key \\u88ab\\u89c6\\u4e3a\\u7a7a\\u96c6\\u3002\\n- `SDIFFSTORE destination key [key ...]`  \\u8fd9\\u4e2a\\u547d\\u4ee4\\u7684\\u4f5c\\u7528\\u548c SDIFF \\u7c7b\\u4f3c\\uff0c\\u4f46\\u5b83\\u5c06\\u7ed3\\u679c\\u4fdd\\u5b58\\u5230 destination \\u96c6\\u5408\\uff0c\\u800c\\u4e0d\\u662f\\u7b80\\u5355\\u5730\\u8fd4\\u56de\\u7ed3\\u679c\\u96c6\\u3002\\u5982\\u679c destination \\u96c6\\u5408\\u5df2\\u7ecf\\u5b58\\u5728\\uff0c\\u5219\\u5c06\\u5176\\u8986\\u76d6\\u3002destination \\u53ef\\u4ee5\\u662f key \\u672c\\u8eab\\u3002\\n- `SINTER key [key ...]` \\u8fd4\\u56de\\u4e00\\u4e2a\\u96c6\\u5408\\u7684\\u5168\\u90e8\\u6210\\u5458\\uff0c\\u8be5\\u96c6\\u5408\\u662f\\u6240\\u6709\\u7ed9\\u5b9a\\u96c6\\u5408\\u7684\\u4ea4\\u96c6\\u3002\\u4e0d\\u5b58\\u5728\\u7684 key \\u88ab\\u89c6\\u4e3a\\u7a7a\\u96c6\\u3002\\u5f53\\u7ed9\\u5b9a\\u96c6\\u5408\\u5f53\\u4e2d\\u6709\\u4e00\\u4e2a\\u7a7a\\u96c6\\u65f6\\uff0c\\u7ed3\\u679c\\u4e5f\\u4e3a\\u7a7a\\u96c6(\\u6839\\u636e\\u96c6\\u5408\\u8fd0\\u7b97\\u5b9a\\u5f8b)\\u3002\\n- `SINTERSTORE destination key [key ...]` \\u4e0esdiffstore\\u7c7b\\u4f3c\\n- `SISMEMBER key member` \\u5224\\u65ad member \\u5143\\u7d20\\u662f\\u5426\\u96c6\\u5408 key \\u7684\\u6210\\u5458\\u3002\\n- `SMEMBERS key` \\n- `SMOVE source destination member` \\u5c06 member \\u5143\\u7d20\\u4ece source \\u96c6\\u5408\\u79fb\\u52a8\\u5230 destination \\u96c6\\u5408\\u3002 SMOVE \\u662f\\u539f\\u5b50\\u6027\\u64cd\\u4f5c\\u3002\\n- `SPOP key` \\u79fb\\u9664\\u5e76\\u8fd4\\u56de\\u96c6\\u5408\\u4e2d\\u7684\\u4e00\\u4e2a\\u968f\\u673a\\u5143\\u7d20\\n- `SRANDMEMBER key [count]` \\u5982\\u679c\\u547d\\u4ee4\\u6267\\u884c\\u65f6\\uff0c\\u53ea\\u63d0\\u4f9b\\u4e86 key \\u53c2\\u6570\\uff0c\\u90a3\\u4e48\\u8fd4\\u56de\\u96c6\\u5408\\u4e2d\\u7684\\u4e00\\u4e2a\\u968f\\u673a\\u5143\\u7d20\\n- `SREM key member [member ...]` \\u79fb\\u9664\\u96c6\\u5408 key \\u4e2d\\u7684\\u4e00\\u4e2a\\u6216\\u591a\\u4e2a member \\u5143\\u7d20\\uff0c\\u4e0d\\u5b58\\u5728\\u7684 member \\u5143\\u7d20\\u4f1a\\u88ab\\u5ffd\\u7565\\u3002\\n- `SUNION key [key ...]` \\u8fd4\\u56de\\u4e00\\u4e2a\\u96c6\\u5408\\u7684\\u5168\\u90e8\\u6210\\u5458\\uff0c\\u8be5\\u96c6\\u5408\\u662f\\u6240\\u6709\\u7ed9\\u5b9a\\u96c6\\u5408\\u7684\\u5e76\\u96c6\\u3002\\n- `SUNIONSTORE destination key [key ...]`\\n- `SSCAN key cursor [MATCH pattern] [COUNT count]` \\u53c2\\u8003 SCAN \\u547d\\u4ee4\\n\\n#### \\u6709\\u5e8f\\u96c6\\u5408 zset\\n\\n- ZADD\\n- ZCARD\\n- ZCOUNT\\n- ZINCRBY\\n- ZRANGE\\n- ZRANGEBYSCORE\\n- ZRANK\\n- ZREM\\n- ZREMRANGEBYRANK\\n- ZREMRANGEBYSCORE\\n- ZREVRANGE\\n- ZREVRANGEBYSCORE\\n- ZREVRANK\\n- ZSCORE\\n- ZUNIONSTORE\\n- ZINTERSTORE\\n- ZSCAN\\n- ZRANGEBYLEX\\n- ZLEXCOUNT\\n- ZREMRANGEBYLEX\\n\\n#### \\u6563\\u5217 hash\\n\\n- HDEL\\n- HEXISTS\\n- HGET\\n- HGETALL\\n- HINCRBY\\n- HINCRBYFLOAT\\n- HKEYS\\n- HLEN\\n- HMGET\\n- HMSET\\n- HSET\\n- HSETNX\\n- HVALS\\n- HSCAN\\n- HSTRLEN\\n\\n#### HyperLogLog\\nPFADD\\nPFCOUNT\\nPFMERGE\\n\\n#### GEO\\u3010\\u5730\\u7406\\u4f4d\\u7f6e\\u3011\\nGEOADD\\nGEOPOS\\nGEODIST\\nGEORADIUS\\nGEORADIUSBYMEMBER\\nGEOHASH\\n\\n***************\\n### Pub\\/Sub\\u53d1\\u5e03\\u8ba2\\u9605\\n\\n- `PSUBSCRIBE pattern [pattern ...]`\\n    - \\u8ba2\\u9605\\u4e00\\u4e2a\\u6216\\u591a\\u4e2a\\u7b26\\u5408\\u7ed9\\u5b9a\\u6a21\\u5f0f\\u7684\\u9891\\u9053\\u3002\\u6bcf\\u4e2a\\u6a21\\u5f0f\\u4ee5 * \\u4f5c\\u4e3a\\u5339\\u914d\\u7b26\\uff0c\\u6bd4\\u5982 it* \\u5339\\u914d\\u6240\\u6709\\u4ee5 it \\u5f00\\u5934\\u7684\\u9891\\u9053( it.news \\u3001 it.blog \\u3001 it.tweets \\u7b49\\u7b49)\\uff0c\\n    -  news.* \\u5339\\u914d\\u6240\\u6709\\u4ee5 news. \\u5f00\\u5934\\u7684\\u9891\\u9053( news.it \\u3001 news.global.today \\u7b49\\u7b49)\\uff0c\\u8bf8\\u5982\\u6b64\\u7c7b\\u3002\\n- `PUBLISH channel message`\\n    - \\u5c06\\u4fe1\\u606f message \\u53d1\\u9001\\u5230\\u6307\\u5b9a\\u7684\\u9891\\u9053 channel \\u3002\\n- `PUBSUB <subcommand> [argument [argument ...]]`\\n    - PUBSUB \\u662f\\u4e00\\u4e2a\\u67e5\\u770b\\u8ba2\\u9605\\u4e0e\\u53d1\\u5e03\\u7cfb\\u7edf\\u72b6\\u6001\\u7684\\u5185\\u7701\\u547d\\u4ee4\\uff0c \\u5b83\\u7531\\u6570\\u4e2a\\u4e0d\\u540c\\u683c\\u5f0f\\u7684\\u5b50\\u547d\\u4ee4\\u7ec4\\u6210\\uff0c \\u4ee5\\u4e0b\\u5c06\\u5206\\u522b\\u5bf9\\u8fd9\\u4e9b\\u5b50\\u547d\\u4ee4\\u8fdb\\u884c\\u4ecb\\u7ecd\\u3002\\n    - `PUBSUB CHANNELS [pattern]` \\u5217\\u51fa\\u5f53\\u524d\\u7684\\u6d3b\\u8dc3\\u9891\\u9053\\u3002\\u8bbe\\u7f6epattern\\u53c2\\u6570\\u5c31\\u4f1a\\u5339\\u914d\\u6d3b\\u8dc3\\u9891\\u9053\\uff0c\\u5426\\u5219\\u662f\\u5217\\u51fa\\u6240\\u6709\\u9891\\u9053\\n    - `PUBSUB NUMSUB [channel-1 ... channel-N]` \\u8fd4\\u56de\\u7ed9\\u5b9a\\u9891\\u9053\\u7684\\u8ba2\\u9605\\u8005\\u6570\\u91cf\\uff0c \\u8ba2\\u9605\\u6a21\\u5f0f\\u7684\\u5ba2\\u6237\\u7aef\\u4e0d\\u8ba1\\u7b97\\u5728\\u5185\\u3002\\n    - `PUBSUB NUMPAT` \\u8fd4\\u56de\\u8ba2\\u9605\\u6a21\\u5f0f\\u7684\\u6570\\u91cf\\u3002\\u6ce8\\u610f\\uff0c \\u8fd9\\u4e2a\\u547d\\u4ee4\\u8fd4\\u56de\\u7684\\u4e0d\\u662f\\u8ba2\\u9605\\u6a21\\u5f0f\\u7684\\u5ba2\\u6237\\u7aef\\u7684\\u6570\\u91cf\\uff0c \\u800c\\u662f\\u5ba2\\u6237\\u7aef\\u8ba2\\u9605\\u7684\\u6240\\u6709\\u6a21\\u5f0f\\u7684\\u6570\\u91cf\\u603b\\u548c\\u3002\\n- `PUNSUBSCRIBE [pattern [pattern ...]]`\\n    - \\u6307\\u793a\\u5ba2\\u6237\\u7aef\\u9000\\u8ba2\\u6240\\u6709\\u7ed9\\u5b9a\\u6a21\\u5f0f\\u3002\\u5982\\u679c\\u6ca1\\u6709\\u6a21\\u5f0f\\u88ab\\u6307\\u5b9a\\uff0c\\u4e5f\\u5373\\u662f\\uff0c\\u4e00\\u4e2a\\u65e0\\u53c2\\u6570\\u7684 PUNSUBSCRIBE \\u8c03\\u7528\\u88ab\\u6267\\u884c\\uff0c\\n    - \\u90a3\\u4e48\\u5ba2\\u6237\\u7aef\\u4f7f\\u7528 PSUBSCRIBE \\u547d\\u4ee4\\u8ba2\\u9605\\u7684\\u6240\\u6709\\u6a21\\u5f0f\\u90fd\\u4f1a\\u88ab\\u9000\\u8ba2\\u3002\\u5728\\u8fd9\\u79cd\\u60c5\\u51b5\\u4e0b\\uff0c\\u547d\\u4ee4\\u4f1a\\u8fd4\\u56de\\u4e00\\u4e2a\\u4fe1\\u606f\\uff0c\\u544a\\u77e5\\u5ba2\\u6237\\u7aef\\u6240\\u6709\\u88ab\\u9000\\u8ba2\\u7684\\u6a21\\u5f0f\\u3002\\n- `SUBSCRIBE channel [channel ...]`\\n    - \\u8ba2\\u9605\\u7ed9\\u5b9a\\u7684\\u4e00\\u4e2a\\u6216\\u591a\\u4e2a\\u9891\\u9053\\u7684\\u4fe1\\u606f\\u3002\\n- `UNSUBSCRIBE [channel [channel ...]]`\\n    - \\u6307\\u793a\\u5ba2\\u6237\\u7aef\\u9000\\u8ba2\\u7ed9\\u5b9a\\u7684\\u9891\\u9053\\u3002\\u5982\\u679c\\u6ca1\\u6709\\u9891\\u9053\\u88ab\\u6307\\u5b9a\\uff0c\\u4e5f\\u5373\\u662f\\uff0c\\u4e00\\u4e2a\\u65e0\\u53c2\\u6570\\u7684 UNSUBSCRIBE \\u8c03\\u7528\\u88ab\\u6267\\u884c\\uff0c\\n    - \\u90a3\\u4e48\\u5ba2\\u6237\\u7aef\\u4f7f\\u7528 SUBSCRIBE \\u547d\\u4ee4\\u8ba2\\u9605\\u7684\\u6240\\u6709\\u9891\\u9053\\u90fd\\u4f1a\\u88ab\\u9000\\u8ba2\\u3002\\u5728\\u8fd9\\u79cd\\u60c5\\u51b5\\u4e0b\\uff0c\\u547d\\u4ee4\\u4f1a\\u8fd4\\u56de\\u4e00\\u4e2a\\u4fe1\\u606f\\uff0c\\u544a\\u77e5\\u5ba2\\u6237\\u7aef\\u6240\\u6709\\u88ab\\u9000\\u8ba2\\u7684\\u9891\\u9053\\u3002\\n\\n**************\\n### \\u4e8b\\u52a1\\n\\n- `DISCARD` \\u53d6\\u6d88\\u4e8b\\u52a1\\uff0c\\u653e\\u5f03\\u6267\\u884c\\u4e8b\\u52a1\\u5757\\u5185\\u7684\\u6240\\u6709\\u547d\\u4ee4\\u3002\\n- `EXEC`\\n    - \\u6267\\u884c\\u6240\\u6709\\u4e8b\\u52a1\\u5757\\u5185\\u7684\\u547d\\u4ee4\\u3002\\u5047\\u5982\\u67d0\\u4e2a(\\u6216\\u67d0\\u4e9b) key \\u6b63\\u5904\\u4e8e WATCH \\u547d\\u4ee4\\u7684\\u76d1\\u89c6\\u4e4b\\u4e0b\\uff0c\\u4e14\\u4e8b\\u52a1\\u5757\\u4e2d\\u6709\\u548c\\u8fd9\\u4e2a(\\u6216\\u8fd9\\u4e9b) key \\u76f8\\u5173\\u7684\\u547d\\u4ee4\\uff0c\\n    - \\u90a3\\u4e48 EXEC \\u547d\\u4ee4\\u53ea\\u5728\\u8fd9\\u4e2a(\\u6216\\u8fd9\\u4e9b) key \\u6ca1\\u6709\\u88ab\\u5176\\u4ed6\\u547d\\u4ee4\\u6240\\u6539\\u52a8\\u7684\\u60c5\\u51b5\\u4e0b\\u6267\\u884c\\u5e76\\u751f\\u6548\\uff0c\\u5426\\u5219\\u8be5\\u4e8b\\u52a1\\u88ab\\u6253\\u65ad(abort)\\u3002\\n- `MULTI` \\u6807\\u8bb0\\u4e00\\u4e2a\\u4e8b\\u52a1\\u5757\\u7684\\u5f00\\u59cb\\u3002\\u4e8b\\u52a1\\u5757\\u5185\\u7684\\u591a\\u6761\\u547d\\u4ee4\\u4f1a\\u6309\\u7167\\u5148\\u540e\\u987a\\u5e8f\\u88ab\\u653e\\u8fdb\\u4e00\\u4e2a\\u961f\\u5217\\u5f53\\u4e2d\\uff0c\\u6700\\u540e\\u7531 EXEC \\u547d\\u4ee4\\u539f\\u5b50\\u6027(atomic)\\u5730\\u6267\\u884c\\u3002\\n- `UNWATCH` \\n    - \\u53d6\\u6d88 WATCH \\u547d\\u4ee4\\u5bf9\\u6240\\u6709 key \\u7684\\u76d1\\u89c6\\u3002\\u5982\\u679c\\u5728\\u6267\\u884c WATCH \\u547d\\u4ee4\\u4e4b\\u540e\\uff0c EXEC \\u547d\\u4ee4\\u6216 DISCARD \\u547d\\u4ee4\\u5148\\u88ab\\u6267\\u884c\\u4e86\\u7684\\u8bdd\\uff0c\\u90a3\\u4e48\\u5c31\\u4e0d\\u9700\\u8981\\u518d\\u6267\\u884c UNWATCH \\u4e86\\u3002\\n    - \\u56e0\\u4e3a EXEC \\u547d\\u4ee4\\u4f1a\\u6267\\u884c\\u4e8b\\u52a1\\uff0c\\u56e0\\u6b64 WATCH \\u547d\\u4ee4\\u7684\\u6548\\u679c\\u5df2\\u7ecf\\u4ea7\\u751f\\u4e86\\uff1b\\u800c DISCARD \\u547d\\u4ee4\\u5728\\u53d6\\u6d88\\u4e8b\\u52a1\\u7684\\u540c\\u65f6\\u4e5f\\u4f1a\\u53d6\\u6d88\\u6240\\u6709\\u5bf9 key \\u7684\\u76d1\\u89c6\\uff0c\\u56e0\\u6b64\\u8fd9\\u4e24\\u4e2a\\u547d\\u4ee4\\u6267\\u884c\\u4e4b\\u540e\\uff0c\\u5c31\\u6ca1\\u6709\\u5fc5\\u8981\\u6267\\u884c UNWATCH \\u4e86\\u3002\\n- `WATCH key [key ...]`\\n    - \\u76d1\\u89c6\\u4e00\\u4e2a(\\u6216\\u591a\\u4e2a) key \\uff0c\\u5982\\u679c\\u5728\\u4e8b\\u52a1\\u6267\\u884c\\u4e4b\\u524d\\u8fd9\\u4e2a(\\u6216\\u8fd9\\u4e9b) key \\u88ab\\u5176\\u4ed6\\u547d\\u4ee4\\u6240\\u6539\\u52a8\\uff0c\\u90a3\\u4e48\\u4e8b\\u52a1\\u5c06\\u88ab\\u6253\\u65ad\\u3002\\n\\n*************\\n### \\u670d\\u52a1\\u5668\\n\\nBGREWRITEAOF\\nBGSAVE\\nCLIENT GETNAME\\nCLIENT KILL\\nCLIENT LIST\\nCLIENT SETNAME\\nCONFIG GET\\nCONFIG RESETSTAT\\nCONFIG REWRITE\\nCONFIG SET\\nDBSIZE\\nDEBUG OBJECT\\nDEBUG SEGFAULT\\nFLUSHALL\\nFLUSHDB\\nINFO\\nLASTSAVE\\nMONITOR\\nPSYNC\\nSAVE\\nSHUTDOWN\\nSLAVEOF\\nSLOWLOG\\nSYNC\\nTIME\\n\\n*****************************\\n\\t\\n### Run Configuration\\t\\n- *slaveof*\\n    - `redis-server --port 9999 --slaveof 127.0.0.1 6379` \\u542f\\u52a8\\u4e00\\u4e2a9999\\u7aef\\u53e3\\u4f5c\\u4e3a6379\\u7684\\u4ece\\u670d\\u52a1\\u5668\\u8fdb\\u884c\\u540c\\u6b65\\n    - \\u6216\\u8005\\u670d\\u52a1\\u542f\\u52a8\\u540e\\u6267\\u884c `slaveof host port`\\uff08\\u5982\\u679c\\u5df2\\u7ecf\\u662f\\u4ece\\u670d\\u52a1\\u5668\\uff0c\\u5c31\\u4e22\\u53bb\\u65e7\\u670d\\u52a1\\u5668\\u7684\\u6570\\u636e\\u96c6\\uff0c\\u8f6c\\u800c\\u5bf9\\u65b0\\u7684\\u4e3b\\u670d\\u52a1\\u5668\\u8fdb\\u884c\\u540c\\u6b65\\uff09\\n    - \\u4ece\\u670d\\u52a1\\u53d8\\u6210\\u4e3b\\u670d\\u52a1 `slaveof no one` (\\u540c\\u6b65\\u7684\\u6570\\u636e\\u96c6\\u4e0d\\u4f1a\\u4e22\\u5931\\uff0c\\u8fc5\\u901f\\u66ff\\u6362\\u4e3b\\u670d\\u52a1\\u5668)\\n- *loglevel*\\n    - `.\\/redis-server \\/etc\\/redis\\/6379.conf --loglevel debug\\t`\\n\\n### \\u6570\\u636e\\u5b89\\u5168\\u548c\\u6027\\u80fd\\n#### \\u6301\\u4e45\\u5316\\u7b56\\u7565\\n#### \\u590d\\u5236\\n\\n#### \\u6570\\u636e\\u8fc1\\u79fb\\n- \\u4f7f\\u7528\\u4e3b\\u4ece\\u590d\\u5236\\u6765\\u8fdb\\u884c\\u6570\\u636e\\n\\n*******\\n## \\u3010Redis\\u7684\\u4f7f\\u7528\\u3011\\n### \\u4f5c\\u4e3a\\u65e5\\u5fd7\\u8bb0\\u5f55\\n### \\u4f5c\\u4e3a\\u7f51\\u7ad9\\u7edf\\u8ba1\\u6570\\u636e\\n### \\u5b58\\u50a8\\u914d\\u7f6e\\u4fe1\\u606f\\n### \\u81ea\\u52a8\\u8865\\u5168\\n- \\u641c\\u7d22\\u5efa\\u8bae\\n\\n### \\u6784\\u5efa\\u9501\\n\\n### \\u4efb\\u52a1\\u961f\\u5217\\n- \\u53d1\\u9001\\u90ae\\u4ef6\\n\\n***************************\\n### \\u3010Java\\u4f7f\\u7528redis\\u3011\\n- maven\\u4f9d\\u8d56(Spring 4.1.7)\\uff1a\\n```xml\\n    <dependency>\\n        <groupId>org.springframework.data<\\/groupId>\\n        <artifactId>spring-data-redis<\\/artifactId>\\n        <version>1.6.0.RELEASE<\\/version>\\n    <\\/dependency>\\n    <dependency>\\n        <groupId>redis.clients<\\/groupId>\\n        <artifactId>jedis<\\/artifactId>\\n        <version>2.9.0<\\/version>\\n        <type>jar<\\/type>\\n    <scope>compile<\\/scope>\\n    <\\/dependency>\\n    <dependency>\\n        <groupId>org.apache.commons<\\/groupId>\\n        <artifactId>commons-lang3<\\/artifactId>\\n        <version>3.3.2<\\/version>\\n    <\\/dependency>\\n```\\n`Spring\\u914d\\u7f6e\\u6587\\u4ef6`\\n```xml\\n    <!--\\n        \\u52a0\\u8f7dredis\\u914d\\u7f6e\\u6587\\u4ef6 \\n        \\u5982\\u679c\\u5df2\\u7ecf\\u52a0\\u8f7d\\u4e86\\u4e00\\u4e2a\\u6587\\u4ef6\\uff0c\\u90a3\\u4e48\\u7b2c\\u4e00\\u4e2a\\u5c31\\u8981\\u5199\\u8fd9\\u4e2a\\u914d\\u7f6e\\u9879\\uff0c\\n        <property name=\\"ignoreUnresolvablePlaceholders\\" value=\\"true\\"\\/>\\n        \\u7b2c\\u4e8c\\u4e2a\\u8981\\u52a0 \\u540e\\u9762\\u7684\\u914d\\u7f6e \\n        \\u4e0d\\u7136\\u5c31\\u53ea\\u4f1a\\u52a0\\u8f7d\\u524d\\u9762\\u90a3\\u4e2a\\u6587\\u4ef6\\n    -->\\n    <context:property-placeholder location=\\"classpath:redis.properties\\" ignore-unresolvable=\\"true\\"\\/>\\n    <!-- redis\\u8fde\\u63a5\\u6c60\\u7684\\u914d\\u7f6e -->\\n    <bean id=\\"jedisPoolConfig\\" class=\\"redis.clients.jedis.JedisPoolConfig\\">\\n        <property name=\\"maxActive\\" value=\\"${redis.pool.maxActive}\\"\\/>\\n        <property name=\\"maxIdle\\" value=\\"${redis.pool.maxIdle}\\"\\/>\\n        <property name=\\"minIdle\\" value=\\"${redis.pool.minIdle}\\"\\/>\\n        <property name=\\"maxWait\\" value=\\"${redis.pool.maxWait}\\"\\/>\\n        <property name=\\"testOnBorrow\\" value=\\"${redis.pool.testOnBorrow}\\"\\/>\\n        <property name=\\"testOnReturn\\" value=\\"${redis.pool.testOnReturn}\\"\\/>\\n    <\\/bean>\\n    <!-- redis\\u7684\\u8fde\\u63a5\\u6c60pool\\uff0c\\u4e0d\\u662f\\u5fc5\\u9009\\u9879\\uff1atimeout\\/password  -->\\n    <bean id = \\"jedisPool\\" class=\\"redis.clients.jedis.JedisPool\\">\\n        <constructor-arg index=\\"0\\" ref=\\"jedisPoolConfig\\"\\/>\\n        <constructor-arg index=\\"1\\" value=\\"${redis.host}\\"\\/>\\n        <constructor-arg index=\\"2\\" value=\\"${redis.port}\\" type=\\"int\\"\\/>\\n        <constructor-arg index=\\"3\\" value=\\"${redis.timeout}\\" type=\\"int\\"\\/>\\n        <constructor-arg index=\\"4\\" value=\\"${redis.password}\\"\\/>\\n    <\\/bean>\\n```\\n\\n- java\\u5b9e\\u9645\\u6d4b\\u8bd5\\u7c7b[JedisUtilsTest.java](https:\\/\\/github.com\\/Kuangcp\\/Maven_SSM\\/blob\\/master\\/src\\/test\\/java\\/redis\\/JedisUtilTest.java)\\n\\n- jedis \\u4f7f\\u7528\\u540e\\u8981disconnect\\u91ca\\u653e\\u8fde\\u63a5,\\u6700\\u65b0\\u7248\\u672cclose\\u5c31\\u4e0d\\u7528\\u4e86\\uff0c\\u4f7f\\u7528\\u8fde\\u63a5\\u6c60\\u5c31\\u4e0d\\u7528\\n- jedis \\u7684\\u4e8b\\u52a1 \\u4f7f\\u7528exec\\u91ca\\u653e\\u4e8b\\u52a1\\n\\n### jedis\\u9047\\u5230\\u7684\\u5f02\\u5e38\\n- Invocation of init method failed; nested exception is java.lang.NoSuchMethodError: org.springframework.core.serializer.support.DeserializingConverter\\n- \\u7248\\u672c\\u5bf9\\u4e0d\\u4e0a\\uff0c\\u8981Spring\\u548cSpring-data-redis \\u548c redis\\u548ccommons-lang3\\u5bf9\\u5e94\\n- \\u76ee\\u524d\\u662f4.1.7 + 1.6.0 + 2.9.0 + 3.3.2 \\u7f16\\u8bd1\\u901a\\u8fc7\\u4e86\\t\\n\\n### SpringBoot\\u4f7f\\u7528Redis\\n[SpringBoot\\u914d\\u7f6eRedis](\\/Java\\/Spring\\/SpringBootDatabase.md)","html":"<p><code>\\u76ee\\u5f55 start<\\/code><\\/p>\\n<ul>\\n<li><a href=\\"#redis\\">Redis<\\/a>\\n<ul>\\n<li><a href=\\"#windows\\u4e0a\\u7684\\u57fa\\u672c\\u914d\\u7f6e\\">\\u3010windows\\u4e0a\\u7684\\u57fa\\u672c\\u914d\\u7f6e\\u3011<\\/a><\\/li>\\n<li><a href=\\"#linux\\u4e0b\\u7684\\u4f7f\\u7528\\">Linux\\u4e0b\\u7684\\u4f7f\\u7528<\\/a>\\n<ul>\\n<li><a href=\\"#\\u547d\\u4ee4\\u5b89\\u88c5\\">\\u547d\\u4ee4\\u5b89\\u88c5<\\/a><\\/li>\\n<li><a href=\\"#\\u89e3\\u538b\\u5373\\u7528\\">\\u89e3\\u538b\\u5373\\u7528<\\/a><\\/li>\\n<\\/ul><\\/li>\\n<li><a href=\\"#docker\\u5b89\\u88c5redis\\">docker\\u5b89\\u88c5redis<\\/a><\\/li>\\n<li><a href=\\"#redis\\u914d\\u7f6e\\u6587\\u4ef6\\">redis\\u914d\\u7f6e\\u6587\\u4ef6<\\/a><\\/li>\\n<li><a href=\\"#redis\\u547d\\u4ee4\\u884c\\u5e38\\u89c4\\u4f7f\\u7528\\">Redis\\u547d\\u4ee4\\u884c\\u5e38\\u89c4\\u4f7f\\u7528<\\/a>\\n<ul>\\n<li><a href=\\"#\\u5e38\\u7528\\u7684\\u6570\\u636e\\u7c7b\\u578b\\u64cd\\u4f5c\\">\\u5e38\\u7528\\u7684\\u6570\\u636e\\u7c7b\\u578b\\u64cd\\u4f5c<\\/a>\\n<ul>\\n<li><a href=\\"#\\u8fc7\\u671f\\u7b56\\u7565\\">\\u8fc7\\u671f\\u7b56\\u7565<\\/a><\\/li>\\n<\\/ul><\\/li>\\n<li><a href=\\"#\\u5404\\u6570\\u636e\\u7c7b\\u578b\\u7684\\u9ad8\\u7ea7\\u64cd\\u4f5c\\">\\u5404\\u6570\\u636e\\u7c7b\\u578b\\u7684\\u9ad8\\u7ea7\\u64cd\\u4f5c<\\/a>\\n<ul>\\n<li><a href=\\"#\\u5b57\\u7b26\\u4e32-string\\">\\u5b57\\u7b26\\u4e32 String<\\/a><\\/li>\\n<li><a href=\\"#\\u5217\\u8868-list\\">\\u5217\\u8868 list<\\/a><\\/li>\\n<li><a href=\\"#\\u96c6\\u5408-set\\">\\u96c6\\u5408 set<\\/a><\\/li>\\n<li><a href=\\"#\\u6709\\u5e8f\\u96c6\\u5408-zset\\">\\u6709\\u5e8f\\u96c6\\u5408 zset<\\/a><\\/li>\\n<li><a href=\\"#\\u6563\\u5217-hash\\">\\u6563\\u5217 hash<\\/a><\\/li>\\n<li><a href=\\"#hyperloglog\\">HyperLogLog<\\/a><\\/li>\\n<li><a href=\\"#geo\\u5730\\u7406\\u4f4d\\u7f6e\\">GEO\\u3010\\u5730\\u7406\\u4f4d\\u7f6e\\u3011<\\/a><\\/li>\\n<\\/ul><\\/li>\\n<li><a href=\\"#pubsub\\u53d1\\u5e03\\u8ba2\\u9605\\">Pub\\/Sub\\u53d1\\u5e03\\u8ba2\\u9605<\\/a><\\/li>\\n<li><a href=\\"#\\u4e8b\\u52a1\\">\\u4e8b\\u52a1<\\/a><\\/li>\\n<li><a href=\\"#\\u670d\\u52a1\\u5668\\">\\u670d\\u52a1\\u5668<\\/a><\\/li>\\n<li><a href=\\"#run-configuration\\">Run Configuration<\\/a><\\/li>\\n<li><a href=\\"#\\u6570\\u636e\\u5b89\\u5168\\u548c\\u6027\\u80fd\\">\\u6570\\u636e\\u5b89\\u5168\\u548c\\u6027\\u80fd<\\/a>\\n<ul>\\n<li><a href=\\"#\\u6301\\u4e45\\u5316\\u7b56\\u7565\\">\\u6301\\u4e45\\u5316\\u7b56\\u7565<\\/a><\\/li>\\n<li><a href=\\"#\\u590d\\u5236\\">\\u590d\\u5236<\\/a><\\/li>\\n<li><a href=\\"#\\u6570\\u636e\\u8fc1\\u79fb\\">\\u6570\\u636e\\u8fc1\\u79fb<\\/a><\\/li>\\n<\\/ul><\\/li>\\n<\\/ul><\\/li>\\n<li><a href=\\"#redis\\u7684\\u4f7f\\u7528\\">\\u3010Redis\\u7684\\u4f7f\\u7528\\u3011<\\/a>\\n<ul>\\n<li><a href=\\"#\\u4f5c\\u4e3a\\u65e5\\u5fd7\\u8bb0\\u5f55\\">\\u4f5c\\u4e3a\\u65e5\\u5fd7\\u8bb0\\u5f55<\\/a><\\/li>\\n<li><a href=\\"#\\u4f5c\\u4e3a\\u7f51\\u7ad9\\u7edf\\u8ba1\\u6570\\u636e\\">\\u4f5c\\u4e3a\\u7f51\\u7ad9\\u7edf\\u8ba1\\u6570\\u636e<\\/a><\\/li>\\n<li><a href=\\"#\\u5b58\\u50a8\\u914d\\u7f6e\\u4fe1\\u606f\\">\\u5b58\\u50a8\\u914d\\u7f6e\\u4fe1\\u606f<\\/a><\\/li>\\n<li><a href=\\"#\\u81ea\\u52a8\\u8865\\u5168\\">\\u81ea\\u52a8\\u8865\\u5168<\\/a><\\/li>\\n<li><a href=\\"#\\u6784\\u5efa\\u9501\\">\\u6784\\u5efa\\u9501<\\/a><\\/li>\\n<li><a href=\\"#\\u4efb\\u52a1\\u961f\\u5217\\">\\u4efb\\u52a1\\u961f\\u5217<\\/a><\\/li>\\n<li><a href=\\"#java\\u4f7f\\u7528redis\\">\\u3010Java\\u4f7f\\u7528redis\\u3011<\\/a><\\/li>\\n<li><a href=\\"#jedis\\u9047\\u5230\\u7684\\u5f02\\u5e38\\">jedis\\u9047\\u5230\\u7684\\u5f02\\u5e38<\\/a><\\/li>\\n<li><a href=\\"#springboot\\u4f7f\\u7528redis\\">SpringBoot\\u4f7f\\u7528Redis<\\/a><\\/li>\\n<\\/ul><\\/li>\\n<\\/ul><\\/li>\\n<\\/ul>\\n<p><code>\\u76ee\\u5f55 end<\\/code> <em>\\u76ee\\u5f55\\u521b\\u5efa\\u4e8e2018-02-02<\\/em> | \\u66f4\\u591a: <a href=\\"http:\\/\\/blog.csdn.net\\/kcp606\\">CSDN<\\/a> | <a href=\\"https:\\/\\/my.oschina.net\\/kcp1104\\">oschina<\\/a> | <a href=\\"https:\\/\\/gitee.com\\/kcp1104\\">\\u7801\\u4e91<\\/a> <\\/p>\\n<hr \\/>\\n<h1>Redis<\\/h1>\\n<blockquote>\\n<p><a href=\\"http:\\/\\/www.runoob.com\\/redis\\/redis-tutorial.html\\">Redis\\u6559\\u7a0b<\\/a><\\/p>\\n<\\/blockquote>\\n<h2>\\u3010windows\\u4e0a\\u7684\\u57fa\\u672c\\u914d\\u7f6e\\u3011<\\/h2>\\n<ul>\\n<li>\\u6ce8\\u518c\\u4e3a\\u670d\\u52a1\\n<ul>\\n<li><code>redis-server --service-install redis.windows.conf --loglevel verbose<\\/code><\\/li>\\n<\\/ul><\\/li>\\n<li>\\u4f7f\\u7528cmder\\n<ul>\\n<li>cmd \\u4e2d\\u8fd0\\u884c <code>E:\\/redis\\/redis-server.exe E:\\/redis\\/redis.windows.conf<\\/code><\\/li>\\n<\\/ul><\\/li>\\n<li>\\u914d\\u7f6e\\u5bc6\\u7801\\n<ul>\\n<li><code>requirepass redis1104<\\/code><\\/li>\\n<li>\\u5ba2\\u6237\\u7aef\\u767b\\u5f55 <code>auth redis1104<\\/code><\\/li>\\n<\\/ul><\\/li>\\n<\\/ul>\\n<h2>Linux\\u4e0b\\u7684\\u4f7f\\u7528<\\/h2>\\n<h3>\\u547d\\u4ee4\\u5b89\\u88c5<\\/h3>\\n<ul>\\n<li>\\u5b89\\u88c5 <code>apt install redis<\\/code><\\/li>\\n<li>\\u5f00\\u542f\\u6570\\u636e\\u5e93\\u670d\\u52a1 <code>redis-server<\\/code><\\/li>\\n<li>\\u6253\\u5f00\\u5ba2\\u6237\\u7aef <code>redis-cli<\\/code><\\/li>\\n<\\/ul>\\n<h3>\\u89e3\\u538b\\u5373\\u7528<\\/h3>\\n<blockquote>\\n<p><a href=\\"https:\\/\\/github.com\\/Kuangcp\\/Configs\\/tree\\/master\\/Database\\/redis\\">\\u4e0b\\u8f7d\\u6253\\u5305\\u597d\\u7684<\\/a><br \\/>\\n<code>\\u6b65\\u9aa4:<\\/code><\\/p>\\n<ul>\\n<li>\\u5b98\\u7f51\\u4e0b\\u8f7d\\u6e90\\u7801\\uff0c\\u6267\\u884c<code>make<\\/code>\\u8fdb\\u884c\\u7f16\\u8bd1\\uff0c\\u7f16\\u8bd1\\u5b8c\\u6210\\u540e\\uff0c\\u590d\\u5236src\\u76ee\\u5f55\\u4e2d\\u7684<code>redis-cli redis-server<\\/code>\\u5c31\\u53ef\\u4ee5\\u7528\\u4e86\\uff0credis-benchmark\\u53ef\\u9009\\uff0c\\u6d4b\\u6027\\u80fd<\\/li>\\n<li>\\u518d\\u590d\\u5236\\u4e0b\\u9762\\u7684\\u7b80\\u5316\\u914d\\u7f6e\\u6587\\u4ef6\\uff0c\\u6216\\u8005\\u4f7f\\u7528\\u6e90\\u7801\\u4e2d\\u6839\\u76ee\\u5f55\\u4e0b\\u7684\\u914d\\u7f6e\\u6587\\u4ef6\\u81ea\\u5df1\\u914d\\u7f6e\\u4e0b<\\/li>\\n<li><a href=\\"https:\\/\\/raw.githubusercontent.com\\/Kuangcp\\/Configs\\/master\\/Database\\/redis\\/simple_redis.conf\\">\\u7b80\\u5316\\u914d\\u7f6e\\u6587\\u4ef6<\\/a><\\/li>\\n<li>\\u518d\\u521b\\u5efa\\u4ee5\\u4e0b\\u4e24\\u4e2a\\u811a\\u672c\\u5c31\\u53ef\\u4ee5\\u4fbf\\u6377\\u7684\\u4f7f\\u7528redis\\u4e86<br \\/>\\n<code>server_redis.sh<\\/code>\\n<pre><code class=\\"language-sh\\">basepath=$(cd `dirname $0`; pwd)\\necho $basepath\\n$basepath\\/redis-server $basepath\\/redis.conf&gt;redis.log &amp;<\\/code><\\/pre>\\n<p><code>client_redis.sh<\\/code><\\/p>\\n<pre><code class=\\"language-sh\\">basepath=$(cd `dirname $0`; pwd)\\n$basepath\\/redis-cli -p 6379<\\/code><\\/pre><\\/li>\\n<\\/ul>\\n<\\/blockquote>\\n<h2>docker\\u5b89\\u88c5redis<\\/h2>\\n<ul>\\n<li><a href=\\"\\/Linux\\/Container\\/Docker_Soft.md\\">docker-install-redis<\\/a><\\/li>\\n<\\/ul>\\n<hr \\/>\\n<h2>redis\\u914d\\u7f6e\\u6587\\u4ef6<\\/h2>\\n<ul>\\n<li><a href=\\"https:\\/\\/github.com\\/Kuangcp\\/Configs\\/blob\\/master\\/Database\\/redis\\/explain_redis.conf\\">\\u914d\\u7f6e\\u6587\\u4ef6\\u8bb2\\u89e3<\\/a> | <a href=\\"https:\\/\\/github.com\\/Kuangcp\\/Configs\\/blob\\/master\\/Database\\/redis\\/redis.conf\\">\\u539f\\u59cb\\u914d\\u7f6e\\u6587\\u4ef6<\\/a><\\/li>\\n<li><code>\\u4f7f\\u7528ing<\\/code><a href=\\"https:\\/\\/github.com\\/Kuangcp\\/Configs\\/blob\\/master\\/Database\\/redis\\/simple_redis.conf\\">\\u7b80\\u5316\\u914d\\u7f6e\\u6587\\u4ef6<\\/a> <\\/li>\\n<\\/ul>\\n<hr \\/>\\n<h2>Redis\\u547d\\u4ee4\\u884c\\u5e38\\u89c4\\u4f7f\\u7528<\\/h2>\\n<h3>\\u5e38\\u7528\\u7684\\u6570\\u636e\\u7c7b\\u578b\\u64cd\\u4f5c<\\/h3>\\n<ul>\\n<li>\\n<p>\\u3010<code>\\u5b57\\u7b26\\u4e32<\\/code>\\u3011<\\/p>\\n<ul>\\n<li>get <\\/li>\\n<li>set<\\/li>\\n<li>del <\\/li>\\n<\\/ul>\\n<\\/li>\\n<li>\\n<p>\\u3010<code>list \\u5217\\u8868 (\\u7c7b\\u4f3c\\u961f\\u5217)<\\/code>\\u3011<\\/p>\\n<ul>\\n<li>rpush \\u53f3\\u5165\\u961f\\u5217\\uff0c\\u672b\\u7aef<\\/li>\\n<li>lpush \\u5de6<\\/li>\\n<li>lrange \\u83b7\\u53d6\\u8303\\u56f4 0\\uff0c-1 \\u8868\\u793a\\u83b7\\u53d6\\u5168\\u90e8<\\/li>\\n<li>lindex \\u83b7\\u53d6\\u6307\\u5b9aindex\\u7684\\u5143\\u7d20<\\/li>\\n<li>lpop \\u5de6\\u51fa\\u961f\\u5217<\\/li>\\n<li>rpop<\\/li>\\n<\\/ul>\\n<\\/li>\\n<li>\\n<p>\\u3010<code>set \\u96c6\\u5408 (\\u7c7b\\u4f3c\\u65e0\\u5e8f\\u7684Set)<\\/code>\\u3011<\\/p>\\n<ul>\\n<li>sadd \\u6dfb\\u52a0\\u4e00\\u4e2a\\u5bf9\\u8c61<code>asdd key member<\\/code><\\/li>\\n<li>smembers \\u83b7\\u53d6\\u67d0Set\\u6240\\u6709\\u5143\\u7d20 <code>smembers key<\\/code><\\/li>\\n<li>sismember \\u67e5\\u8be2\\u67d0Set\\u662f\\u5426\\u542b\\u67d0\\u5143\\u7d20\\uff0c\\u8fd4\\u56de\\u7c7b\\u578b\\u662f 0 1 <code>sismember key member<\\/code><\\/li>\\n<li>srem \\u5220\\u9664\\u6307\\u5b9aSet\\u4e2d\\u6307\\u5b9a\\u5143\\u7d20 <code>srem key member<\\/code><\\/li>\\n<\\/ul>\\n<\\/li>\\n<li>\\n<p>\\u3010<code>hash \\u6563\\u5217 (\\u7c7b\\u4f3cMap \\u5d4c\\u5957\\uff0c\\u4e00\\u4e2a\\u5185\\u7f6e\\u7684\\u5fae\\u578bredis)<\\/code>\\u3011<\\/p>\\n<ul>\\n<li>hget<\\/li>\\n<li>hset<\\/li>\\n<li>hgetall \\u83b7\\u53d6\\u67d0\\u6563\\u5217\\u6240\\u6709k-v<\\/li>\\n<li>hdel \\u5220\\u9664\\u6563\\u5217\\u4e2d\\u6307\\u5b9ak<\\/li>\\n<li>hincrby \\u81ea\\u589e<\\/li>\\n<\\/ul>\\n<\\/li>\\n<li>\\u3010<code>zset \\u6709\\u5e8f\\u96c6\\u5408(\\u5143\\u7d20\\u662f\\u952e\\u503c\\u5bf9\\uff0c\\u952e\\u662fmember\\u6210\\u5458\\uff0c\\u503c\\u662fscore\\u5206\\u503c\\u5fc5\\u987b\\u662f\\u6d6e\\u70b9\\u6570)<\\/code>\\u3011\\n<ul>\\n<li>zadd \\u5c06\\u4e00\\u4e2a\\u7ed9\\u5b9a\\u5206\\u503c\\u7684\\u6210\\u5458\\u6dfb\\u52a0\\u5230\\u6709\\u5e8f\\u96c6\\u5408\\u91cc <code>zadd key 3.3 member<\\/code> <\\/li>\\n<li>zrange \\u6839\\u636e\\u5143\\u7d20\\u5728\\u6709\\u5e8f\\u96c6\\u5408\\u4e2d\\u7684\\u4f4d\\u7f6e\\uff0c\\u4ece\\u6709\\u5e8f\\u96c6\\u5408\\u4e2d\\u83b7\\u53d6\\u591a\\u4e2a\\u5143\\u7d20\\n<ul>\\n<li>zrange name 0 -1 withscores \\u83b7\\u53d6\\u6240\\u6709\\u5e76\\u83b7\\u53d6\\u5206\\u503c<\\/li>\\n<li>zrange name 2 30 withscores <\\/li>\\n<\\/ul><\\/li>\\n<li>zrevrange \\u4ece\\u5927\\u5230\\u5c0f\\u6392\\u5e8f\\u7684\\u83b7\\u53d6\\u96c6\\u5408\\u5143\\u7d20<\\/li>\\n<li>zrangebyscore \\u83b7\\u53d6\\u6709\\u5e8f\\u96c6\\u5408\\u5728\\u7ed9\\u5b9a\\u8303\\u56f4\\u4e2d\\u7684\\u6240\\u6709\\u5143\\u7d20\\n<ul>\\n<li>zrangebyscore name 0 200 withscores <\\/li>\\n<\\/ul><\\/li>\\n<li>zrem<\\/li>\\n<li>zincrby \\u81ea\\u589e<\\/li>\\n<li>zinterstore \\u8fdb\\u884c\\u96c6\\u5408\\u4e4b\\u95f4\\u7684\\u5e76\\u96c6\\uff08\\u53ef\\u4ee5\\u770b\\u4f5c\\u662f\\u591a\\u8868\\u8fde\\u63a5\\uff09<\\/li>\\n<li><code>\\u7cbe\\u5ea6\\u4e22\\u5931\\u95ee\\u9898<\\/code>  <\\/li>\\n<\\/ul><\\/li>\\n<\\/ul>\\n<h4>\\u8fc7\\u671f\\u7b56\\u7565<\\/h4>\\n<ul>\\n<li><code>expire key seconds<\\/code> \\u8bbe\\u7f6e\\u952e\\u7684\\u8fc7\\u671f\\u65f6\\u95f4<\\/li>\\n<li><code>PTTL\\/TTL key<\\/code> \\u67e5\\u770b\\u952e\\u5269\\u4f59\\u8fc7\\u671f\\u65f6\\u95f4\\uff08\\u751f\\u5b58\\u65f6\\u95f4\\uff09 ms\\/s\\n<ul>\\n<li>-1\\u8868\\u793a\\u6c38\\u4e45 -2\\u8868\\u793a\\u6ca1\\u6709\\u8be5key<\\/li>\\n<\\/ul><\\/li>\\n<li>\\n<\\/li>\\n<\\/ul>\\n<hr \\/>\\n<h3>\\u5404\\u6570\\u636e\\u7c7b\\u578b\\u7684\\u9ad8\\u7ea7\\u64cd\\u4f5c<\\/h3>\\n<blockquote>\\n<p><a href=\\"http:\\/\\/redisdoc.com\\/index.html\\">\\u4e2d\\u6587\\u6587\\u6863<\\/a><\\/p>\\n<\\/blockquote>\\n<h4>\\u5b57\\u7b26\\u4e32 String<\\/h4>\\n<ul>\\n<li>\\u5b57\\u7b26\\u4e32\\u5c31\\u662f\\u5b57\\u8282\\u7ec4\\u6210\\u7684\\u5e8f\\u5217 \\u53ef\\u4ee5\\u653e\\u5b57\\u8282\\u4e32\\uff0c\\u6574\\u6570\\uff0c\\u6d6e\\u70b9\\u6570<\\/li>\\n<li><code>set key newval nx<\\/code>\\u5b58\\u5728\\u5219set\\u5931\\u8d25<\\/li>\\n<li><code>set key newval xx<\\/code>\\u4e0d\\u5b58\\u5728\\u5219set\\u5931\\u8d25<\\/li>\\n<li>\\u5b58\\u5165\\u7684String\\u80fd\\u88ab\\u89e3\\u6790\\u4e3a\\u6570\\u503c \\u5c31\\u80fd\\u4f7f\\u7528 incr incrby decr decrby <\\/li>\\n<li><code>incr<\\/code> \\u662f\\u539f\\u5b50\\u64cd\\u4f5c\\u5373\\u5e76\\u53d1\\u7684\\u60c5\\u51b5\\u4e0b\\u4e0d\\u4f1a\\u6709\\u810f\\u8bfb(\\u53ef\\u7528\\u4e8e\\u4e3b\\u952e\\u751f\\u6210\\u7b56\\u7565)<\\/li>\\n<li><code>getset key val<\\/code>  set\\u65b0\\u503c\\uff0cget\\u65e7\\u503c<\\/li>\\n<li><code>mset mget<\\/code>\\n<ul>\\n<li><code>mset key val key val<\\/code> <\\/li>\\n<li><code>mget key key key<\\/code> \\u8fd4\\u56de\\u503c\\u7ec4\\u6210\\u7684\\u6570\\u7ec4<\\/li>\\n<\\/ul><\\/li>\\n<li><code>exists key<\\/code> \\u6709\\u8be5\\u503c\\u5c31\\u8fd4\\u56de1\\u5426\\u52190<\\/li>\\n<li><code>del key<\\/code> \\u8fd4\\u56de1\\u88ab\\u5220\\u9664\\uff0c0 key\\u4e0d\\u5b58\\u5728<\\/li>\\n<li><code>type key<\\/code> \\u8fd4\\u56de\\u503c\\u7684\\u7c7b\\u578b<\\/li>\\n<li><code>expire key secondes<\\/code> \\u8bbe\\u7f6e\\u6216\\u6539\\u53d8\\u8d85\\u65f6\\u65f6\\u95f4\\uff0c\\u7cbe\\u5ea6\\u662f\\u79d2\\u6216\\u6beb\\u79d2\\n<ul>\\n<li><code>set key val ex secondes<\\/code> set\\u65f6\\u8bbe\\u7f6e\\u8d85\\u65f6\\u65f6\\u95f4<\\/li>\\n<\\/ul><\\/li>\\n<li><code>persist key<\\/code> \\u53bb\\u9664\\u8d85\\u65f6\\u65f6\\u95f4<\\/li>\\n<li><code>ttl key<\\/code> \\u67e5\\u770b\\u5269\\u4f59\\u5b58\\u6d3b\\u65f6\\u95f4 -1\\u8868\\u793a\\u6c38\\u4e45 -2\\u8868\\u793a\\u6ca1\\u6709\\u8be5key<\\/li>\\n<\\/ul>\\n<h4>\\u5217\\u8868 list<\\/h4>\\n<ul>\\n<li><code>rpush key val val val<\\/code>\\u53f3\\/\\u5c3e\\u6dfb\\u52a0\\u5143\\u7d20 lpush\\u662f\\u5de6\\/\\u5934\\uff0c\\u82e5\\u8868\\u4e0d\\u5b58\\u5728\\u5c31\\u65b0\\u5efa<\\/li>\\n<li><code>rpushx key value<\\/code> \\u82e5\\u8868\\u4e0d\\u5b58\\u5728\\u5c31\\u4ec0\\u4e48\\u90fd\\u4e0d\\u505a\\uff0c\\u5426\\u5219\\u5c3e\\u63d2\\u5143\\u7d20<\\/li>\\n<li><code>rpop key<\\/code> \\u4ecelist\\u53f3\\/\\u5c3e\\u7aef\\u4e2d\\u5220\\u9664\\u5143\\u7d20\\u8fd4\\u56de\\u5143\\u7d20\\u503c \\u6ca1\\u6709\\u4e86\\u5c31\\u8fd4\\u56denull<\\/li>\\n<li>\\u963b\\u585e\\u5f0f\\u7684\\u5217\\u8868\\u5f39\\u51fa\\u547d\\u4ee4(block) <code>\\u961f\\u5217\\u5f88\\u6709\\u7528<\\/code>\\n<ul>\\n<li><code>blpop<\\/code><\\/li>\\n<li><code>brpop<\\/code><\\/li>\\n<li><code>bpoplpush<\\/code><\\/li>\\n<li><code>brpoplpush<\\/code> \\u963b\\u585e\\u5f0f\\u5148\\u53f3\\u5f39\\u518d\\u5de6\\u8fdb<\\/li>\\n<\\/ul><\\/li>\\n<li><code>lrange key 0 -1<\\/code> \\u53d6\\u6307\\u5b9a\\u957f\\u5ea6\\u7684list -1\\u8868\\u793a\\u5168\\u90e8<\\/li>\\n<li><code>ltrim key 0 2<\\/code> \\u622a\\u53d6\\u5f53\\u524d\\u7684list<\\/li>\\n<li><code>lindex key offset<\\/code>   \\u8fd4\\u56de\\u504f\\u79fb\\u91cf\\u4e3aoffset\\u7684\\u5143\\u7d20<\\/li>\\n<li><code>LINSERT key BEFORE|AFTER pivot value<\\/code> \\u5c06\\u503c value \\u63d2\\u5165\\u5230\\u5217\\u8868 key \\u5f53\\u4e2d\\uff0c\\u4f4d\\u4e8e\\u503c pivot \\u4e4b\\u524d\\u6216\\u4e4b\\u540e\\u3002\\n<ul>\\n<li>\\u5f53 pivot \\u4e0d\\u5b58\\u5728\\u4e8e\\u5217\\u8868 key \\u65f6\\uff0c\\u4e0d\\u6267\\u884c\\u4efb\\u4f55\\u64cd\\u4f5c\\u3002\\u5f53 key \\u4e0d\\u5b58\\u5728\\u65f6\\uff0c key \\u88ab\\u89c6\\u4e3a\\u7a7a\\u5217\\u8868\\uff0c\\u4e0d\\u6267\\u884c\\u4efb\\u4f55\\u64cd\\u4f5c\\u3002\\u5982\\u679c key \\u4e0d\\u662f\\u5217\\u8868\\u7c7b\\u578b\\uff0c\\u8fd4\\u56de\\u4e00\\u4e2a\\u9519\\u8bef\\u3002<\\/li>\\n<\\/ul><\\/li>\\n<li><code>LREM key count value<\\/code> \\u6839\\u636e\\u53c2\\u6570 count \\u7684\\u503c\\uff0c\\u79fb\\u9664\\u5217\\u8868\\u4e2d\\u4e0e\\u53c2\\u6570 value \\u76f8\\u7b49\\u7684\\u5143\\u7d20\\u3002<\\/li>\\n<\\/ul>\\n<h4>\\u96c6\\u5408 set<\\/h4>\\n<ul>\\n<li><code>SADD key member [member ...]<\\/code><\\/li>\\n<li><code>SCARD key<\\/code> \\u8fd4\\u56de\\u96c6\\u5408 key \\u7684\\u57fa\\u6570(\\u96c6\\u5408\\u4e2d\\u5143\\u7d20\\u7684\\u6570\\u91cf)\\u3002<\\/li>\\n<li><code>SDIFF key [key ...]<\\/code>  \\u8fd4\\u56de\\u4e00\\u4e2a\\u96c6\\u5408\\u7684\\u5168\\u90e8\\u6210\\u5458\\uff0c\\u8be5\\u96c6\\u5408\\u662f\\u6240\\u6709\\u7ed9\\u5b9a\\u96c6\\u5408\\u4e4b\\u95f4\\u7684\\u5dee\\u96c6\\u3002\\u4e0d\\u5b58\\u5728\\u7684 key \\u88ab\\u89c6\\u4e3a\\u7a7a\\u96c6\\u3002<\\/li>\\n<li><code>SDIFFSTORE destination key [key ...]<\\/code>  \\u8fd9\\u4e2a\\u547d\\u4ee4\\u7684\\u4f5c\\u7528\\u548c SDIFF \\u7c7b\\u4f3c\\uff0c\\u4f46\\u5b83\\u5c06\\u7ed3\\u679c\\u4fdd\\u5b58\\u5230 destination \\u96c6\\u5408\\uff0c\\u800c\\u4e0d\\u662f\\u7b80\\u5355\\u5730\\u8fd4\\u56de\\u7ed3\\u679c\\u96c6\\u3002\\u5982\\u679c destination \\u96c6\\u5408\\u5df2\\u7ecf\\u5b58\\u5728\\uff0c\\u5219\\u5c06\\u5176\\u8986\\u76d6\\u3002destination \\u53ef\\u4ee5\\u662f key \\u672c\\u8eab\\u3002<\\/li>\\n<li><code>SINTER key [key ...]<\\/code> \\u8fd4\\u56de\\u4e00\\u4e2a\\u96c6\\u5408\\u7684\\u5168\\u90e8\\u6210\\u5458\\uff0c\\u8be5\\u96c6\\u5408\\u662f\\u6240\\u6709\\u7ed9\\u5b9a\\u96c6\\u5408\\u7684\\u4ea4\\u96c6\\u3002\\u4e0d\\u5b58\\u5728\\u7684 key \\u88ab\\u89c6\\u4e3a\\u7a7a\\u96c6\\u3002\\u5f53\\u7ed9\\u5b9a\\u96c6\\u5408\\u5f53\\u4e2d\\u6709\\u4e00\\u4e2a\\u7a7a\\u96c6\\u65f6\\uff0c\\u7ed3\\u679c\\u4e5f\\u4e3a\\u7a7a\\u96c6(\\u6839\\u636e\\u96c6\\u5408\\u8fd0\\u7b97\\u5b9a\\u5f8b)\\u3002<\\/li>\\n<li><code>SINTERSTORE destination key [key ...]<\\/code> \\u4e0esdiffstore\\u7c7b\\u4f3c<\\/li>\\n<li><code>SISMEMBER key member<\\/code> \\u5224\\u65ad member \\u5143\\u7d20\\u662f\\u5426\\u96c6\\u5408 key \\u7684\\u6210\\u5458\\u3002<\\/li>\\n<li><code>SMEMBERS key<\\/code> <\\/li>\\n<li><code>SMOVE source destination member<\\/code> \\u5c06 member \\u5143\\u7d20\\u4ece source \\u96c6\\u5408\\u79fb\\u52a8\\u5230 destination \\u96c6\\u5408\\u3002 SMOVE \\u662f\\u539f\\u5b50\\u6027\\u64cd\\u4f5c\\u3002<\\/li>\\n<li><code>SPOP key<\\/code> \\u79fb\\u9664\\u5e76\\u8fd4\\u56de\\u96c6\\u5408\\u4e2d\\u7684\\u4e00\\u4e2a\\u968f\\u673a\\u5143\\u7d20<\\/li>\\n<li><code>SRANDMEMBER key [count]<\\/code> \\u5982\\u679c\\u547d\\u4ee4\\u6267\\u884c\\u65f6\\uff0c\\u53ea\\u63d0\\u4f9b\\u4e86 key \\u53c2\\u6570\\uff0c\\u90a3\\u4e48\\u8fd4\\u56de\\u96c6\\u5408\\u4e2d\\u7684\\u4e00\\u4e2a\\u968f\\u673a\\u5143\\u7d20<\\/li>\\n<li><code>SREM key member [member ...]<\\/code> \\u79fb\\u9664\\u96c6\\u5408 key \\u4e2d\\u7684\\u4e00\\u4e2a\\u6216\\u591a\\u4e2a member \\u5143\\u7d20\\uff0c\\u4e0d\\u5b58\\u5728\\u7684 member \\u5143\\u7d20\\u4f1a\\u88ab\\u5ffd\\u7565\\u3002<\\/li>\\n<li><code>SUNION key [key ...]<\\/code> \\u8fd4\\u56de\\u4e00\\u4e2a\\u96c6\\u5408\\u7684\\u5168\\u90e8\\u6210\\u5458\\uff0c\\u8be5\\u96c6\\u5408\\u662f\\u6240\\u6709\\u7ed9\\u5b9a\\u96c6\\u5408\\u7684\\u5e76\\u96c6\\u3002<\\/li>\\n<li><code>SUNIONSTORE destination key [key ...]<\\/code><\\/li>\\n<li><code>SSCAN key cursor [MATCH pattern] [COUNT count]<\\/code> \\u53c2\\u8003 SCAN \\u547d\\u4ee4<\\/li>\\n<\\/ul>\\n<h4>\\u6709\\u5e8f\\u96c6\\u5408 zset<\\/h4>\\n<ul>\\n<li>ZADD<\\/li>\\n<li>ZCARD<\\/li>\\n<li>ZCOUNT<\\/li>\\n<li>ZINCRBY<\\/li>\\n<li>ZRANGE<\\/li>\\n<li>ZRANGEBYSCORE<\\/li>\\n<li>ZRANK<\\/li>\\n<li>ZREM<\\/li>\\n<li>ZREMRANGEBYRANK<\\/li>\\n<li>ZREMRANGEBYSCORE<\\/li>\\n<li>ZREVRANGE<\\/li>\\n<li>ZREVRANGEBYSCORE<\\/li>\\n<li>ZREVRANK<\\/li>\\n<li>ZSCORE<\\/li>\\n<li>ZUNIONSTORE<\\/li>\\n<li>ZINTERSTORE<\\/li>\\n<li>ZSCAN<\\/li>\\n<li>ZRANGEBYLEX<\\/li>\\n<li>ZLEXCOUNT<\\/li>\\n<li>ZREMRANGEBYLEX<\\/li>\\n<\\/ul>\\n<h4>\\u6563\\u5217 hash<\\/h4>\\n<ul>\\n<li>HDEL<\\/li>\\n<li>HEXISTS<\\/li>\\n<li>HGET<\\/li>\\n<li>HGETALL<\\/li>\\n<li>HINCRBY<\\/li>\\n<li>HINCRBYFLOAT<\\/li>\\n<li>HKEYS<\\/li>\\n<li>HLEN<\\/li>\\n<li>HMGET<\\/li>\\n<li>HMSET<\\/li>\\n<li>HSET<\\/li>\\n<li>HSETNX<\\/li>\\n<li>HVALS<\\/li>\\n<li>HSCAN<\\/li>\\n<li>HSTRLEN<\\/li>\\n<\\/ul>\\n<h4>HyperLogLog<\\/h4>\\n<p>PFADD<br \\/>\\nPFCOUNT<br \\/>\\nPFMERGE<\\/p>\\n<h4>GEO\\u3010\\u5730\\u7406\\u4f4d\\u7f6e\\u3011<\\/h4>\\n<p>GEOADD<br \\/>\\nGEOPOS<br \\/>\\nGEODIST<br \\/>\\nGEORADIUS<br \\/>\\nGEORADIUSBYMEMBER<br \\/>\\nGEOHASH<\\/p>\\n<hr \\/>\\n<h3>Pub\\/Sub\\u53d1\\u5e03\\u8ba2\\u9605<\\/h3>\\n<ul>\\n<li><code>PSUBSCRIBE pattern [pattern ...]<\\/code>\\n<ul>\\n<li>\\u8ba2\\u9605\\u4e00\\u4e2a\\u6216\\u591a\\u4e2a\\u7b26\\u5408\\u7ed9\\u5b9a\\u6a21\\u5f0f\\u7684\\u9891\\u9053\\u3002\\u6bcf\\u4e2a\\u6a21\\u5f0f\\u4ee5 <em> \\u4f5c\\u4e3a\\u5339\\u914d\\u7b26\\uff0c\\u6bd4\\u5982 it<\\/em> \\u5339\\u914d\\u6240\\u6709\\u4ee5 it \\u5f00\\u5934\\u7684\\u9891\\u9053( it.news \\u3001 it.blog \\u3001 it.tweets \\u7b49\\u7b49)\\uff0c<\\/li>\\n<li>news.* \\u5339\\u914d\\u6240\\u6709\\u4ee5 news. \\u5f00\\u5934\\u7684\\u9891\\u9053( news.it \\u3001 news.global.today \\u7b49\\u7b49)\\uff0c\\u8bf8\\u5982\\u6b64\\u7c7b\\u3002<\\/li>\\n<\\/ul><\\/li>\\n<li><code>PUBLISH channel message<\\/code>\\n<ul>\\n<li>\\u5c06\\u4fe1\\u606f message \\u53d1\\u9001\\u5230\\u6307\\u5b9a\\u7684\\u9891\\u9053 channel \\u3002<\\/li>\\n<\\/ul><\\/li>\\n<li><code>PUBSUB &lt;subcommand&gt; [argument [argument ...]]<\\/code>\\n<ul>\\n<li>PUBSUB \\u662f\\u4e00\\u4e2a\\u67e5\\u770b\\u8ba2\\u9605\\u4e0e\\u53d1\\u5e03\\u7cfb\\u7edf\\u72b6\\u6001\\u7684\\u5185\\u7701\\u547d\\u4ee4\\uff0c \\u5b83\\u7531\\u6570\\u4e2a\\u4e0d\\u540c\\u683c\\u5f0f\\u7684\\u5b50\\u547d\\u4ee4\\u7ec4\\u6210\\uff0c \\u4ee5\\u4e0b\\u5c06\\u5206\\u522b\\u5bf9\\u8fd9\\u4e9b\\u5b50\\u547d\\u4ee4\\u8fdb\\u884c\\u4ecb\\u7ecd\\u3002<\\/li>\\n<li><code>PUBSUB CHANNELS [pattern]<\\/code> \\u5217\\u51fa\\u5f53\\u524d\\u7684\\u6d3b\\u8dc3\\u9891\\u9053\\u3002\\u8bbe\\u7f6epattern\\u53c2\\u6570\\u5c31\\u4f1a\\u5339\\u914d\\u6d3b\\u8dc3\\u9891\\u9053\\uff0c\\u5426\\u5219\\u662f\\u5217\\u51fa\\u6240\\u6709\\u9891\\u9053<\\/li>\\n<li><code>PUBSUB NUMSUB [channel-1 ... channel-N]<\\/code> \\u8fd4\\u56de\\u7ed9\\u5b9a\\u9891\\u9053\\u7684\\u8ba2\\u9605\\u8005\\u6570\\u91cf\\uff0c \\u8ba2\\u9605\\u6a21\\u5f0f\\u7684\\u5ba2\\u6237\\u7aef\\u4e0d\\u8ba1\\u7b97\\u5728\\u5185\\u3002<\\/li>\\n<li><code>PUBSUB NUMPAT<\\/code> \\u8fd4\\u56de\\u8ba2\\u9605\\u6a21\\u5f0f\\u7684\\u6570\\u91cf\\u3002\\u6ce8\\u610f\\uff0c \\u8fd9\\u4e2a\\u547d\\u4ee4\\u8fd4\\u56de\\u7684\\u4e0d\\u662f\\u8ba2\\u9605\\u6a21\\u5f0f\\u7684\\u5ba2\\u6237\\u7aef\\u7684\\u6570\\u91cf\\uff0c \\u800c\\u662f\\u5ba2\\u6237\\u7aef\\u8ba2\\u9605\\u7684\\u6240\\u6709\\u6a21\\u5f0f\\u7684\\u6570\\u91cf\\u603b\\u548c\\u3002<\\/li>\\n<\\/ul><\\/li>\\n<li><code>PUNSUBSCRIBE [pattern [pattern ...]]<\\/code>\\n<ul>\\n<li>\\u6307\\u793a\\u5ba2\\u6237\\u7aef\\u9000\\u8ba2\\u6240\\u6709\\u7ed9\\u5b9a\\u6a21\\u5f0f\\u3002\\u5982\\u679c\\u6ca1\\u6709\\u6a21\\u5f0f\\u88ab\\u6307\\u5b9a\\uff0c\\u4e5f\\u5373\\u662f\\uff0c\\u4e00\\u4e2a\\u65e0\\u53c2\\u6570\\u7684 PUNSUBSCRIBE \\u8c03\\u7528\\u88ab\\u6267\\u884c\\uff0c<\\/li>\\n<li>\\u90a3\\u4e48\\u5ba2\\u6237\\u7aef\\u4f7f\\u7528 PSUBSCRIBE \\u547d\\u4ee4\\u8ba2\\u9605\\u7684\\u6240\\u6709\\u6a21\\u5f0f\\u90fd\\u4f1a\\u88ab\\u9000\\u8ba2\\u3002\\u5728\\u8fd9\\u79cd\\u60c5\\u51b5\\u4e0b\\uff0c\\u547d\\u4ee4\\u4f1a\\u8fd4\\u56de\\u4e00\\u4e2a\\u4fe1\\u606f\\uff0c\\u544a\\u77e5\\u5ba2\\u6237\\u7aef\\u6240\\u6709\\u88ab\\u9000\\u8ba2\\u7684\\u6a21\\u5f0f\\u3002<\\/li>\\n<\\/ul><\\/li>\\n<li><code>SUBSCRIBE channel [channel ...]<\\/code>\\n<ul>\\n<li>\\u8ba2\\u9605\\u7ed9\\u5b9a\\u7684\\u4e00\\u4e2a\\u6216\\u591a\\u4e2a\\u9891\\u9053\\u7684\\u4fe1\\u606f\\u3002<\\/li>\\n<\\/ul><\\/li>\\n<li><code>UNSUBSCRIBE [channel [channel ...]]<\\/code>\\n<ul>\\n<li>\\u6307\\u793a\\u5ba2\\u6237\\u7aef\\u9000\\u8ba2\\u7ed9\\u5b9a\\u7684\\u9891\\u9053\\u3002\\u5982\\u679c\\u6ca1\\u6709\\u9891\\u9053\\u88ab\\u6307\\u5b9a\\uff0c\\u4e5f\\u5373\\u662f\\uff0c\\u4e00\\u4e2a\\u65e0\\u53c2\\u6570\\u7684 UNSUBSCRIBE \\u8c03\\u7528\\u88ab\\u6267\\u884c\\uff0c<\\/li>\\n<li>\\u90a3\\u4e48\\u5ba2\\u6237\\u7aef\\u4f7f\\u7528 SUBSCRIBE \\u547d\\u4ee4\\u8ba2\\u9605\\u7684\\u6240\\u6709\\u9891\\u9053\\u90fd\\u4f1a\\u88ab\\u9000\\u8ba2\\u3002\\u5728\\u8fd9\\u79cd\\u60c5\\u51b5\\u4e0b\\uff0c\\u547d\\u4ee4\\u4f1a\\u8fd4\\u56de\\u4e00\\u4e2a\\u4fe1\\u606f\\uff0c\\u544a\\u77e5\\u5ba2\\u6237\\u7aef\\u6240\\u6709\\u88ab\\u9000\\u8ba2\\u7684\\u9891\\u9053\\u3002<\\/li>\\n<\\/ul><\\/li>\\n<\\/ul>\\n<hr \\/>\\n<h3>\\u4e8b\\u52a1<\\/h3>\\n<ul>\\n<li><code>DISCARD<\\/code> \\u53d6\\u6d88\\u4e8b\\u52a1\\uff0c\\u653e\\u5f03\\u6267\\u884c\\u4e8b\\u52a1\\u5757\\u5185\\u7684\\u6240\\u6709\\u547d\\u4ee4\\u3002<\\/li>\\n<li><code>EXEC<\\/code>\\n<ul>\\n<li>\\u6267\\u884c\\u6240\\u6709\\u4e8b\\u52a1\\u5757\\u5185\\u7684\\u547d\\u4ee4\\u3002\\u5047\\u5982\\u67d0\\u4e2a(\\u6216\\u67d0\\u4e9b) key \\u6b63\\u5904\\u4e8e WATCH \\u547d\\u4ee4\\u7684\\u76d1\\u89c6\\u4e4b\\u4e0b\\uff0c\\u4e14\\u4e8b\\u52a1\\u5757\\u4e2d\\u6709\\u548c\\u8fd9\\u4e2a(\\u6216\\u8fd9\\u4e9b) key \\u76f8\\u5173\\u7684\\u547d\\u4ee4\\uff0c<\\/li>\\n<li>\\u90a3\\u4e48 EXEC \\u547d\\u4ee4\\u53ea\\u5728\\u8fd9\\u4e2a(\\u6216\\u8fd9\\u4e9b) key \\u6ca1\\u6709\\u88ab\\u5176\\u4ed6\\u547d\\u4ee4\\u6240\\u6539\\u52a8\\u7684\\u60c5\\u51b5\\u4e0b\\u6267\\u884c\\u5e76\\u751f\\u6548\\uff0c\\u5426\\u5219\\u8be5\\u4e8b\\u52a1\\u88ab\\u6253\\u65ad(abort)\\u3002<\\/li>\\n<\\/ul><\\/li>\\n<li><code>MULTI<\\/code> \\u6807\\u8bb0\\u4e00\\u4e2a\\u4e8b\\u52a1\\u5757\\u7684\\u5f00\\u59cb\\u3002\\u4e8b\\u52a1\\u5757\\u5185\\u7684\\u591a\\u6761\\u547d\\u4ee4\\u4f1a\\u6309\\u7167\\u5148\\u540e\\u987a\\u5e8f\\u88ab\\u653e\\u8fdb\\u4e00\\u4e2a\\u961f\\u5217\\u5f53\\u4e2d\\uff0c\\u6700\\u540e\\u7531 EXEC \\u547d\\u4ee4\\u539f\\u5b50\\u6027(atomic)\\u5730\\u6267\\u884c\\u3002<\\/li>\\n<li><code>UNWATCH<\\/code> \\n<ul>\\n<li>\\u53d6\\u6d88 WATCH \\u547d\\u4ee4\\u5bf9\\u6240\\u6709 key \\u7684\\u76d1\\u89c6\\u3002\\u5982\\u679c\\u5728\\u6267\\u884c WATCH \\u547d\\u4ee4\\u4e4b\\u540e\\uff0c EXEC \\u547d\\u4ee4\\u6216 DISCARD \\u547d\\u4ee4\\u5148\\u88ab\\u6267\\u884c\\u4e86\\u7684\\u8bdd\\uff0c\\u90a3\\u4e48\\u5c31\\u4e0d\\u9700\\u8981\\u518d\\u6267\\u884c UNWATCH \\u4e86\\u3002<\\/li>\\n<li>\\u56e0\\u4e3a EXEC \\u547d\\u4ee4\\u4f1a\\u6267\\u884c\\u4e8b\\u52a1\\uff0c\\u56e0\\u6b64 WATCH \\u547d\\u4ee4\\u7684\\u6548\\u679c\\u5df2\\u7ecf\\u4ea7\\u751f\\u4e86\\uff1b\\u800c DISCARD \\u547d\\u4ee4\\u5728\\u53d6\\u6d88\\u4e8b\\u52a1\\u7684\\u540c\\u65f6\\u4e5f\\u4f1a\\u53d6\\u6d88\\u6240\\u6709\\u5bf9 key \\u7684\\u76d1\\u89c6\\uff0c\\u56e0\\u6b64\\u8fd9\\u4e24\\u4e2a\\u547d\\u4ee4\\u6267\\u884c\\u4e4b\\u540e\\uff0c\\u5c31\\u6ca1\\u6709\\u5fc5\\u8981\\u6267\\u884c UNWATCH \\u4e86\\u3002<\\/li>\\n<\\/ul><\\/li>\\n<li><code>WATCH key [key ...]<\\/code>\\n<ul>\\n<li>\\u76d1\\u89c6\\u4e00\\u4e2a(\\u6216\\u591a\\u4e2a) key \\uff0c\\u5982\\u679c\\u5728\\u4e8b\\u52a1\\u6267\\u884c\\u4e4b\\u524d\\u8fd9\\u4e2a(\\u6216\\u8fd9\\u4e9b) key \\u88ab\\u5176\\u4ed6\\u547d\\u4ee4\\u6240\\u6539\\u52a8\\uff0c\\u90a3\\u4e48\\u4e8b\\u52a1\\u5c06\\u88ab\\u6253\\u65ad\\u3002<\\/li>\\n<\\/ul><\\/li>\\n<\\/ul>\\n<hr \\/>\\n<h3>\\u670d\\u52a1\\u5668<\\/h3>\\n<p>BGREWRITEAOF<br \\/>\\nBGSAVE<br \\/>\\nCLIENT GETNAME<br \\/>\\nCLIENT KILL<br \\/>\\nCLIENT LIST<br \\/>\\nCLIENT SETNAME<br \\/>\\nCONFIG GET<br \\/>\\nCONFIG RESETSTAT<br \\/>\\nCONFIG REWRITE<br \\/>\\nCONFIG SET<br \\/>\\nDBSIZE<br \\/>\\nDEBUG OBJECT<br \\/>\\nDEBUG SEGFAULT<br \\/>\\nFLUSHALL<br \\/>\\nFLUSHDB<br \\/>\\nINFO<br \\/>\\nLASTSAVE<br \\/>\\nMONITOR<br \\/>\\nPSYNC<br \\/>\\nSAVE<br \\/>\\nSHUTDOWN<br \\/>\\nSLAVEOF<br \\/>\\nSLOWLOG<br \\/>\\nSYNC<br \\/>\\nTIME<\\/p>\\n<hr \\/>\\n<h3>Run Configuration<\\/h3>\\n<ul>\\n<li><em>slaveof<\\/em>\\n<ul>\\n<li><code>redis-server --port 9999 --slaveof 127.0.0.1 6379<\\/code> \\u542f\\u52a8\\u4e00\\u4e2a9999\\u7aef\\u53e3\\u4f5c\\u4e3a6379\\u7684\\u4ece\\u670d\\u52a1\\u5668\\u8fdb\\u884c\\u540c\\u6b65<\\/li>\\n<li>\\u6216\\u8005\\u670d\\u52a1\\u542f\\u52a8\\u540e\\u6267\\u884c <code>slaveof host port<\\/code>\\uff08\\u5982\\u679c\\u5df2\\u7ecf\\u662f\\u4ece\\u670d\\u52a1\\u5668\\uff0c\\u5c31\\u4e22\\u53bb\\u65e7\\u670d\\u52a1\\u5668\\u7684\\u6570\\u636e\\u96c6\\uff0c\\u8f6c\\u800c\\u5bf9\\u65b0\\u7684\\u4e3b\\u670d\\u52a1\\u5668\\u8fdb\\u884c\\u540c\\u6b65\\uff09<\\/li>\\n<li>\\u4ece\\u670d\\u52a1\\u53d8\\u6210\\u4e3b\\u670d\\u52a1 <code>slaveof no one<\\/code> (\\u540c\\u6b65\\u7684\\u6570\\u636e\\u96c6\\u4e0d\\u4f1a\\u4e22\\u5931\\uff0c\\u8fc5\\u901f\\u66ff\\u6362\\u4e3b\\u670d\\u52a1\\u5668)<\\/li>\\n<\\/ul><\\/li>\\n<li><em>loglevel<\\/em>\\n<ul>\\n<li><code>.\\/redis-server \\/etc\\/redis\\/6379.conf --loglevel debug<\\/code><\\/li>\\n<\\/ul><\\/li>\\n<\\/ul>\\n<h3>\\u6570\\u636e\\u5b89\\u5168\\u548c\\u6027\\u80fd<\\/h3>\\n<h4>\\u6301\\u4e45\\u5316\\u7b56\\u7565<\\/h4>\\n<h4>\\u590d\\u5236<\\/h4>\\n<h4>\\u6570\\u636e\\u8fc1\\u79fb<\\/h4>\\n<ul>\\n<li>\\u4f7f\\u7528\\u4e3b\\u4ece\\u590d\\u5236\\u6765\\u8fdb\\u884c\\u6570\\u636e<\\/li>\\n<\\/ul>\\n<hr \\/>\\n<h2>\\u3010Redis\\u7684\\u4f7f\\u7528\\u3011<\\/h2>\\n<h3>\\u4f5c\\u4e3a\\u65e5\\u5fd7\\u8bb0\\u5f55<\\/h3>\\n<h3>\\u4f5c\\u4e3a\\u7f51\\u7ad9\\u7edf\\u8ba1\\u6570\\u636e<\\/h3>\\n<h3>\\u5b58\\u50a8\\u914d\\u7f6e\\u4fe1\\u606f<\\/h3>\\n<h3>\\u81ea\\u52a8\\u8865\\u5168<\\/h3>\\n<ul>\\n<li>\\u641c\\u7d22\\u5efa\\u8bae<\\/li>\\n<\\/ul>\\n<h3>\\u6784\\u5efa\\u9501<\\/h3>\\n<h3>\\u4efb\\u52a1\\u961f\\u5217<\\/h3>\\n<ul>\\n<li>\\u53d1\\u9001\\u90ae\\u4ef6<\\/li>\\n<\\/ul>\\n<hr \\/>\\n<h3>\\u3010Java\\u4f7f\\u7528redis\\u3011<\\/h3>\\n<ul>\\n<li>\\n<p>maven\\u4f9d\\u8d56(Spring 4.1.7)\\uff1a<\\/p>\\n<pre><code class=\\"language-xml\\">&lt;dependency&gt;\\n    &lt;groupId&gt;org.springframework.data&lt;\\/groupId&gt;\\n    &lt;artifactId&gt;spring-data-redis&lt;\\/artifactId&gt;\\n    &lt;version&gt;1.6.0.RELEASE&lt;\\/version&gt;\\n&lt;\\/dependency&gt;\\n&lt;dependency&gt;\\n    &lt;groupId&gt;redis.clients&lt;\\/groupId&gt;\\n    &lt;artifactId&gt;jedis&lt;\\/artifactId&gt;\\n    &lt;version&gt;2.9.0&lt;\\/version&gt;\\n    &lt;type&gt;jar&lt;\\/type&gt;\\n&lt;scope&gt;compile&lt;\\/scope&gt;\\n&lt;\\/dependency&gt;\\n&lt;dependency&gt;\\n    &lt;groupId&gt;org.apache.commons&lt;\\/groupId&gt;\\n    &lt;artifactId&gt;commons-lang3&lt;\\/artifactId&gt;\\n    &lt;version&gt;3.3.2&lt;\\/version&gt;\\n&lt;\\/dependency&gt;<\\/code><\\/pre>\\n<p><code>Spring\\u914d\\u7f6e\\u6587\\u4ef6<\\/code><\\/p>\\n<pre><code class=\\"language-xml\\">&lt;!--\\n    \\u52a0\\u8f7dredis\\u914d\\u7f6e\\u6587\\u4ef6 \\n    \\u5982\\u679c\\u5df2\\u7ecf\\u52a0\\u8f7d\\u4e86\\u4e00\\u4e2a\\u6587\\u4ef6\\uff0c\\u90a3\\u4e48\\u7b2c\\u4e00\\u4e2a\\u5c31\\u8981\\u5199\\u8fd9\\u4e2a\\u914d\\u7f6e\\u9879\\uff0c\\n    &lt;property name=\\"ignoreUnresolvablePlaceholders\\" value=\\"true\\"\\/&gt;\\n    \\u7b2c\\u4e8c\\u4e2a\\u8981\\u52a0 \\u540e\\u9762\\u7684\\u914d\\u7f6e \\n    \\u4e0d\\u7136\\u5c31\\u53ea\\u4f1a\\u52a0\\u8f7d\\u524d\\u9762\\u90a3\\u4e2a\\u6587\\u4ef6\\n--&gt;\\n&lt;context:property-placeholder location=\\"classpath:redis.properties\\" ignore-unresolvable=\\"true\\"\\/&gt;\\n&lt;!-- redis\\u8fde\\u63a5\\u6c60\\u7684\\u914d\\u7f6e --&gt;\\n&lt;bean id=\\"jedisPoolConfig\\" class=\\"redis.clients.jedis.JedisPoolConfig\\"&gt;\\n    &lt;property name=\\"maxActive\\" value=\\"${redis.pool.maxActive}\\"\\/&gt;\\n    &lt;property name=\\"maxIdle\\" value=\\"${redis.pool.maxIdle}\\"\\/&gt;\\n    &lt;property name=\\"minIdle\\" value=\\"${redis.pool.minIdle}\\"\\/&gt;\\n    &lt;property name=\\"maxWait\\" value=\\"${redis.pool.maxWait}\\"\\/&gt;\\n    &lt;property name=\\"testOnBorrow\\" value=\\"${redis.pool.testOnBorrow}\\"\\/&gt;\\n    &lt;property name=\\"testOnReturn\\" value=\\"${redis.pool.testOnReturn}\\"\\/&gt;\\n&lt;\\/bean&gt;\\n&lt;!-- redis\\u7684\\u8fde\\u63a5\\u6c60pool\\uff0c\\u4e0d\\u662f\\u5fc5\\u9009\\u9879\\uff1atimeout\\/password  --&gt;\\n&lt;bean id = \\"jedisPool\\" class=\\"redis.clients.jedis.JedisPool\\"&gt;\\n    &lt;constructor-arg index=\\"0\\" ref=\\"jedisPoolConfig\\"\\/&gt;\\n    &lt;constructor-arg index=\\"1\\" value=\\"${redis.host}\\"\\/&gt;\\n    &lt;constructor-arg index=\\"2\\" value=\\"${redis.port}\\" type=\\"int\\"\\/&gt;\\n    &lt;constructor-arg index=\\"3\\" value=\\"${redis.timeout}\\" type=\\"int\\"\\/&gt;\\n    &lt;constructor-arg index=\\"4\\" value=\\"${redis.password}\\"\\/&gt;\\n&lt;\\/bean&gt;<\\/code><\\/pre>\\n<\\/li>\\n<li>\\n<p>java\\u5b9e\\u9645\\u6d4b\\u8bd5\\u7c7b<a href=\\"https:\\/\\/github.com\\/Kuangcp\\/Maven_SSM\\/blob\\/master\\/src\\/test\\/java\\/redis\\/JedisUtilTest.java\\">JedisUtilsTest.java<\\/a><\\/p>\\n<\\/li>\\n<li>jedis \\u4f7f\\u7528\\u540e\\u8981disconnect\\u91ca\\u653e\\u8fde\\u63a5,\\u6700\\u65b0\\u7248\\u672cclose\\u5c31\\u4e0d\\u7528\\u4e86\\uff0c\\u4f7f\\u7528\\u8fde\\u63a5\\u6c60\\u5c31\\u4e0d\\u7528<\\/li>\\n<li>jedis \\u7684\\u4e8b\\u52a1 \\u4f7f\\u7528exec\\u91ca\\u653e\\u4e8b\\u52a1<\\/li>\\n<\\/ul>\\n<h3>jedis\\u9047\\u5230\\u7684\\u5f02\\u5e38<\\/h3>\\n<ul>\\n<li>Invocation of init method failed; nested exception is java.lang.NoSuchMethodError: org.springframework.core.serializer.support.DeserializingConverter<\\/li>\\n<li>\\u7248\\u672c\\u5bf9\\u4e0d\\u4e0a\\uff0c\\u8981Spring\\u548cSpring-data-redis \\u548c redis\\u548ccommons-lang3\\u5bf9\\u5e94<\\/li>\\n<li>\\u76ee\\u524d\\u662f4.1.7 + 1.6.0 + 2.9.0 + 3.3.2 \\u7f16\\u8bd1\\u901a\\u8fc7\\u4e86    <\\/li>\\n<\\/ul>\\n<h3>SpringBoot\\u4f7f\\u7528Redis<\\/h3>\\n<p><a href=\\"\\/Java\\/Spring\\/SpringBootDatabase.md\\">SpringBoot\\u914d\\u7f6eRedis<\\/a><\\/p>"}', 'http://or0z8sgc6.bkt.clouddn.com/cover/2018/03/05/wKn9GUcWAxMUU0qmLC2AwicnQVlnrba4jMaSwxUg.jpg', 'redis菲关系型数据库安装及配置', 0, 0, 175, '2018-01-04 16:00:00', '2018-03-05 01:15:54', '2018-05-23 07:41:54', NULL);
INSERT INTO `articles` (`id`, `category_id`, `user_id`, `last_user_id`, `slug`, `title`, `subtitle`, `content`, `page_image`, `meta_description`, `is_original`, `is_draft`, `view_count`, `published_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(82, 18, 12, 12, 'The-Filebeat-Chinese-guide', 'Filebeat中文指南', '日志转储工具,ELK工具链', '{"raw":">Filebeat\\u4e2d\\u6587\\u6307\\u5357\\n\\n- \\u7ffb\\u8bd1\\u81ea\\uff1ahttps:\\/\\/www.elastic.co\\/guide\\/en\\/beats\\/filebeat\\/current\\/index.html\\n\\n- \\u8f6c\\u8f7d\\u81ea\\uff1ahttps:\\/\\/www.cnblogs.com\\/kerwinC\\/p\\/6227768.html\\npower by kerwin\\n\\n#### \\u4e00\\u3001\\u6982\\u8ff0\\nFilebeat\\u662f\\u4e00\\u4e2a\\u65e5\\u5fd7\\u6587\\u4ef6\\u6258\\u8fd0\\u5de5\\u5177\\uff0c\\u5728\\u4f60\\u7684\\u670d\\u52a1\\u5668\\u4e0a\\u5b89\\u88c5\\u5ba2\\u6237\\u7aef\\u540e\\uff0cfilebeat\\u4f1a\\u76d1\\u63a7\\u65e5\\u5fd7\\u76ee\\u5f55\\u6216\\u8005\\u6307\\u5b9a\\u7684\\u65e5\\u5fd7\\u6587\\u4ef6\\uff0c\\u8ffd\\u8e2a\\u8bfb\\u53d6\\u8fd9\\u4e9b\\u6587\\u4ef6\\uff08\\u8ffd\\u8e2a\\u6587\\u4ef6\\u7684\\u53d8\\u5316\\uff0c\\u4e0d\\u505c\\u7684\\u8bfb\\uff09\\uff0c\\u5e76\\u4e14\\u8f6c\\u53d1\\u8fd9\\u4e9b\\u4fe1\\u606f\\u5230elasticsearch\\u6216\\u8005logstarsh\\u4e2d\\u5b58\\u653e\\u3002\\n\\n\\u4ee5\\u4e0b\\u662ffilebeat\\u7684\\u5de5\\u4f5c\\u6d41\\u7a0b\\uff1a\\u5f53\\u4f60\\u5f00\\u542ffilebeat\\u7a0b\\u5e8f\\u7684\\u65f6\\u5019\\uff0c\\u5b83\\u4f1a\\u542f\\u52a8\\u4e00\\u4e2a\\u6216\\u591a\\u4e2a\\u63a2\\u6d4b\\u5668\\uff08prospectors\\uff09\\u53bb\\u68c0\\u6d4b\\u4f60\\u6307\\u5b9a\\u7684\\u65e5\\u5fd7\\u76ee\\u5f55\\u6216\\u6587\\u4ef6\\uff0c\\u5bf9\\u4e8e\\u63a2\\u6d4b\\u5668\\u627e\\u51fa\\u7684\\u6bcf\\u4e00\\u4e2a\\u65e5\\u5fd7\\u6587\\u4ef6\\uff0cfilebeat\\u542f\\u52a8\\u6536\\u5272\\u8fdb\\u7a0b\\uff08harvester\\uff09\\uff0c\\u6bcf\\u4e00\\u4e2a\\u6536\\u5272\\u8fdb\\u7a0b\\u8bfb\\u53d6\\u4e00\\u4e2a\\u65e5\\u5fd7\\u6587\\u4ef6\\u7684\\u65b0\\u5185\\u5bb9\\uff0c\\u5e76\\u53d1\\u9001\\u8fd9\\u4e9b\\u65b0\\u7684\\u65e5\\u5fd7\\u6570\\u636e\\u5230\\u5904\\u7406\\u7a0b\\u5e8f\\uff08spooler\\uff09\\uff0c\\u5904\\u7406\\u7a0b\\u5e8f\\u4f1a\\u96c6\\u5408\\u8fd9\\u4e9b\\u4e8b\\u4ef6\\uff0c\\u6700\\u540efilebeat\\u4f1a\\u53d1\\u9001\\u96c6\\u5408\\u7684\\u6570\\u636e\\u5230\\u4f60\\u6307\\u5b9a\\u7684\\u5730\\u70b9\\u3002\\n\\n(\\u4e2a\\u4eba\\u7406\\u89e3\\uff0cfilebeat\\u662f\\u4e00\\u4e2a\\u8f7b\\u91cf\\u7ea7\\u7684logstash\\uff0c\\u5f53\\u4f60\\u9700\\u8981\\u6536\\u96c6\\u4fe1\\u606f\\u7684\\u673a\\u5668\\u914d\\u7f6e\\u6216\\u8d44\\u6e90\\u5e76\\u4e0d\\u662f\\u7279\\u522b\\u591a\\u65f6\\uff0c\\u4f7f\\u7528filebeat\\u6765\\u6536\\u96c6\\u65e5\\u5fd7\\u3002\\u65e5\\u5e38\\u4f7f\\u7528\\u4e2d\\uff0cfilebeat\\u5341\\u5206\\u7a33\\u5b9a\\uff0c\\u7b14\\u8005\\u6ca1\\u9047\\u5230\\u8fc7\\u5b95\\u673a\\u3002)\\n\\n![Alt text](http:\\/\\/or0z8sgc6.bkt.clouddn.com\\/image\\/jpg\\/filebate.png997621-20161227223331070-312389171.png)\\n \\n\\n#### \\u4e8c\\u3001Filebeat\\u5165\\u95e8\\n\\u5f00\\u59cb\\u914d\\u7f6e\\u4f7f\\u7528filebeat\\u4e4b\\u524d\\uff0c\\u4f60\\u9700\\u8981\\u5b89\\u88c5\\u5e76\\u914d\\u7f6e\\u597d\\u8fd9\\u4e9b\\u4f9d\\u8d56\\u7a0b\\u5e8f\\uff1a\\n\\nElasticsearch \\u4f5c\\u4e3a\\u5b58\\u50a8\\u548c\\u7d22\\u5f15\\u8fd9\\u4e9b\\u6570\\u636e\\u3002\\n\\nKibana \\u4f5c\\u4e3a\\u5c55\\u793a\\u5e73\\u53f0\\u3002\\n\\nLogstash\\uff08\\u53ef\\u9009\\uff09\\u53bb\\u63d2\\u5165\\u6570\\u636e\\u5230elasticsearch\\u3002\\n\\n\\u8be6\\u89c1 beat\\u548celastic\\u7684\\u5165\\u95e8 \\n\\n \\n\\n\\u5728\\u5b89\\u88c5\\u5b8c\\u6bd5elastic\\u96c6\\u7fa4\\u4e4b\\u540e\\uff0c\\u9605\\u8bfb\\u63a5\\u4e0b\\u6765\\u7684\\u9009\\u9879\\u5b66\\u4e60\\u600e\\u6837\\u5b89\\u88c5\\uff0c\\u914d\\u7f6e\\uff0c\\u4e0e\\u8fd0\\u884cfilebeat\\u3002\\n\\n \\n\\n##### \\u7b2c\\u4e00\\u6b65\\uff1a\\u5b89\\u88c5filebeat\\n\\u8bf7\\u9009\\u62e9\\u4f60\\u7cfb\\u7edf\\u4e2d\\u7684\\u4e0b\\u8f7d\\u5b89\\u88c5\\u547d\\u4ee4\\u6765\\u4e0b\\u8f7d\\u5b89\\u88c5filebeat\\u3002(deb for Debian\\/Ubuntu, rpm for Redhat\\/Centos\\/Fedora, mac for OS X, and win for Windows).\\n\\n\\u5982\\u679c\\u4f60\\u4f7f\\u7528yum\\u6216\\u8005apt\\uff0c\\u4f60\\u53ef\\u4ee5\\u4ece\\u6211\\u4eec\\u7684\\u5b89\\u88c5\\u4ed3\\u5e93\\u4e2d\\u66f4\\u65b9\\u4fbf\\u7684\\u5b89\\u88c5\\u6216\\u66f4\\u65b0\\u5230\\u65b0\\u7248\\u672c\\u3002\\n\\n \\n\\ndeb:\\n```\\ncurl -L -O https:\\/\\/artifacts.elastic.co\\/downloads\\/beats\\/filebeat\\/filebeat-5.1.1-amd64.deb\\n\\nsudo dpkg -i filebeat-5.1.1-amd64.deb\\n```\\nrpm:\\n```\\ncurl -L -O https:\\/\\/artifacts.elastic.co\\/downloads\\/beats\\/filebeat\\/filebeat-5.1.1-x86_64.rpm\\n\\nsudo rpm -vi filebeat-5.1.1-x86_64.rpm\\n```\\nmac:\\n```\\ncurl -L -O https:\\/\\/artifacts.elastic.co\\/downloads\\/beats\\/filebeat\\/filebeat-5.1.1-darwin-x86_64.tar.gz\\n\\ntar xzvf filebeat-5.1.1-darwin-x86_64.tar.gz\\n```\\nwin:\\n\\n\\u7565\\u3002\\n\\n \\n\\n##### \\u7b2c\\u4e8c\\u6b65\\uff1a\\u914d\\u7f6efilebeat\\n\\u7f16\\u8f91\\u914d\\u7f6e\\u6587\\u4ef6\\u6765\\u914d\\u7f6efilebeat\\uff0c\\u5bf9\\u4e8erpm\\u6216\\u8005deb\\u6765\\u8bf4\\uff0c\\u914d\\u7f6e\\u6587\\u4ef6\\u662f\\/etc\\/filebeat\\/filebeat.yml\\u8fd9\\u4e2a\\u6587\\u4ef6\\uff0c\\u5bf9\\u4e8eMAC\\u6216\\u8005win\\u6765\\u8bf4\\uff0c\\u8bf7\\u67e5\\u770b\\u4f60\\u7684\\u89e3\\u538b\\u6587\\u4ef6\\u4e2d\\u3002\\n\\n\\u8fd9\\u91cc\\u6709\\u4e00\\u4e2a\\u7b80\\u5355\\u7684filebeat\\u7684\\u914d\\u7f6e\\u6587\\u4ef6filebeat.yml\\u7684\\u6837\\u672c\\uff0cfilebeat\\u4f1a\\u4f7f\\u7528\\u5f88\\u591a\\u9ed8\\u8ba4\\u7684\\u9009\\u9879\\u3002\\n```\\nfilebeat.prospectors:\\n\\n- input_type: log\\n\\n  paths:\\n\\n    - \\/var\\/log\\/*.log\\n\\n#- c:\\\\programdata\\\\elasticsearch\\\\logs\\\\*\\n```\\n \\n\\n\\u8ba9\\u6211\\u4eec\\u6765\\u914d\\u7f6efilebeat\\uff1a\\n\\n1\\u3001\\u5b9a\\u4e49\\u4f60\\u7684\\u65e5\\u5fd7\\u6587\\u4ef6\\u7684\\u8def\\u5f84\\uff08\\u4e00\\u4e2a\\u6216\\u591a\\u4e2a\\uff09\\n\\n\\u5bf9\\u4e8e\\u5927\\u591a\\u6570\\u7684\\u57fa\\u672cfilebeat\\u914d\\u7f6e\\uff0c\\u4f60\\u53ef\\u4ee5\\u5b9a\\u4e49\\u4e00\\u4e2a\\u5355\\u4e00\\u63a2\\u6d4b\\u5668\\u9488\\u5bf9\\u4e00\\u4e2a\\u5355\\u4e00\\u7684\\u8def\\u5f84\\uff0c\\u4f8b\\u5982\\uff1a\\n\\n \\n```\\nfilebeat.prospectors:\\n\\n- input_type: log\\n\\n  paths:\\n\\n    - \\/var\\/log\\/*.log\\n```\\n >json.keys_under_root: true \\u82e5\\u6536\\u53d6\\u65e5\\u5fd7\\u683c\\u5f0f\\u4e3ajson\\u7684log\\uff0c\\u8bf7\\u5f00\\u542f\\u6b64\\u914d\\u7f6e\\n\\n \\n\\n\\u5728\\u8fd9\\u4e2a\\u4f8b\\u5b50\\u4e2d\\uff0c\\u63a2\\u6d4b\\u5668\\u4f1a\\u6536\\u96c6\\/var\\/log\\/*.log\\u7684\\u6240\\u6709\\u5339\\u914d\\u6587\\u4ef6\\uff0c\\u8fd9\\u610f\\u5473\\u8fd9filebeat\\u4f1a\\u624b\\u673a\\u6240\\u6709\\u7684\\/var\\/log\\u4e0b\\u4ee5.log\\u7ed3\\u5c3e\\u7684\\u6587\\u4ef6\\uff0c\\u6b64\\u5904\\u8fd8\\u652f\\u6301Golang Glob\\u652f\\u6301\\u7684\\u6240\\u6709\\u6a21\\u5f0f\\u3002\\n\\n\\u5728\\u9884\\u5b9a\\u4e49\\u7ea7\\u522b\\u7684\\u5b50\\u76ee\\u5f55\\u4e2d\\u83b7\\u53d6\\u6240\\u6709\\u6587\\u4ef6\\uff0c\\u53ef\\u4ee5\\u4f7f\\u7528\\u8fd9\\u4e2a\\u914d\\u7f6e\\uff1a\\/var\\/log\\/*\\/*.log\\uff0c\\u8fd9\\u4f1a\\u627e\\u5230\\/var\\/log\\u4e0b\\u6240\\u6709\\u5b50\\u76ee\\u5f55\\u4e2d\\u6240\\u6709\\u7684\\u4ee5.log\\u7ed3\\u5c3e\\u7684\\u6587\\u4ef6\\u3002\\u4f46\\u5b83\\u5e76\\u4e0d\\u4f1a\\u627e\\u5230\\/var\\/log\\u6587\\u4ef6\\u5939\\u4e0b\\u7684\\u4ee5.log\\u7ed3\\u5c3e\\u7684\\u6587\\u4ef6\\u3002\\u73b0\\u5728\\u5b83\\u8fd8\\u4e0d\\u80fd\\u9012\\u5f52\\u7684\\u5728\\u6240\\u6709\\u5b50\\u76ee\\u5f55\\u4e2d\\u83b7\\u53d6\\u6240\\u6709\\u7684\\u65e5\\u5fd7\\u6587\\u4ef6\\u3002\\n\\n\\u5982\\u679c\\u4f60\\u8bbe\\u7f6e\\u8f93\\u51fa\\u5230elasticsearch\\u4e2d\\uff0c\\u90a3\\u4e48\\u4f60\\u9700\\u8981\\u5728filebeat\\u7684\\u914d\\u7f6e\\u6587\\u4ef6\\u4e2d\\u8bbe\\u7f6eelasticsearch\\u7684IP\\u5730\\u5740\\u4e0e\\u7aef\\u53e3\\u3002\\n\\n \\n```\\noutput.elasticsearch:\\n\\n  hosts: [\\"192.168.1.42:9200\\"]\\n```\\n \\n\\n\\u5982\\u679c\\u4f60\\u8bbe\\u7f6e\\u8f93\\u51fa\\u5230logstarsh\\uff0c\\u90a3\\u4e48\\u8bf7\\u53c2\\u8003\\u7b2c\\u4e09\\u6b65\\uff0c\\u914d\\u7f6efilebeat\\u4f7f\\u7528logstarsh\\n\\n\\u7b2c\\u4e09\\u6b65\\uff1a\\u914d\\u7f6efilebeat\\u6216elasticsearch\\u4f7f\\u7528logstarsh\\n\\u5982\\u679c\\u8981\\u4f7f\\u7528logstash\\u5bf9filebeat\\u6536\\u96c6\\u8d77\\u6765\\u7684\\u6570\\u636e\\u6267\\u884c\\u5176\\u4ed6\\u5904\\u7406\\uff0c\\u4f60\\u9700\\u8981\\u914d\\u7f6efilebeat\\u4f7f\\u7528logstash\\u3002\\n\\n\\u4f60\\u9700\\u8981\\u7f16\\u8f91filebeat\\u7684\\u914d\\u7f6e\\u6587\\u4ef6\\uff0c\\u6ce8\\u91caelasticsearch\\u7684\\u9009\\u9879\\uff0c\\u5e76\\u6253\\u5f00logstash\\u7684\\u914d\\u7f6e\\u7684\\u6ce8\\u91ca\\uff1a\\n\\n \\n\\n----------------------------- Logstash output --------------------------------\\n```\\noutput.logstash:\\n\\n  hosts: [\\"127.0.0.1:5044\\"]\\n```\\n \\n\\nhosts\\u9009\\u9879\\u9700\\u8981\\u6307\\u660elogstash\\u670d\\u52a1\\u6240\\u76d1\\u542c\\u7684\\u5730\\u5740\\u548c\\u5b83\\u7684\\u7aef\\u53e3\\u3002\\n\\n\\u6ce8\\uff1a\\u82e5\\u8981\\u6d4b\\u8bd5\\u4f60\\u7684\\u914d\\u7f6e\\u6587\\u4ef6\\uff0c\\u5207\\u6362\\u5230\\u4f60\\u5b89\\u88c5\\u597d\\u7684filebeat\\u7684\\u53ef\\u6267\\u884c\\u6587\\u4ef6\\u7684\\u76ee\\u5f55\\uff0c\\u7136\\u540e\\u5728\\u547d\\u4ee4\\u884c\\u8fd0\\u884c\\u4ee5\\u4e0b\\u9009\\u9879\\uff1a.\\/filebeat -configtest -e \\uff0c\\u786e\\u4fdd\\u60a8\\u7684\\u914d\\u7f6e\\u6587\\u4ef6\\u5728\\u9ed8\\u8ba4\\u914d\\u7f6e\\u6587\\u4ef6\\u76ee\\u5f55\\u4e0b\\uff0c\\u89c1 \\u76ee\\u5f55\\u5e03\\u5c40\\u3002\\n\\n \\n\\n\\u5728\\u4f7f\\u7528\\u8fd9\\u4e2a\\u914d\\u7f6e\\u4e4b\\u524d\\uff0c\\u4f60\\u9700\\u8981\\u63d0\\u524d\\u8bbe\\u7f6e\\u597dlogstash\\u6765\\u63a5\\u6536\\u6570\\u636e\\u3002\\n\\n \\n\\n\\u5982\\u679c\\u60f3\\u4e0d\\u901a\\u8fc7logstash\\u76f4\\u63a5\\u5165\\u5e93\\u5230elasticsearch\\uff0c\\u53ef\\u6ce8\\u91ca\\u6389logstash\\u5165\\u5e93\\u90e8\\u5206\\uff0c\\u76f4\\u63a5\\u6253\\u5f00elasticsearch\\u5165\\u5e93\\u90e8\\u5206\\u5373\\u53ef\\u3002\\n\\n \\n```\\noutput.elasticsearch:\\n\\n  hosts: [\\"localhost:9200\\"]\\n```\\n \\n\\n\\u7b2c\\u56db\\u6b65\\uff1a\\u542f\\u52a8filebeat\\nrpm\\u5b89\\u88c5\\uff1a\\n```\\nsudo \\/etc\\/init.d\\/filebeat start\\n```\\n \\n\\n\\u73b0\\u5728\\uff0cfilebeat\\u5df2\\u7ecf\\u51c6\\u5907\\u597d\\u8bfb\\u53d6\\u4f60\\u7684\\u65e5\\u5fd7\\u6587\\u4ef6\\u5e76\\u53d1\\u9001\\u5230\\u4f60\\u5b9a\\u4e49\\u7684\\u8f93\\u51fa\\u4e2d\\u4e86\\uff01","html":"<blockquote>\\n<p>Filebeat\\u4e2d\\u6587\\u6307\\u5357<\\/p>\\n<\\/blockquote>\\n<ul>\\n<li>\\n<p>\\u7ffb\\u8bd1\\u81ea\\uff1a<a href=\\"https:\\/\\/www.elastic.co\\/guide\\/en\\/beats\\/filebeat\\/current\\/index.html\\">https:\\/\\/www.elastic.co\\/guide\\/en\\/beats\\/filebeat\\/current\\/index.html<\\/a><\\/p>\\n<\\/li>\\n<li>\\u8f6c\\u8f7d\\u81ea\\uff1a<a href=\\"https:\\/\\/www.cnblogs.com\\/kerwinC\\/p\\/6227768.html\\">https:\\/\\/www.cnblogs.com\\/kerwinC\\/p\\/6227768.html<\\/a><br \\/>\\npower by kerwin<\\/li>\\n<\\/ul>\\n<h4>\\u4e00\\u3001\\u6982\\u8ff0<\\/h4>\\n<p>Filebeat\\u662f\\u4e00\\u4e2a\\u65e5\\u5fd7\\u6587\\u4ef6\\u6258\\u8fd0\\u5de5\\u5177\\uff0c\\u5728\\u4f60\\u7684\\u670d\\u52a1\\u5668\\u4e0a\\u5b89\\u88c5\\u5ba2\\u6237\\u7aef\\u540e\\uff0cfilebeat\\u4f1a\\u76d1\\u63a7\\u65e5\\u5fd7\\u76ee\\u5f55\\u6216\\u8005\\u6307\\u5b9a\\u7684\\u65e5\\u5fd7\\u6587\\u4ef6\\uff0c\\u8ffd\\u8e2a\\u8bfb\\u53d6\\u8fd9\\u4e9b\\u6587\\u4ef6\\uff08\\u8ffd\\u8e2a\\u6587\\u4ef6\\u7684\\u53d8\\u5316\\uff0c\\u4e0d\\u505c\\u7684\\u8bfb\\uff09\\uff0c\\u5e76\\u4e14\\u8f6c\\u53d1\\u8fd9\\u4e9b\\u4fe1\\u606f\\u5230elasticsearch\\u6216\\u8005logstarsh\\u4e2d\\u5b58\\u653e\\u3002<\\/p>\\n<p>\\u4ee5\\u4e0b\\u662ffilebeat\\u7684\\u5de5\\u4f5c\\u6d41\\u7a0b\\uff1a\\u5f53\\u4f60\\u5f00\\u542ffilebeat\\u7a0b\\u5e8f\\u7684\\u65f6\\u5019\\uff0c\\u5b83\\u4f1a\\u542f\\u52a8\\u4e00\\u4e2a\\u6216\\u591a\\u4e2a\\u63a2\\u6d4b\\u5668\\uff08prospectors\\uff09\\u53bb\\u68c0\\u6d4b\\u4f60\\u6307\\u5b9a\\u7684\\u65e5\\u5fd7\\u76ee\\u5f55\\u6216\\u6587\\u4ef6\\uff0c\\u5bf9\\u4e8e\\u63a2\\u6d4b\\u5668\\u627e\\u51fa\\u7684\\u6bcf\\u4e00\\u4e2a\\u65e5\\u5fd7\\u6587\\u4ef6\\uff0cfilebeat\\u542f\\u52a8\\u6536\\u5272\\u8fdb\\u7a0b\\uff08harvester\\uff09\\uff0c\\u6bcf\\u4e00\\u4e2a\\u6536\\u5272\\u8fdb\\u7a0b\\u8bfb\\u53d6\\u4e00\\u4e2a\\u65e5\\u5fd7\\u6587\\u4ef6\\u7684\\u65b0\\u5185\\u5bb9\\uff0c\\u5e76\\u53d1\\u9001\\u8fd9\\u4e9b\\u65b0\\u7684\\u65e5\\u5fd7\\u6570\\u636e\\u5230\\u5904\\u7406\\u7a0b\\u5e8f\\uff08spooler\\uff09\\uff0c\\u5904\\u7406\\u7a0b\\u5e8f\\u4f1a\\u96c6\\u5408\\u8fd9\\u4e9b\\u4e8b\\u4ef6\\uff0c\\u6700\\u540efilebeat\\u4f1a\\u53d1\\u9001\\u96c6\\u5408\\u7684\\u6570\\u636e\\u5230\\u4f60\\u6307\\u5b9a\\u7684\\u5730\\u70b9\\u3002<\\/p>\\n<p>(\\u4e2a\\u4eba\\u7406\\u89e3\\uff0cfilebeat\\u662f\\u4e00\\u4e2a\\u8f7b\\u91cf\\u7ea7\\u7684logstash\\uff0c\\u5f53\\u4f60\\u9700\\u8981\\u6536\\u96c6\\u4fe1\\u606f\\u7684\\u673a\\u5668\\u914d\\u7f6e\\u6216\\u8d44\\u6e90\\u5e76\\u4e0d\\u662f\\u7279\\u522b\\u591a\\u65f6\\uff0c\\u4f7f\\u7528filebeat\\u6765\\u6536\\u96c6\\u65e5\\u5fd7\\u3002\\u65e5\\u5e38\\u4f7f\\u7528\\u4e2d\\uff0cfilebeat\\u5341\\u5206\\u7a33\\u5b9a\\uff0c\\u7b14\\u8005\\u6ca1\\u9047\\u5230\\u8fc7\\u5b95\\u673a\\u3002)<\\/p>\\n<p><img src=\\"http:\\/\\/or0z8sgc6.bkt.clouddn.com\\/image\\/jpg\\/filebate.png997621-20161227223331070-312389171.png\\" alt=\\"Alt text\\" \\/><\\/p>\\n<h4>\\u4e8c\\u3001Filebeat\\u5165\\u95e8<\\/h4>\\n<p>\\u5f00\\u59cb\\u914d\\u7f6e\\u4f7f\\u7528filebeat\\u4e4b\\u524d\\uff0c\\u4f60\\u9700\\u8981\\u5b89\\u88c5\\u5e76\\u914d\\u7f6e\\u597d\\u8fd9\\u4e9b\\u4f9d\\u8d56\\u7a0b\\u5e8f\\uff1a<\\/p>\\n<p>Elasticsearch \\u4f5c\\u4e3a\\u5b58\\u50a8\\u548c\\u7d22\\u5f15\\u8fd9\\u4e9b\\u6570\\u636e\\u3002<\\/p>\\n<p>Kibana \\u4f5c\\u4e3a\\u5c55\\u793a\\u5e73\\u53f0\\u3002<\\/p>\\n<p>Logstash\\uff08\\u53ef\\u9009\\uff09\\u53bb\\u63d2\\u5165\\u6570\\u636e\\u5230elasticsearch\\u3002<\\/p>\\n<p>\\u8be6\\u89c1 beat\\u548celastic\\u7684\\u5165\\u95e8 <\\/p>\\n<p>\\u5728\\u5b89\\u88c5\\u5b8c\\u6bd5elastic\\u96c6\\u7fa4\\u4e4b\\u540e\\uff0c\\u9605\\u8bfb\\u63a5\\u4e0b\\u6765\\u7684\\u9009\\u9879\\u5b66\\u4e60\\u600e\\u6837\\u5b89\\u88c5\\uff0c\\u914d\\u7f6e\\uff0c\\u4e0e\\u8fd0\\u884cfilebeat\\u3002<\\/p>\\n<h5>\\u7b2c\\u4e00\\u6b65\\uff1a\\u5b89\\u88c5filebeat<\\/h5>\\n<p>\\u8bf7\\u9009\\u62e9\\u4f60\\u7cfb\\u7edf\\u4e2d\\u7684\\u4e0b\\u8f7d\\u5b89\\u88c5\\u547d\\u4ee4\\u6765\\u4e0b\\u8f7d\\u5b89\\u88c5filebeat\\u3002(deb for Debian\\/Ubuntu, rpm for Redhat\\/Centos\\/Fedora, mac for OS X, and win for Windows).<\\/p>\\n<p>\\u5982\\u679c\\u4f60\\u4f7f\\u7528yum\\u6216\\u8005apt\\uff0c\\u4f60\\u53ef\\u4ee5\\u4ece\\u6211\\u4eec\\u7684\\u5b89\\u88c5\\u4ed3\\u5e93\\u4e2d\\u66f4\\u65b9\\u4fbf\\u7684\\u5b89\\u88c5\\u6216\\u66f4\\u65b0\\u5230\\u65b0\\u7248\\u672c\\u3002<\\/p>\\n<p>deb:<\\/p>\\n<pre><code>curl -L -O https:\\/\\/artifacts.elastic.co\\/downloads\\/beats\\/filebeat\\/filebeat-5.1.1-amd64.deb\\n\\nsudo dpkg -i filebeat-5.1.1-amd64.deb<\\/code><\\/pre>\\n<p>rpm:<\\/p>\\n<pre><code>curl -L -O https:\\/\\/artifacts.elastic.co\\/downloads\\/beats\\/filebeat\\/filebeat-5.1.1-x86_64.rpm\\n\\nsudo rpm -vi filebeat-5.1.1-x86_64.rpm<\\/code><\\/pre>\\n<p>mac:<\\/p>\\n<pre><code>curl -L -O https:\\/\\/artifacts.elastic.co\\/downloads\\/beats\\/filebeat\\/filebeat-5.1.1-darwin-x86_64.tar.gz\\n\\ntar xzvf filebeat-5.1.1-darwin-x86_64.tar.gz<\\/code><\\/pre>\\n<p>win:<\\/p>\\n<p>\\u7565\\u3002<\\/p>\\n<h5>\\u7b2c\\u4e8c\\u6b65\\uff1a\\u914d\\u7f6efilebeat<\\/h5>\\n<p>\\u7f16\\u8f91\\u914d\\u7f6e\\u6587\\u4ef6\\u6765\\u914d\\u7f6efilebeat\\uff0c\\u5bf9\\u4e8erpm\\u6216\\u8005deb\\u6765\\u8bf4\\uff0c\\u914d\\u7f6e\\u6587\\u4ef6\\u662f\\/etc\\/filebeat\\/filebeat.yml\\u8fd9\\u4e2a\\u6587\\u4ef6\\uff0c\\u5bf9\\u4e8eMAC\\u6216\\u8005win\\u6765\\u8bf4\\uff0c\\u8bf7\\u67e5\\u770b\\u4f60\\u7684\\u89e3\\u538b\\u6587\\u4ef6\\u4e2d\\u3002<\\/p>\\n<p>\\u8fd9\\u91cc\\u6709\\u4e00\\u4e2a\\u7b80\\u5355\\u7684filebeat\\u7684\\u914d\\u7f6e\\u6587\\u4ef6filebeat.yml\\u7684\\u6837\\u672c\\uff0cfilebeat\\u4f1a\\u4f7f\\u7528\\u5f88\\u591a\\u9ed8\\u8ba4\\u7684\\u9009\\u9879\\u3002<\\/p>\\n<pre><code>filebeat.prospectors:\\n\\n- input_type: log\\n\\n  paths:\\n\\n    - \\/var\\/log\\/*.log\\n\\n#- c:\\\\programdata\\\\elasticsearch\\\\logs\\\\*<\\/code><\\/pre>\\n<p>\\u8ba9\\u6211\\u4eec\\u6765\\u914d\\u7f6efilebeat\\uff1a<\\/p>\\n<p>1\\u3001\\u5b9a\\u4e49\\u4f60\\u7684\\u65e5\\u5fd7\\u6587\\u4ef6\\u7684\\u8def\\u5f84\\uff08\\u4e00\\u4e2a\\u6216\\u591a\\u4e2a\\uff09<\\/p>\\n<p>\\u5bf9\\u4e8e\\u5927\\u591a\\u6570\\u7684\\u57fa\\u672cfilebeat\\u914d\\u7f6e\\uff0c\\u4f60\\u53ef\\u4ee5\\u5b9a\\u4e49\\u4e00\\u4e2a\\u5355\\u4e00\\u63a2\\u6d4b\\u5668\\u9488\\u5bf9\\u4e00\\u4e2a\\u5355\\u4e00\\u7684\\u8def\\u5f84\\uff0c\\u4f8b\\u5982\\uff1a<\\/p>\\n<pre><code>filebeat.prospectors:\\n\\n- input_type: log\\n\\n  paths:\\n\\n    - \\/var\\/log\\/*.log<\\/code><\\/pre>\\n<blockquote>\\n<p>json.keys_under_root: true \\u82e5\\u6536\\u53d6\\u65e5\\u5fd7\\u683c\\u5f0f\\u4e3ajson\\u7684log\\uff0c\\u8bf7\\u5f00\\u542f\\u6b64\\u914d\\u7f6e<\\/p>\\n<\\/blockquote>\\n<p>\\u5728\\u8fd9\\u4e2a\\u4f8b\\u5b50\\u4e2d\\uff0c\\u63a2\\u6d4b\\u5668\\u4f1a\\u6536\\u96c6\\/var\\/log\\/*.log\\u7684\\u6240\\u6709\\u5339\\u914d\\u6587\\u4ef6\\uff0c\\u8fd9\\u610f\\u5473\\u8fd9filebeat\\u4f1a\\u624b\\u673a\\u6240\\u6709\\u7684\\/var\\/log\\u4e0b\\u4ee5.log\\u7ed3\\u5c3e\\u7684\\u6587\\u4ef6\\uff0c\\u6b64\\u5904\\u8fd8\\u652f\\u6301Golang Glob\\u652f\\u6301\\u7684\\u6240\\u6709\\u6a21\\u5f0f\\u3002<\\/p>\\n<p>\\u5728\\u9884\\u5b9a\\u4e49\\u7ea7\\u522b\\u7684\\u5b50\\u76ee\\u5f55\\u4e2d\\u83b7\\u53d6\\u6240\\u6709\\u6587\\u4ef6\\uff0c\\u53ef\\u4ee5\\u4f7f\\u7528\\u8fd9\\u4e2a\\u914d\\u7f6e\\uff1a\\/var\\/log\\/<em>\\/<\\/em>.log\\uff0c\\u8fd9\\u4f1a\\u627e\\u5230\\/var\\/log\\u4e0b\\u6240\\u6709\\u5b50\\u76ee\\u5f55\\u4e2d\\u6240\\u6709\\u7684\\u4ee5.log\\u7ed3\\u5c3e\\u7684\\u6587\\u4ef6\\u3002\\u4f46\\u5b83\\u5e76\\u4e0d\\u4f1a\\u627e\\u5230\\/var\\/log\\u6587\\u4ef6\\u5939\\u4e0b\\u7684\\u4ee5.log\\u7ed3\\u5c3e\\u7684\\u6587\\u4ef6\\u3002\\u73b0\\u5728\\u5b83\\u8fd8\\u4e0d\\u80fd\\u9012\\u5f52\\u7684\\u5728\\u6240\\u6709\\u5b50\\u76ee\\u5f55\\u4e2d\\u83b7\\u53d6\\u6240\\u6709\\u7684\\u65e5\\u5fd7\\u6587\\u4ef6\\u3002<\\/p>\\n<p>\\u5982\\u679c\\u4f60\\u8bbe\\u7f6e\\u8f93\\u51fa\\u5230elasticsearch\\u4e2d\\uff0c\\u90a3\\u4e48\\u4f60\\u9700\\u8981\\u5728filebeat\\u7684\\u914d\\u7f6e\\u6587\\u4ef6\\u4e2d\\u8bbe\\u7f6eelasticsearch\\u7684IP\\u5730\\u5740\\u4e0e\\u7aef\\u53e3\\u3002<\\/p>\\n<pre><code>output.elasticsearch:\\n\\n  hosts: [\\"192.168.1.42:9200\\"]<\\/code><\\/pre>\\n<p>\\u5982\\u679c\\u4f60\\u8bbe\\u7f6e\\u8f93\\u51fa\\u5230logstarsh\\uff0c\\u90a3\\u4e48\\u8bf7\\u53c2\\u8003\\u7b2c\\u4e09\\u6b65\\uff0c\\u914d\\u7f6efilebeat\\u4f7f\\u7528logstarsh<\\/p>\\n<p>\\u7b2c\\u4e09\\u6b65\\uff1a\\u914d\\u7f6efilebeat\\u6216elasticsearch\\u4f7f\\u7528logstarsh<br \\/>\\n\\u5982\\u679c\\u8981\\u4f7f\\u7528logstash\\u5bf9filebeat\\u6536\\u96c6\\u8d77\\u6765\\u7684\\u6570\\u636e\\u6267\\u884c\\u5176\\u4ed6\\u5904\\u7406\\uff0c\\u4f60\\u9700\\u8981\\u914d\\u7f6efilebeat\\u4f7f\\u7528logstash\\u3002<\\/p>\\n<p>\\u4f60\\u9700\\u8981\\u7f16\\u8f91filebeat\\u7684\\u914d\\u7f6e\\u6587\\u4ef6\\uff0c\\u6ce8\\u91caelasticsearch\\u7684\\u9009\\u9879\\uff0c\\u5e76\\u6253\\u5f00logstash\\u7684\\u914d\\u7f6e\\u7684\\u6ce8\\u91ca\\uff1a<\\/p>\\n<p>----------------------------- Logstash output --------------------------------<\\/p>\\n<pre><code>output.logstash:\\n\\n  hosts: [\\"127.0.0.1:5044\\"]<\\/code><\\/pre>\\n<p>hosts\\u9009\\u9879\\u9700\\u8981\\u6307\\u660elogstash\\u670d\\u52a1\\u6240\\u76d1\\u542c\\u7684\\u5730\\u5740\\u548c\\u5b83\\u7684\\u7aef\\u53e3\\u3002<\\/p>\\n<p>\\u6ce8\\uff1a\\u82e5\\u8981\\u6d4b\\u8bd5\\u4f60\\u7684\\u914d\\u7f6e\\u6587\\u4ef6\\uff0c\\u5207\\u6362\\u5230\\u4f60\\u5b89\\u88c5\\u597d\\u7684filebeat\\u7684\\u53ef\\u6267\\u884c\\u6587\\u4ef6\\u7684\\u76ee\\u5f55\\uff0c\\u7136\\u540e\\u5728\\u547d\\u4ee4\\u884c\\u8fd0\\u884c\\u4ee5\\u4e0b\\u9009\\u9879\\uff1a.\\/filebeat -configtest -e \\uff0c\\u786e\\u4fdd\\u60a8\\u7684\\u914d\\u7f6e\\u6587\\u4ef6\\u5728\\u9ed8\\u8ba4\\u914d\\u7f6e\\u6587\\u4ef6\\u76ee\\u5f55\\u4e0b\\uff0c\\u89c1 \\u76ee\\u5f55\\u5e03\\u5c40\\u3002<\\/p>\\n<p>\\u5728\\u4f7f\\u7528\\u8fd9\\u4e2a\\u914d\\u7f6e\\u4e4b\\u524d\\uff0c\\u4f60\\u9700\\u8981\\u63d0\\u524d\\u8bbe\\u7f6e\\u597dlogstash\\u6765\\u63a5\\u6536\\u6570\\u636e\\u3002<\\/p>\\n<p>\\u5982\\u679c\\u60f3\\u4e0d\\u901a\\u8fc7logstash\\u76f4\\u63a5\\u5165\\u5e93\\u5230elasticsearch\\uff0c\\u53ef\\u6ce8\\u91ca\\u6389logstash\\u5165\\u5e93\\u90e8\\u5206\\uff0c\\u76f4\\u63a5\\u6253\\u5f00elasticsearch\\u5165\\u5e93\\u90e8\\u5206\\u5373\\u53ef\\u3002<\\/p>\\n<pre><code>output.elasticsearch:\\n\\n  hosts: [\\"localhost:9200\\"]<\\/code><\\/pre>\\n<p>\\u7b2c\\u56db\\u6b65\\uff1a\\u542f\\u52a8filebeat<br \\/>\\nrpm\\u5b89\\u88c5\\uff1a<\\/p>\\n<pre><code>sudo \\/etc\\/init.d\\/filebeat start<\\/code><\\/pre>\\n<p>\\u73b0\\u5728\\uff0cfilebeat\\u5df2\\u7ecf\\u51c6\\u5907\\u597d\\u8bfb\\u53d6\\u4f60\\u7684\\u65e5\\u5fd7\\u6587\\u4ef6\\u5e76\\u53d1\\u9001\\u5230\\u4f60\\u5b9a\\u4e49\\u7684\\u8f93\\u51fa\\u4e2d\\u4e86\\uff01<\\/p>"}', NULL, 'ELK工具链之一Filebeat日志转储工具', 0, 0, 175, '2018-03-04 16:58:00', '2018-03-05 01:51:13', '2018-05-25 22:09:11', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL,
  `parent_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `path`, `description`, `image_url`, `created_at`, `updated_at`) VALUES
(11, 0, '文章', 'index', '主页文章', NULL, '2017-06-04 06:13:05', '2017-06-04 06:13:05'),
(12, 0, 'PHP', '/php', 'php', NULL, '2017-06-08 23:06:19', '2018-03-05 02:30:44'),
(13, 0, 'linux', 'linux', 'linux', NULL, '2017-06-08 23:06:31', '2017-06-08 23:06:31'),
(14, 0, 'js', 'js', 'js', NULL, '2017-06-08 23:06:46', '2017-06-08 23:06:46'),
(15, 0, 'git', 'git', 'git', NULL, '2017-07-26 19:35:50', '2017-07-26 19:35:50'),
(16, 0, 'docker', 'docker', NULL, NULL, '2018-03-04 22:21:35', '2018-03-04 22:21:41'),
(17, 0, 'go', 'go', NULL, NULL, '2018-03-05 00:15:39', '2018-03-05 00:15:39'),
(18, 0, '工具', 'tool', NULL, NULL, '2018-03-05 00:37:40', '2018-03-05 00:37:40'),
(19, 0, 'database', 'database', '数据库', NULL, '2018-03-05 01:12:46', '2018-03-05 01:12:46');

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `commentable_id` int(10) unsigned NOT NULL,
  `commentable_type` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `commentable_id`, `commentable_type`, `content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 19, 'discussions', '{"raw":"Quod tempora earum quod consequatur. Est rerum amet facilis. Incidunt vitae rerum soluta.","html":"<p>Quod tempora earum quod consequatur. Est rerum amet facilis. Incidunt vitae rerum soluta.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:32', '2017-06-04 06:16:32'),
(2, 2, 3, 'articles', '{"raw":"Aut voluptatibus ut et. Voluptatibus dolores explicabo necessitatibus officia consectetur ea esse. Numquam odit labore voluptatem illum vel ipsam eum. Aspernatur voluptatibus itaque qui excepturi ratione.","html":"<p>Aut voluptatibus ut et. Voluptatibus dolores explicabo necessitatibus officia consectetur ea esse. Numquam odit labore voluptatem illum vel ipsam eum. Aspernatur voluptatibus itaque qui excepturi ratione.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:33', '2017-06-04 06:16:33'),
(3, 7, 19, 'articles', '{"raw":"Rerum nihil voluptas voluptatem laudantium debitis ut. Fugit et praesentium corrupti mollitia nesciunt enim aspernatur. Doloremque dolorem mollitia rerum.","html":"<p>Rerum nihil voluptas voluptatem laudantium debitis ut. Fugit et praesentium corrupti mollitia nesciunt enim aspernatur. Doloremque dolorem mollitia rerum.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:33', '2017-06-04 06:16:33'),
(4, 6, 3, 'discussions', '{"raw":"Maxime vel debitis voluptates id sunt ut. Itaque sapiente reprehenderit culpa velit corrupti cum. Est eaque vel sunt tempora omnis. Dolores sit autem accusamus corporis suscipit.","html":"<p>Maxime vel debitis voluptates id sunt ut. Itaque sapiente reprehenderit culpa velit corrupti cum. Est eaque vel sunt tempora omnis. Dolores sit autem accusamus corporis suscipit.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:34', '2017-06-04 06:16:34'),
(5, 3, 6, 'discussions', '{"raw":"Et aut libero officia. Sed recusandae aut ipsa debitis autem cumque. A quibusdam libero rerum odio blanditiis.","html":"<p>Et aut libero officia. Sed recusandae aut ipsa debitis autem cumque. A quibusdam libero rerum odio blanditiis.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:37', '2017-06-04 06:16:37'),
(6, 8, 6, 'discussions', '{"raw":"Quia soluta odit saepe praesentium provident similique excepturi. Et aut aut voluptatibus ratione veritatis. Fuga quod velit sunt ea nostrum. Ut qui et qui maiores accusantium.","html":"<p>Quia soluta odit saepe praesentium provident similique excepturi. Et aut aut voluptatibus ratione veritatis. Fuga quod velit sunt ea nostrum. Ut qui et qui maiores accusantium.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:37', '2017-06-04 06:16:37'),
(7, 7, 19, 'discussions', '{"raw":"Ex alias saepe soluta ut inventore officiis. Ut dolor aut tempore voluptatem qui ut pariatur. Rerum autem quia maiores voluptatem laboriosam sequi ut.","html":"<p>Ex alias saepe soluta ut inventore officiis. Ut dolor aut tempore voluptatem qui ut pariatur. Rerum autem quia maiores voluptatem laboriosam sequi ut.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:42', '2017-06-04 06:16:42'),
(8, 1, 4, 'articles', '{"raw":"Libero odio ut ut rerum pariatur velit reiciendis. Quo modi sit officiis. Accusantium ex debitis maxime ut repellat est. Qui est et cumque minima saepe.","html":"<p>Libero odio ut ut rerum pariatur velit reiciendis. Quo modi sit officiis. Accusantium ex debitis maxime ut repellat est. Qui est et cumque minima saepe.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:38', '2017-06-04 06:16:38'),
(9, 2, 5, 'articles', '{"raw":"Eaque laboriosam error eos vel eum exercitationem. Ut molestias fugit nisi nisi eius. Facere architecto facilis exercitationem iste.","html":"<p>Eaque laboriosam error eos vel eum exercitationem. Ut molestias fugit nisi nisi eius. Facere architecto facilis exercitationem iste.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:42', '2017-06-04 06:16:42'),
(10, 5, 6, 'discussions', '{"raw":"Veritatis consequatur cupiditate accusamus magnam nobis cupiditate possimus. Vel quis delectus voluptates fuga sed qui ducimus ex. Fugit ut eaque inventore sit ut dolor dolor. Et aut ipsum sed omnis quia impedit aperiam illum.","html":"<p>Veritatis consequatur cupiditate accusamus magnam nobis cupiditate possimus. Vel quis delectus voluptates fuga sed qui ducimus ex. Fugit ut eaque inventore sit ut dolor dolor. Et aut ipsum sed omnis quia impedit aperiam illum.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:38', '2017-06-04 06:16:38'),
(11, 4, 14, 'articles', '{"raw":"Sapiente dolore quos labore sunt quidem. Iusto a consectetur in dignissimos. Voluptatum aliquid nihil soluta et.","html":"<p>Sapiente dolore quos labore sunt quidem. Iusto a consectetur in dignissimos. Voluptatum aliquid nihil soluta et.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:35', '2017-06-04 06:16:35'),
(12, 8, 9, 'articles', '{"raw":"Blanditiis eius et vitae. Quia eos quaerat vero ut enim. Doloribus ab omnis repudiandae.","html":"<p>Blanditiis eius et vitae. Quia eos quaerat vero ut enim. Doloribus ab omnis repudiandae.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:41', '2017-06-04 06:16:41'),
(13, 11, 12, 'discussions', '{"raw":"Aut illo magni minus eveniet iusto nam. Rem debitis et veniam sint necessitatibus voluptas sequi modi. Ducimus assumenda consequatur enim cupiditate.","html":"<p>Aut illo magni minus eveniet iusto nam. Rem debitis et veniam sint necessitatibus voluptas sequi modi. Ducimus assumenda consequatur enim cupiditate.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:39', '2017-06-04 06:16:39'),
(14, 2, 3, 'articles', '{"raw":"Suscipit libero omnis accusantium et. Aut qui asperiores aliquid reprehenderit quam eum. Nostrum voluptas nihil enim excepturi aspernatur magnam quo. Illum totam voluptatum repellat.","html":"<p>Suscipit libero omnis accusantium et. Aut qui asperiores aliquid reprehenderit quam eum. Nostrum voluptas nihil enim excepturi aspernatur magnam quo. Illum totam voluptatum repellat.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:41', '2017-06-04 06:16:41'),
(15, 3, 13, 'articles', '{"raw":"Aspernatur repellat qui voluptas nemo nulla iste magni. Velit alias aut laboriosam. Ut officiis iure voluptate praesentium.","html":"<p>Aspernatur repellat qui voluptas nemo nulla iste magni. Velit alias aut laboriosam. Ut officiis iure voluptate praesentium.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:41', '2017-06-04 06:16:41'),
(16, 3, 6, 'articles', '{"raw":"Quis quidem fugit enim nobis omnis aut hic. Iusto numquam est enim et qui consequuntur. Aut non voluptate magnam est porro reiciendis pariatur suscipit. Ipsam dolorem itaque nam et dolores voluptas sunt.","html":"<p>Quis quidem fugit enim nobis omnis aut hic. Iusto numquam est enim et qui consequuntur. Aut non voluptate magnam est porro reiciendis pariatur suscipit. Ipsam dolorem itaque nam et dolores voluptas sunt.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:40', '2017-06-04 06:16:40'),
(17, 2, 9, 'articles', '{"raw":"Nam velit necessitatibus temporibus. Corporis nihil quas est sequi pariatur sunt. Ut autem perferendis vel praesentium blanditiis temporibus similique doloremque. Nemo ut esse incidunt et veniam quidem.","html":"<p>Nam velit necessitatibus temporibus. Corporis nihil quas est sequi pariatur sunt. Ut autem perferendis vel praesentium blanditiis temporibus similique doloremque. Nemo ut esse incidunt et veniam quidem.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:43', '2017-06-04 06:16:43'),
(18, 1, 2, 'articles', '{"raw":"Sint unde deserunt magnam quam veniam nihil. Ipsum esse unde minima totam consequuntur amet saepe iure. Accusamus earum adipisci qui ullam eius quas velit.","html":"<p>Sint unde deserunt magnam quam veniam nihil. Ipsum esse unde minima totam consequuntur amet saepe iure. Accusamus earum adipisci qui ullam eius quas velit.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:42', '2017-06-04 06:16:42'),
(19, 9, 13, 'discussions', '{"raw":"Delectus saepe ut illum ut veritatis. Veniam accusamus eos assumenda et non in. Voluptas enim possimus sed iusto et fugit. Repudiandae consequatur ad reprehenderit voluptatibus nobis magni. Dolorem nisi iste deleniti sed.","html":"<p>Delectus saepe ut illum ut veritatis. Veniam accusamus eos assumenda et non in. Voluptas enim possimus sed iusto et fugit. Repudiandae consequatur ad reprehenderit voluptatibus nobis magni. Dolorem nisi iste deleniti sed.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:43', '2017-06-04 06:16:43'),
(20, 10, 14, 'discussions', '{"raw":"Earum omnis officia magni et quia. Incidunt sapiente quibusdam possimus enim quasi quam cupiditate minus. Dolore quia ex dicta nemo.","html":"<p>Earum omnis officia magni et quia. Incidunt sapiente quibusdam possimus enim quasi quam cupiditate minus. Dolore quia ex dicta nemo.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:44', '2017-06-04 06:16:44'),
(21, 10, 14, 'articles', '{"raw":"Quo molestias quasi itaque fugiat corrupti fugiat. Reprehenderit architecto expedita sit sit optio perferendis. Dolorem iure aspernatur qui blanditiis quia in eaque. Velit ut asperiores dolore et minima.","html":"<p>Quo molestias quasi itaque fugiat corrupti fugiat. Reprehenderit architecto expedita sit sit optio perferendis. Dolorem iure aspernatur qui blanditiis quia in eaque. Velit ut asperiores dolore et minima.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:45', '2017-06-04 06:16:45'),
(22, 6, 14, 'discussions', '{"raw":"Perferendis tempora modi sit illum consequatur doloribus consequatur. Officia eaque atque ducimus commodi. Itaque consequuntur architecto sit dicta.","html":"<p>Perferendis tempora modi sit illum consequatur doloribus consequatur. Officia eaque atque ducimus commodi. Itaque consequuntur architecto sit dicta.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:46', '2017-06-04 06:16:46'),
(23, 1, 17, 'discussions', '{"raw":"Sequi quis soluta sunt sapiente temporibus ea voluptas. Similique velit aliquid illum quos. Sunt doloremque amet sit autem molestiae alias et. Eum soluta maxime asperiores.","html":"<p>Sequi quis soluta sunt sapiente temporibus ea voluptas. Similique velit aliquid illum quos. Sunt doloremque amet sit autem molestiae alias et. Eum soluta maxime asperiores.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:46', '2017-06-04 06:16:46'),
(24, 2, 6, 'discussions', '{"raw":"Fuga eum blanditiis sed. In officia odit ratione optio. Rerum magni repellat quos velit repudiandae ipsum.","html":"<p>Fuga eum blanditiis sed. In officia odit ratione optio. Rerum magni repellat quos velit repudiandae ipsum.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:47', '2017-06-04 06:16:47'),
(25, 8, 3, 'articles', '{"raw":"Perferendis facere praesentium veritatis quia ab et vero. Repellat dolores eos voluptas asperiores eveniet dignissimos explicabo non. Voluptate laboriosam dolores delectus commodi consectetur dolore quis.","html":"<p>Perferendis facere praesentium veritatis quia ab et vero. Repellat dolores eos voluptas asperiores eveniet dignissimos explicabo non. Voluptate laboriosam dolores delectus commodi consectetur dolore quis.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:47', '2017-06-04 06:16:47'),
(26, 5, 18, 'articles', '{"raw":"Nostrum beatae quidem at ullam molestiae. Est consequuntur sit eveniet possimus. Soluta consectetur corrupti voluptatibus deleniti ducimus.","html":"<p>Nostrum beatae quidem at ullam molestiae. Est consequuntur sit eveniet possimus. Soluta consectetur corrupti voluptatibus deleniti ducimus.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:47', '2017-06-04 06:16:47'),
(27, 6, 4, 'discussions', '{"raw":"Ducimus suscipit voluptatem autem quia dolore omnis. Officia et architecto vel quam odio. Iusto iure impedit repellat officia magni provident rerum. Sint recusandae doloremque eum libero ut eos tempore.","html":"<p>Ducimus suscipit voluptatem autem quia dolore omnis. Officia et architecto vel quam odio. Iusto iure impedit repellat officia magni provident rerum. Sint recusandae doloremque eum libero ut eos tempore.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:48', '2017-06-04 06:16:48'),
(28, 1, 16, 'articles', '{"raw":"Repudiandae temporibus vel officia ut et repudiandae quae dolor. Qui tempora hic corporis qui accusantium esse. Vel praesentium necessitatibus enim illum. Quo quae quod debitis aut possimus labore totam.","html":"<p>Repudiandae temporibus vel officia ut et repudiandae quae dolor. Qui tempora hic corporis qui accusantium esse. Vel praesentium necessitatibus enim illum. Quo quae quod debitis aut possimus labore totam.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:53', '2017-06-04 06:16:53'),
(29, 6, 11, 'discussions', '{"raw":"Voluptatem omnis nulla qui dignissimos illum consequatur amet. Quisquam quo est est ab. Unde nisi fuga autem repudiandae consectetur mollitia. Totam asperiores minima dolorem eveniet tenetur.","html":"<p>Voluptatem omnis nulla qui dignissimos illum consequatur amet. Quisquam quo est est ab. Unde nisi fuga autem repudiandae consectetur mollitia. Totam asperiores minima dolorem eveniet tenetur.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:48', '2017-06-04 06:16:48'),
(30, 11, 8, 'articles', '{"raw":"Ab cumque quod fugit est. Rem ut rerum quia inventore. Expedita earum quos ratione earum earum sapiente. Dolorum rerum est accusamus ullam veniam.","html":"<p>Ab cumque quod fugit est. Rem ut rerum quia inventore. Expedita earum quos ratione earum earum sapiente. Dolorum rerum est accusamus ullam veniam.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:52', '2017-06-04 06:16:52'),
(31, 11, 12, 'discussions', '{"raw":"Aut est qui minima rerum doloribus. Corrupti omnis laboriosam sit et id ratione dolores perferendis. Et voluptatem quia sit vitae non quis. Accusamus aut eos molestiae et. Incidunt praesentium autem sit laudantium amet doloremque.","html":"<p>Aut est qui minima rerum doloribus. Corrupti omnis laboriosam sit et id ratione dolores perferendis. Et voluptatem quia sit vitae non quis. Accusamus aut eos molestiae et. Incidunt praesentium autem sit laudantium amet doloremque.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:51', '2017-06-04 06:16:51'),
(32, 10, 7, 'articles', '{"raw":"Adipisci saepe sit enim corporis optio commodi possimus. Odit ipsa minima ipsum voluptatem velit. Excepturi eligendi laboriosam qui a assumenda et.","html":"<p>Adipisci saepe sit enim corporis optio commodi possimus. Odit ipsa minima ipsum voluptatem velit. Excepturi eligendi laboriosam qui a assumenda et.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:50', '2017-06-04 06:16:50'),
(33, 7, 6, 'discussions', '{"raw":"Adipisci saepe dicta sint deleniti cumque dolorem quae. Sit quia et voluptate ut sit dicta. Nihil aut voluptatem magni accusamus et repudiandae.","html":"<p>Adipisci saepe dicta sint deleniti cumque dolorem quae. Sit quia et voluptate ut sit dicta. Nihil aut voluptatem magni accusamus et repudiandae.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:52', '2017-06-04 06:16:52'),
(34, 10, 6, 'discussions', '{"raw":"Dolor ut velit sed sit dolores. Laborum minima suscipit facilis quo. Voluptatem tempore atque mollitia similique in repudiandae recusandae. Qui vero recusandae ab nemo nihil ipsum voluptas dolor.","html":"<p>Dolor ut velit sed sit dolores. Laborum minima suscipit facilis quo. Voluptatem tempore atque mollitia similique in repudiandae recusandae. Qui vero recusandae ab nemo nihil ipsum voluptas dolor.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:52', '2017-06-04 06:16:52'),
(35, 9, 18, 'articles', '{"raw":"Ducimus ipsum magni sunt ut ex. Quaerat quia ab totam.","html":"<p>Ducimus ipsum magni sunt ut ex. Quaerat quia ab totam.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:57', '2017-06-04 06:16:57'),
(36, 6, 16, 'articles', '{"raw":"Ea odio voluptatem inventore eum reiciendis dignissimos. Aliquam consectetur maiores aperiam saepe placeat facere. Nihil vel veritatis expedita et voluptas in.","html":"<p>Ea odio voluptatem inventore eum reiciendis dignissimos. Aliquam consectetur maiores aperiam saepe placeat facere. Nihil vel veritatis expedita et voluptas in.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:58', '2017-06-04 06:16:58'),
(37, 9, 11, 'articles', '{"raw":"In a earum facere. Repudiandae eum autem consequatur eum quae velit ipsa. Adipisci commodi odit commodi doloremque. Sunt sed porro quos odio.","html":"<p>In a earum facere. Repudiandae eum autem consequatur eum quae velit ipsa. Adipisci commodi odit commodi doloremque. Sunt sed porro quos odio.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:53', '2017-06-04 06:16:53'),
(38, 2, 16, 'discussions', '{"raw":"Illo amet nisi tenetur quis et provident. Placeat et accusantium eos ut et minus. Et aperiam natus sed. Dolor est nostrum perspiciatis debitis odio.","html":"<p>Illo amet nisi tenetur quis et provident. Placeat et accusantium eos ut et minus. Et aperiam natus sed. Dolor est nostrum perspiciatis debitis odio.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:54', '2017-06-04 06:16:54'),
(39, 8, 9, 'discussions', '{"raw":"Voluptatem sequi qui tempore nobis vitae sunt enim. Et corrupti fugiat expedita sed quam consequatur enim autem. Amet adipisci quia exercitationem sunt id. Quis beatae voluptatum est illo possimus.","html":"<p>Voluptatem sequi qui tempore nobis vitae sunt enim. Et corrupti fugiat expedita sed quam consequatur enim autem. Amet adipisci quia exercitationem sunt id. Quis beatae voluptatum est illo possimus.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:58', '2017-06-04 06:16:58'),
(40, 1, 7, 'discussions', '{"raw":"Voluptas cupiditate aliquid quia saepe et sit. Sint reprehenderit reiciendis ab. Molestiae iste eaque in magni temporibus impedit. Dignissimos ullam possimus nostrum voluptas.","html":"<p>Voluptas cupiditate aliquid quia saepe et sit. Sint reprehenderit reiciendis ab. Molestiae iste eaque in magni temporibus impedit. Dignissimos ullam possimus nostrum voluptas.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:59', '2017-06-04 06:16:59'),
(41, 11, 8, 'discussions', '{"raw":"Assumenda vel similique quod quaerat. Iure dolor quisquam minima.","html":"<p>Assumenda vel similique quod quaerat. Iure dolor quisquam minima.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:16:55', '2017-06-04 06:16:55'),
(42, 8, 14, 'discussions', '{"raw":"Deserunt labore ducimus tenetur suscipit magni et. Omnis quia facere quidem accusamus vel quaerat dicta. Ut sed occaecati inventore voluptatum odit dicta. Voluptatum dolor et voluptatibus quo eum accusamus.","html":"<p>Deserunt labore ducimus tenetur suscipit magni et. Omnis quia facere quidem accusamus vel quaerat dicta. Ut sed occaecati inventore voluptatum odit dicta. Voluptatum dolor et voluptatibus quo eum accusamus.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:17:00', '2017-06-04 06:17:00'),
(43, 10, 5, 'articles', '{"raw":"Occaecati ut sed et tempore tenetur. Quaerat qui laboriosam eos. Sed dolores aspernatur necessitatibus atque aut doloremque et.","html":"<p>Occaecati ut sed et tempore tenetur. Quaerat qui laboriosam eos. Sed dolores aspernatur necessitatibus atque aut doloremque et.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:17:05', '2017-06-04 06:17:05'),
(44, 2, 2, 'articles', '{"raw":"Iusto dolores eum officia eligendi dolorem dolores. Minima at necessitatibus accusantium recusandae nisi minus eum magnam.","html":"<p>Iusto dolores eum officia eligendi dolorem dolores. Minima at necessitatibus accusantium recusandae nisi minus eum magnam.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:17:01', '2017-06-04 06:17:01'),
(45, 7, 11, 'articles', '{"raw":"Eos hic iusto doloremque. In sunt consequatur commodi saepe impedit. Odio molestiae nostrum et sed. Corrupti quia labore in cum.","html":"<p>Eos hic iusto doloremque. In sunt consequatur commodi saepe impedit. Odio molestiae nostrum et sed. Corrupti quia labore in cum.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:17:03', '2017-06-04 06:17:03'),
(46, 10, 4, 'discussions', '{"raw":"Est aut harum sed nesciunt ullam excepturi dolorum. Autem et aut omnis quo. Voluptas in id quasi iure. Non ut quam nemo sed recusandae sed ut.","html":"<p>Est aut harum sed nesciunt ullam excepturi dolorum. Autem et aut omnis quo. Voluptas in id quasi iure. Non ut quam nemo sed recusandae sed ut.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:17:01', '2017-06-04 06:17:01'),
(47, 7, 2, 'discussions', '{"raw":"Natus quasi accusamus iusto omnis at id. Qui id fugiat quo corporis.","html":"<p>Natus quasi accusamus iusto omnis at id. Qui id fugiat quo corporis.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:17:02', '2017-06-04 06:17:02'),
(48, 3, 20, 'discussions', '{"raw":"Consequatur voluptas quia vel consequatur impedit. Nemo aut ipsa facilis a sunt asperiores. Impedit voluptatum esse iusto veniam distinctio minus ab cum. Modi voluptatem quibusdam maiores veritatis.","html":"<p>Consequatur voluptas quia vel consequatur impedit. Nemo aut ipsa facilis a sunt asperiores. Impedit voluptatum esse iusto veniam distinctio minus ab cum. Modi voluptatem quibusdam maiores veritatis.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:17:03', '2017-06-04 06:17:03'),
(49, 4, 10, 'articles', '{"raw":"Doloremque voluptatem occaecati impedit aperiam id et. Natus quod sint iure qui esse. Voluptatem saepe eligendi numquam assumenda officia explicabo omnis aut. Et ex reiciendis veniam fuga aut.","html":"<p>Doloremque voluptatem occaecati impedit aperiam id et. Natus quod sint iure qui esse. Voluptatem saepe eligendi numquam assumenda officia explicabo omnis aut. Et ex reiciendis veniam fuga aut.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:17:04', '2017-06-04 06:17:04'),
(50, 1, 2, 'articles', '{"raw":"Mollitia nam et at dolorem molestiae sint. Sit atque ea deserunt assumenda voluptas eum. Voluptatem atque eos sapiente recusandae.","html":"<p>Mollitia nam et at dolorem molestiae sint. Sit atque ea deserunt assumenda voluptas eum. Voluptatem atque eos sapiente recusandae.<\\/p>"}', '2017-06-01 21:30:22', '2017-06-04 06:17:04', '2017-06-04 06:17:04'),
(51, 12, 21, 'articles', '{"raw":"\\u00b7\\u00b7\\u00b7\\nok\\n\\u00b7\\u00b7\\u00b7","html":"<p>\\u00b7\\u00b7\\u00b7<br \\/>\\nok<br \\/>\\n\\u00b7\\u00b7\\u00b7<\\/p>"}', '2017-06-04 17:20:04', '2017-06-04 17:20:11', '2017-06-04 17:20:11'),
(52, 12, 21, 'articles', '{"raw":"```\\ngood\\n```","html":"<pre><code>good<\\/code><\\/pre>"}', '2017-06-04 17:20:20', '2017-06-04 17:22:53', '2017-06-04 17:22:53'),
(53, 12, 21, 'articles', '{"raw":"asd","html":"<p>asd<\\/p>"}', '2017-06-04 17:23:04', '2017-06-04 17:23:04', NULL),
(54, 12, 21, 'discussions', '{"raw":"\\u00b7\\u00b7\\u00b7\\nsb\\n\\u00b7\\u00b7\\u00b7","html":"<p>\\u00b7\\u00b7\\u00b7<br \\/>\\nsb<br \\/>\\n\\u00b7\\u00b7\\u00b7<\\/p>"}', '2017-06-07 23:15:46', '2017-06-07 23:15:46', NULL),
(55, 12, 21, 'discussions', '{"raw":"```\\nsb\\n```","html":"<pre><code>sb<\\/code><\\/pre>"}', '2017-06-07 23:16:03', '2017-06-07 23:16:03', NULL),
(56, 12, 21, 'discussions', '{"raw":"[@php_fucker](http:\\/\\/blog.xinz.win\\/user\\/php_fucker) sb","html":"<p><a href=\\"http:\\/\\/blog.xinz.win\\/user\\/php_fucker\\">@php_fucker<\\/a> sb<\\/p>"}', '2017-06-07 23:16:15', '2017-06-07 23:16:15', NULL),
(57, 12, 75, 'articles', '{"raw":"###fuck","html":"<h3>fuck<\\/h3>"}', '2017-06-22 23:45:41', '2018-03-30 01:38:00', '2018-03-30 01:38:00');

-- --------------------------------------------------------

--
-- 表的结构 `discussions`
--

CREATE TABLE IF NOT EXISTS `discussions` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `last_user_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `discussions`
--

INSERT INTO `discussions` (`id`, `user_id`, `last_user_id`, `title`, `content`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 10, 10, 'Voluptas et sed blanditiis et.', '{"raw":"Est consequatur dolor et ratione qui placeat rerum. Sed velit quod nesciunt est aliquid voluptas et ex. Sapiente vero vel sed et et ipsam. Fuga cumque reiciendis delectus corrupti.","html":"<p>Est consequatur dolor et ratione qui placeat rerum. Sed velit quod nesciunt est aliquid voluptas et ex. Sapiente vero vel sed et et ipsam. Fuga cumque reiciendis delectus corrupti.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:11', '2017-06-04 06:18:11'),
(2, 4, 4, 'Est illum voluptas facere quas.', '{"raw":"Recusandae ut qui quaerat voluptatibus. Eum quo nesciunt quibusdam et explicabo molestias. Corrupti aut dolores assumenda voluptas. Omnis et eum error et.","html":"<p>Recusandae ut qui quaerat voluptatibus. Eum quo nesciunt quibusdam et explicabo molestias. Corrupti aut dolores assumenda voluptas. Omnis et eum error et.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:12', '2017-06-04 06:18:12'),
(3, 8, 8, 'Qui molestiae totam dolores omnis id quibusdam sed facere.', '{"raw":"Qui eligendi voluptatum dolorum dolor qui magnam. Perspiciatis amet occaecati et facilis dolorum laudantium aut quo. Voluptatem hic dolore nisi et quis.","html":"<p>Qui eligendi voluptatum dolorum dolor qui magnam. Perspiciatis amet occaecati et facilis dolorum laudantium aut quo. Voluptatem hic dolore nisi et quis.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:13', '2017-06-04 06:18:13'),
(4, 11, 11, 'Ipsum dolores quae totam debitis dicta ipsa.', '{"raw":"Assumenda praesentium autem excepturi laudantium repudiandae voluptatem tempore. Harum harum et est excepturi consequatur aliquid nihil. Consequatur expedita ratione perspiciatis amet consequatur.","html":"<p>Assumenda praesentium autem excepturi laudantium repudiandae voluptatem tempore. Harum harum et est excepturi consequatur aliquid nihil. Consequatur expedita ratione perspiciatis amet consequatur.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:14', '2017-06-04 06:18:14'),
(5, 4, 4, 'Laboriosam atque quis mollitia natus quam ex autem.', '{"raw":"Asperiores ut eveniet debitis et. Maiores maxime dolorum laboriosam voluptatem est. Quo eos voluptatem modi sint in. Rem deleniti quas ratione distinctio eius voluptatibus voluptate.","html":"<p>Asperiores ut eveniet debitis et. Maiores maxime dolorum laboriosam voluptatem est. Quo eos voluptatem modi sint in. Rem deleniti quas ratione distinctio eius voluptatibus voluptate.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:16', '2017-06-04 06:18:16'),
(6, 11, 11, 'Id quia rem possimus harum.', '{"raw":"Eveniet veritatis minus facilis quisquam quidem ut sit. Officia ut nihil quam. Voluptas enim error cumque id est.","html":"<p>Eveniet veritatis minus facilis quisquam quidem ut sit. Officia ut nihil quam. Voluptas enim error cumque id est.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:15', '2017-06-04 06:18:15'),
(7, 3, 3, 'Delectus omnis corporis laboriosam nam.', '{"raw":"Nisi qui dolorum accusantium. Voluptatem praesentium ut qui iusto. Recusandae rerum eos possimus.","html":"<p>Nisi qui dolorum accusantium. Voluptatem praesentium ut qui iusto. Recusandae rerum eos possimus.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:17', '2017-06-04 06:18:17'),
(8, 11, 11, 'Dignissimos earum est iusto id.', '{"raw":"Optio maxime iste quia quis illum. Voluptatum rerum sint eum nesciunt ipsam provident dolorem dolores. Corporis qui architecto quo libero et velit. Veritatis nulla atque aut.","html":"<p>Optio maxime iste quia quis illum. Voluptatum rerum sint eum nesciunt ipsam provident dolorem dolores. Corporis qui architecto quo libero et velit. Veritatis nulla atque aut.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:16', '2017-06-04 06:18:16'),
(9, 6, 6, 'Quod vero quam omnis rem.', '{"raw":"Consequatur omnis nihil architecto incidunt aut aut. Minima voluptates maxime rerum qui. Hic placeat culpa voluptatem reiciendis qui ratione non commodi. Voluptate repellendus reprehenderit tenetur eos magni quia cum. Animi excepturi nostrum rerum.","html":"<p>Consequatur omnis nihil architecto incidunt aut aut. Minima voluptates maxime rerum qui. Hic placeat culpa voluptatem reiciendis qui ratione non commodi. Voluptate repellendus reprehenderit tenetur eos magni quia cum. Animi excepturi nostrum rerum.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:18', '2017-06-04 06:18:18'),
(10, 3, 3, 'Pariatur distinctio at sed quia expedita sed.', '{"raw":"Dolorem ad et qui. Quo quia nesciunt repellendus ea esse. Facere sed repellendus explicabo nisi tempore beatae ut.","html":"<p>Dolorem ad et qui. Quo quia nesciunt repellendus ea esse. Facere sed repellendus explicabo nisi tempore beatae ut.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:17', '2017-06-04 06:18:17'),
(11, 6, 6, 'Perspiciatis dolorem optio repellat nulla assumenda.', '{"raw":"Rerum et modi occaecati beatae soluta aliquid praesentium. Repudiandae vel quaerat voluptates ea maiores facilis. Totam quia maiores consequatur.","html":"<p>Rerum et modi occaecati beatae soluta aliquid praesentium. Repudiandae vel quaerat voluptates ea maiores facilis. Totam quia maiores consequatur.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:19', '2017-06-04 06:18:19'),
(12, 4, 4, 'Tempora nobis eos ad voluptas.', '{"raw":"Nam provident assumenda earum quo nihil dolore. At voluptas perspiciatis temporibus doloribus deserunt ipsa est. Quis consectetur fugit non voluptas commodi.","html":"<p>Nam provident assumenda earum quo nihil dolore. At voluptas perspiciatis temporibus doloribus deserunt ipsa est. Quis consectetur fugit non voluptas commodi.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:19', '2017-06-04 06:18:19'),
(13, 9, 9, 'Dolorum mollitia error animi perferendis eligendi qui doloribus ullam.', '{"raw":"Labore assumenda deserunt voluptas quis et dolorum ratione. Est qui nemo qui qui eum cupiditate ratione. Autem a reiciendis vel tenetur rerum maxime numquam.","html":"<p>Labore assumenda deserunt voluptas quis et dolorum ratione. Est qui nemo qui qui eum cupiditate ratione. Autem a reiciendis vel tenetur rerum maxime numquam.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:21', '2017-06-04 06:18:21'),
(14, 2, 2, 'Quae quia ut et et laudantium accusantium rem.', '{"raw":"Labore vitae placeat omnis aliquam. Qui adipisci natus itaque quia inventore nesciunt eius. Nemo repellendus consequuntur omnis sit iure voluptatem.","html":"<p>Labore vitae placeat omnis aliquam. Qui adipisci natus itaque quia inventore nesciunt eius. Nemo repellendus consequuntur omnis sit iure voluptatem.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:20', '2017-06-04 06:18:20'),
(15, 9, 9, 'Et est nostrum vero molestiae delectus suscipit et.', '{"raw":"Repellendus quasi ratione omnis ut dolorum nemo hic sunt. Odit architecto aut sunt. Ipsam enim eum repellendus nemo similique eligendi dolor. Sit ea architecto qui voluptate.","html":"<p>Repellendus quasi ratione omnis ut dolorum nemo hic sunt. Odit architecto aut sunt. Ipsam enim eum repellendus nemo similique eligendi dolor. Sit ea architecto qui voluptate.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:21', '2017-06-04 06:18:21'),
(16, 6, 6, 'Perspiciatis aut aliquid est iusto assumenda nemo.', '{"raw":"Sit hic maxime ullam aperiam in possimus harum. Sint atque nihil eius et iusto eos.","html":"<p>Sit hic maxime ullam aperiam in possimus harum. Sint atque nihil eius et iusto eos.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:21', '2017-06-04 06:18:21'),
(17, 1, 1, 'Vitae reprehenderit natus veritatis.', '{"raw":"Et debitis cum nihil non modi voluptatum qui. Quos ipsam distinctio quo et quod nihil. Facilis ut veniam assumenda quia pariatur. Excepturi aut autem distinctio saepe natus autem quidem et. Magni cum sed vel accusantium.","html":"<p>Et debitis cum nihil non modi voluptatum qui. Quos ipsam distinctio quo et quod nihil. Facilis ut veniam assumenda quia pariatur. Excepturi aut autem distinctio saepe natus autem quidem et. Magni cum sed vel accusantium.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:23', '2017-06-04 06:18:23'),
(18, 11, 11, 'Aliquam quaerat accusantium dolores consequuntur dolores numquam enim.', '{"raw":"Dicta hic quidem provident qui optio quibusdam. Aperiam laudantium provident veritatis qui sed deleniti.","html":"<p>Dicta hic quidem provident qui optio quibusdam. Aperiam laudantium provident veritatis qui sed deleniti.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:23', '2017-06-04 06:18:23'),
(19, 1, 1, 'Error quia quo optio in.', '{"raw":"Amet sit amet qui. Est aspernatur asperiores ex consequatur sunt minima voluptas. Debitis pariatur et iste asperiores maxime voluptas numquam. Cumque et officiis voluptatem aut dolores harum.","html":"<p>Amet sit amet qui. Est aspernatur asperiores ex consequatur sunt minima voluptas. Debitis pariatur et iste asperiores maxime voluptas numquam. Cumque et officiis voluptatem aut dolores harum.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:24', '2017-06-04 06:18:24'),
(20, 1, 1, 'Delectus delectus qui est iusto.', '{"raw":"Impedit voluptatem minus ut. Sint soluta eos sed. Asperiores incidunt repellat placeat enim nulla.","html":"<p>Impedit voluptatem minus ut. Sint soluta eos sed. Asperiores incidunt repellat placeat enim nulla.<\\/p>"}', 1, '2017-06-01 21:30:22', '2017-06-04 06:18:24', '2017-06-04 06:18:24'),
(21, 12, 12, '小文傻不傻', '{"raw":"\\u54c8\\u54c8\\u54c8","html":"<p>\\u54c8\\u54c8\\u54c8<\\/p>"}', 1, '2017-06-07 23:15:33', '2018-03-05 00:47:33', '2018-03-05 00:47:33');

-- --------------------------------------------------------

--
-- 表的结构 `failed_jobs`
--

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` int(10) unsigned NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `followers`
--

CREATE TABLE IF NOT EXISTS `followers` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `follow_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `links`
--

INSERT INTO `links` (`id`, `name`, `link`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dr. Newton Upton', 'http://www.kerluke.info/', 'http://lorempixel.com/640/480/?53448', 1, '2017-06-01 21:30:22', '2017-06-04 06:17:30', '2017-06-04 06:17:30'),
(2, 'Mazie Bashirian', 'https://www.homenick.info/molestiae-beatae-totam-reiciendis-ut-maxime', 'http://lorempixel.com/640/480/?57325', 1, '2017-06-01 21:30:22', '2017-06-04 06:17:31', '2017-06-04 06:17:31'),
(3, 'Marlon Rolfson', 'http://thiel.net/earum-et-suscipit-non-et-autem-atque-optio', 'http://lorempixel.com/640/480/?91332', 1, '2017-06-01 21:30:22', '2017-06-04 06:17:32', '2017-06-04 06:17:32'),
(4, 'Henriette Emmerich IV', 'https://kshlerin.biz/quia-et-labore-fugiat-ex-autem.html', 'http://lorempixel.com/640/480/?74121', 1, '2017-06-01 21:30:22', '2017-06-04 06:17:36', '2017-06-04 06:17:36'),
(5, 'Jordan Emmerich II', 'http://ullrich.net/error-est-odio-et-qui', 'http://lorempixel.com/640/480/?97395', 1, '2017-06-01 21:30:22', '2017-06-04 06:17:37', '2017-06-04 06:17:37'),
(6, 'Betsy Graham', 'http://murazik.info/repellendus-vel-molestiae-ut-nulla', 'http://lorempixel.com/640/480/?52057', 1, '2017-06-01 21:30:22', '2017-06-04 06:17:37', '2017-06-04 06:17:37'),
(7, 'Kaya Smitham', 'http://www.champlin.com/', 'http://lorempixel.com/640/480/?47235', 1, '2017-06-01 21:30:22', '2017-06-04 06:17:40', '2017-06-04 06:17:40'),
(8, 'Ayla Mills', 'https://krajcik.biz/nesciunt-nihil-aliquid-nisi-in-eos-neque.html', 'http://lorempixel.com/640/480/?65230', 1, '2017-06-01 21:30:22', '2017-06-04 06:17:39', '2017-06-04 06:17:39'),
(9, 'Natalie Bergstrom', 'http://crona.org/', 'http://lorempixel.com/640/480/?35789', 1, '2017-06-01 21:30:22', '2017-06-04 06:17:38', '2017-06-04 06:17:38'),
(10, 'Karelle Conn', 'http://www.nikolaus.biz/', 'http://lorempixel.com/640/480/?86497', 1, '2017-06-01 21:30:22', '2017-06-04 06:17:39', '2017-06-04 06:17:39'),
(11, '小文blog', 'http://az1314.cn/', 'http://or0z8sgc6.bkt.clouddn.com/links/2018/03/05/nCqPlOwQEz7yz72uAet1bOYpZWcQKdXT6njmJkbP.jpg', 1, '2018-03-05 00:17:27', '2018-03-05 00:17:27', NULL),
(12, '云天河', 'http://www.hlzblog.top/', 'http://or0z8sgc6.bkt.clouddn.com/links/2018/03/05/WWsICmTIH9DooNBYfZMAXgUZZBPbS4r7LXpsbHs5.png', 1, '2018-03-05 00:18:48', '2018-03-05 00:18:48', NULL),
(13, '半醒的狐狸', 'http://blog.vsonweb.com/', 'http://or0z8sgc6.bkt.clouddn.com/links/2018/03/05/Gv2mmMrQmasbqV5ixNF6QvtDK5n9w3vuZ590Pk4G.jpg', 1, '2018-03-05 00:19:34', '2018-03-05 00:19:34', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2016_09_02_065857_create_articles_table', 1),
(9, '2016_09_02_065920_create_tags_table', 1),
(10, '2016_09_02_065952_create_visitors_table', 1),
(11, '2016_09_02_070119_create_categories_table', 1),
(12, '2016_09_02_070132_create_discussions_table', 1),
(13, '2016_09_02_070151_create_comments_table', 1),
(14, '2016_09_13_022056_create_links_table', 1),
(15, '2016_11_11_163610_create_taggables_table', 1),
(16, '2016_12_11_153312_create_followers_table', 1),
(17, '2016_12_12_171655_create_notifications_table', 1),
(18, '2016_12_12_205419_create_failed_jobs_table', 1),
(19, '2017_04_14_013622_create_votes_table', 1);

-- --------------------------------------------------------

--
-- 表的结构 `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0ac7ff3d-ad2f-4779-af04-79887bb11268', 'App\\Notifications\\MentionedUser', 12, 'App\\User', '{"id":56,"user_id":12,"commentable_id":21,"commentable_type":"discussions","content":"{\\"raw\\":\\"[@php_fucker](http:\\\\\\/\\\\\\/blog.xinz.win\\\\\\/user\\\\\\/php_fucker) sb\\",\\"html\\":\\"<p><a href=\\\\\\"http:\\\\\\/\\\\\\/blog.xinz.win\\\\\\/user\\\\\\/php_fucker\\\\\\">@php_fucker<\\\\\\/a> sb<\\\\\\/p>\\"}","created_at":"2017-06-08 07:16:15","updated_at":"2017-06-08 07:16:15","deleted_at":null}', '2017-06-11 22:07:00', '2017-06-07 23:16:15', '2017-06-11 22:07:00'),
('36413703-d236-4854-9d44-dc061f55b0ac', 'App\\Notifications\\ReceivedComment', 12, 'App\\User', '{"id":55,"user_id":12,"commentable_id":21,"commentable_type":"discussions","content":"{\\"raw\\":\\"```\\\\nsb\\\\n```\\",\\"html\\":\\"<pre><code>sb<\\\\\\/code><\\\\\\/pre>\\"}","created_at":"2017-06-08 07:16:03","updated_at":"2017-06-08 07:16:03","deleted_at":null}', '2017-06-11 22:07:00', '2017-06-07 23:16:03', '2017-06-11 22:07:00'),
('553eca66-02c9-41de-b7ad-1128d62db5da', 'App\\Notifications\\ReceivedComment', 12, 'App\\User', '{"id":54,"user_id":12,"commentable_id":21,"commentable_type":"discussions","content":"{\\"raw\\":\\"\\\\u00b7\\\\u00b7\\\\u00b7\\\\nsb\\\\n\\\\u00b7\\\\u00b7\\\\u00b7\\",\\"html\\":\\"<p>\\\\u00b7\\\\u00b7\\\\u00b7<br \\\\\\/>\\\\nsb<br \\\\\\/>\\\\n\\\\u00b7\\\\u00b7\\\\u00b7<\\\\\\/p>\\"}","created_at":"2017-06-08 07:15:46","updated_at":"2017-06-08 07:15:46","deleted_at":null}', '2017-06-11 22:07:00', '2017-06-07 23:15:46', '2017-06-11 22:07:00'),
('649f5272-9a98-4224-9aaa-25166bfafb3f', 'App\\Notifications\\ReceivedComment', 12, 'App\\User', '{"id":56,"user_id":12,"commentable_id":21,"commentable_type":"discussions","content":"{\\"raw\\":\\"[@php_fucker](http:\\\\\\/\\\\\\/blog.xinz.win\\\\\\/user\\\\\\/php_fucker) sb\\",\\"html\\":\\"<p><a href=\\\\\\"http:\\\\\\/\\\\\\/blog.xinz.win\\\\\\/user\\\\\\/php_fucker\\\\\\">@php_fucker<\\\\\\/a> sb<\\\\\\/p>\\"}","created_at":"2017-06-08 07:16:15","updated_at":"2017-06-08 07:16:15","deleted_at":null}', '2017-06-11 22:07:00', '2017-06-07 23:16:15', '2017-06-11 22:07:00'),
('72faca00-dab0-4c44-a91a-b8d3d6280b58', 'App\\Notifications\\ReceivedComment', 12, 'App\\User', '{"id":51,"user_id":12,"commentable_id":21,"commentable_type":"articles","content":"{\\"raw\\":\\"\\\\u00b7\\\\u00b7\\\\u00b7\\\\nok\\\\n\\\\u00b7\\\\u00b7\\\\u00b7\\",\\"html\\":\\"<p>\\\\u00b7\\\\u00b7\\\\u00b7<br \\\\\\/>\\\\nok<br \\\\\\/>\\\\n\\\\u00b7\\\\u00b7\\\\u00b7<\\\\\\/p>\\"}","created_at":"2017-06-05 01:20:04","updated_at":"2017-06-05 01:20:04","deleted_at":null}', '2017-06-04 17:21:06', '2017-06-04 17:20:04', '2017-06-04 17:21:06'),
('82348314-0ae6-40d2-919f-7d0a14a81156', 'App\\Notifications\\ReceivedComment', 12, 'App\\User', '{"id":52,"user_id":12,"commentable_id":21,"commentable_type":"articles","content":"{\\"raw\\":\\"```\\\\ngood\\\\n```\\",\\"html\\":\\"<pre><code>good<\\\\\\/code><\\\\\\/pre>\\"}","created_at":"2017-06-05 01:20:20","updated_at":"2017-06-05 01:20:20","deleted_at":null}', '2017-06-04 17:21:06', '2017-06-04 17:20:20', '2017-06-04 17:21:06'),
('8692063c-c145-470f-bd78-922bba2c1e2a', 'App\\Notifications\\ReceivedComment', 12, 'App\\User', '{"id":57,"user_id":12,"commentable_id":75,"commentable_type":"articles","content":"{\\"raw\\":\\"###fuck\\",\\"html\\":\\"<h3>fuck<\\\\\\/h3>\\"}","created_at":"2017-06-23 07:45:41","updated_at":"2017-06-23 07:45:41","deleted_at":null}', '2017-12-01 01:19:41', '2017-06-22 23:45:41', '2017-12-01 01:19:41'),
('a924d495-9ed1-4be8-9761-15c18dcef17b', 'App\\Notifications\\ReceivedComment', 12, 'App\\User', '{"id":53,"user_id":12,"commentable_id":21,"commentable_type":"articles","content":"{\\"raw\\":\\"asd\\",\\"html\\":\\"<p>asd<\\\\\\/p>\\"}","created_at":"2017-06-05 01:23:04","updated_at":"2017-06-05 01:23:04","deleted_at":null}', '2017-06-04 17:23:36', '2017-06-04 17:23:04', '2017-06-04 17:23:36');

-- --------------------------------------------------------

--
-- 表的结构 `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_auth_codes`
--

CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'PJ Blog Personal Access Client', 'UUrClzcn95qeA9tuU69BXi2NqwvzKarql9Jph7zG', 'http://localhost', 1, 0, 0, '2017-06-01 21:30:23', '2017-06-01 21:30:23'),
(2, NULL, 'PJ Blog Password Grant Client', 'zBGfrYWgihLYJDd4NE06bri5Et9DybN2BGqdDrKg', 'http://localhost', 0, 1, 0, '2017-06-01 21:30:23', '2017-06-01 21:30:23');

-- --------------------------------------------------------

--
-- 表的结构 `oauth_personal_access_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-06-01 21:30:23', '2017-06-01 21:30:23');

-- --------------------------------------------------------

--
-- 表的结构 `oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `taggables`
--

CREATE TABLE IF NOT EXISTS `taggables` (
  `tag_id` int(10) unsigned NOT NULL,
  `taggable_id` int(10) unsigned NOT NULL,
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `taggables`
--

INSERT INTO `taggables` (`tag_id`, `taggable_id`, `taggable_type`) VALUES
(6, 21, 'articles'),
(6, 22, 'articles'),
(6, 27, 'articles'),
(6, 28, 'articles'),
(6, 29, 'articles'),
(6, 30, 'articles'),
(6, 31, 'articles'),
(6, 32, 'articles'),
(6, 33, 'articles'),
(6, 34, 'articles'),
(6, 21, 'discussions'),
(7, 53, 'articles'),
(8, 53, 'articles'),
(6, 53, 'articles'),
(8, 56, 'articles'),
(8, 64, 'articles'),
(8, 68, 'articles'),
(8, 69, 'articles'),
(6, 74, 'articles'),
(7, 74, 'articles'),
(6, 78, 'articles'),
(10, 79, 'articles'),
(8, 80, 'articles'),
(15, 81, 'articles'),
(8, 82, 'articles'),
(17, 82, 'articles'),
(18, 82, 'articles');

-- --------------------------------------------------------

--
-- 表的结构 `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `tags`
--

INSERT INTO `tags` (`id`, `tag`, `title`, `meta_description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'laborum', 'Vel quia nulla quia modi saepe officiis ex.', 'Delectus ex aut magni omnis optio qui id qui.', '2017-06-01 21:30:22', '2017-06-04 06:15:35', '2017-06-04 06:15:35'),
(2, 'enim', 'Nam tempore ipsam id repellat id omnis.', 'Cupiditate unde odit odit vel sed quidem.', '2017-06-01 21:30:22', '2017-06-04 06:15:38', '2017-06-04 06:15:38'),
(3, 'iusto', 'Veritatis ut autem nobis quisquam id.', 'Tempora placeat distinctio nihil delectus repellendus.', '2017-06-01 21:30:22', '2017-06-04 06:15:36', '2017-06-04 06:15:36'),
(4, 'aperiam', 'Odit aut doloremque beatae dolore quis.', 'Sit natus molestiae in sed labore consectetur possimus.', '2017-06-01 21:30:22', '2017-06-04 06:15:37', '2017-06-04 06:15:37'),
(5, 'debitis', 'Porro velit qui doloremque minima ea suscipit nam.', 'Sed in voluptatem itaque recusandae eos sed ut.', '2017-06-01 21:30:22', '2017-06-04 06:15:38', '2017-06-04 06:15:38'),
(6, 'PHP', 'PHP', 'PHP', '2017-06-04 06:16:08', '2017-06-04 06:16:08', NULL),
(7, 'laravel', 'laravel', 'laravel', '2017-06-09 01:51:59', '2017-06-09 01:51:59', NULL),
(8, 'linux', 'linux', 'linux', '2017-06-09 01:52:05', '2017-06-09 01:52:05', NULL),
(9, 'cron', '计划任务', '计划任务', '2017-06-09 01:52:24', '2017-06-09 01:52:24', NULL),
(10, 'git', 'git', 'git', '2017-07-26 19:36:01', '2017-07-26 19:36:01', NULL),
(11, 'charles', 'charles', '青花瓷抓包工具', '2018-03-05 00:45:40', '2018-03-05 00:45:40', NULL),
(12, 'Wireshark', 'Wireshark', 'tcp抓包工具', '2018-03-05 00:46:14', '2018-03-05 00:46:14', NULL),
(13, 'golang', 'golang', 'go语言', '2018-03-05 00:46:46', '2018-03-05 00:46:46', NULL),
(14, 'search', 'search', '搜索相关', '2018-03-05 00:47:09', '2018-03-05 00:47:09', NULL),
(15, 'redis', 'redis', 'redis数据库', '2018-03-05 01:13:05', '2018-03-05 01:13:05', NULL),
(16, 'MySQL', 'MySQL', '数据库', '2018-03-05 01:13:24', '2018-03-05 01:13:24', NULL),
(17, 'ELK', 'ELK', 'elk', '2018-03-05 01:50:09', '2018-03-05 01:50:09', NULL),
(18, 'Filebeat', 'Filebeat', 'Filebeat日志转储', '2018-03-05 01:50:31', '2018-03-05 01:50:31', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirm_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `github_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weibo_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weibo_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_notify_enabled` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `name`, `nickname`, `avatar`, `email`, `confirm_code`, `status`, `is_admin`, `password`, `github_id`, `github_name`, `github_url`, `weibo_name`, `weibo_link`, `website`, `description`, `email_notify_enabled`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', NULL, NULL, 'admin@pigjian.com', 'u4ybhNoNgEDJFygB3K9rHrQZnvIVL9DhqFu6dpw3crQKEnAiLo7hx1PsFnxpygpd', 1, 1, '$2y$10$AkQlBzbNLvhb925dDwpbjOXEp28RanTGCUFg1vpZiLeh0gnv6ri46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, '2017-06-01 21:30:21', '2017-06-01 21:30:21', NULL),
(2, 'Ottilie Bauch', NULL, NULL, 'bhilpert@example.net', '2v7zLTleZ80wZxoo8a0ySylWu1wjvMOSc51QqeY4CLxywQe4kgtf93Pkx7PH3nHq', 1, 0, '$2y$10$heqrucL/64i3OOTu9fFbfOyp5xrILV40eyxbqGKBB2bi3TRuxNxmW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'lzXTgbuWNs', '2017-06-01 21:30:21', '2017-06-04 20:27:29', '2017-06-04 20:27:29'),
(3, 'Francesco Beier', NULL, NULL, 'jayson.wolf@example.org', '4HUgLtRRflwWFhLcKDZ9gktwBVfBepCJYfmn9S9mwF1jkrmYwKOAAu13ZAkIl2GV', 1, 0, '$2y$10$heqrucL/64i3OOTu9fFbfOyp5xrILV40eyxbqGKBB2bi3TRuxNxmW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'l11wwvAJ32', '2017-06-01 21:30:21', '2017-06-04 20:27:30', '2017-06-04 20:27:30'),
(4, 'Alex Labadie', NULL, NULL, 'vcartwright@example.net', 'yUG2oCA2w8tdRva9ZHxzqaxV7d1ytNqrYqSRIyGCuFJ0lE2J1TnQTJ1Dz5A7DzYL', 1, 0, '$2y$10$heqrucL/64i3OOTu9fFbfOyp5xrILV40eyxbqGKBB2bi3TRuxNxmW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'T8BAhVq6Nc', '2017-06-01 21:30:21', '2017-06-04 20:27:31', '2017-06-04 20:27:31'),
(5, 'Braulio Gulgowski', NULL, NULL, 'eschumm@example.net', 'Vzw1DwIA96ycInmCKtPFjNhrvXooiMEGQ8wo2aV0x74hrKc9NOSzzjFEocvgWXGC', 1, 0, '$2y$10$heqrucL/64i3OOTu9fFbfOyp5xrILV40eyxbqGKBB2bi3TRuxNxmW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'QoBdrtleyz', '2017-06-01 21:30:21', '2017-06-04 20:27:32', '2017-06-04 20:27:32'),
(6, 'Angeline Hayes PhD', NULL, NULL, 'gardner.kautzer@example.net', 'tLhbSaKufPM8lby3NmduTuruaG3cIANEli1T2EzajUeu9DxfoMUtFizyT11bTAe9', 1, 0, '$2y$10$heqrucL/64i3OOTu9fFbfOyp5xrILV40eyxbqGKBB2bi3TRuxNxmW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', '5RNy0Qm5NA', '2017-06-01 21:30:21', '2017-06-04 20:27:33', '2017-06-04 20:27:33'),
(7, 'Katherine Emmerich IV', NULL, NULL, 'denis70@example.com', 'F0oaNVHvyiDsvHJyGJu5jF8Mf2N6wyP0vTsZRf2mTc6RRNKjE12GdkGWdnpISRlQ', 1, 0, '$2y$10$heqrucL/64i3OOTu9fFbfOyp5xrILV40eyxbqGKBB2bi3TRuxNxmW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'fpDgaxSkx6', '2017-06-01 21:30:21', '2017-06-04 20:27:33', '2017-06-04 20:27:33'),
(8, 'Ms. Jolie Rice DVM', NULL, NULL, 'shanahan.karen@example.net', 'wZ6GtfyiaRRJGuXIvdFqWbQEAsxkP5VAeZ2Axp0S5JqYKXv2fjE5soQbzeHeH8M4', 1, 0, '$2y$10$heqrucL/64i3OOTu9fFbfOyp5xrILV40eyxbqGKBB2bi3TRuxNxmW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'drI3COfN4V', '2017-06-01 21:30:21', '2017-06-04 20:27:34', '2017-06-04 20:27:34'),
(9, 'Chad Sporer PhD', NULL, NULL, 'elsie.morissette@example.org', 'QTAU4l7l8tVI9f2MJb0NTtYRRS1WDEcir0ROSwt7UQZlZtISvmKx3ge8gloZylb5', 1, 0, '$2y$10$heqrucL/64i3OOTu9fFbfOyp5xrILV40eyxbqGKBB2bi3TRuxNxmW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', '9qVPqQzlJ7', '2017-06-01 21:30:21', '2017-06-04 20:27:35', '2017-06-04 20:27:35'),
(10, 'Jaden Koepp', NULL, NULL, 'gbauch@example.net', 'hbrLTeznpE8fUDJUNG7KPQcS5UhxMiA2bubZZ5D08meQg3dwNYSSDNslIeYZzVw5', 1, 0, '$2y$10$heqrucL/64i3OOTu9fFbfOyp5xrILV40eyxbqGKBB2bi3TRuxNxmW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'icdhuAOHOR', '2017-06-01 21:30:21', '2017-06-04 20:27:36', '2017-06-04 20:27:36'),
(11, 'Madeline Bechtelar', NULL, NULL, 'jeanette.okeefe@example.com', '7qL90TATHC2QlZ4bJ9Nmw8oFF1hqCnVvtTGTBSKwPwhPvgwBSqPMcEGFLtguEzPI', 1, 0, '$2y$10$heqrucL/64i3OOTu9fFbfOyp5xrILV40eyxbqGKBB2bi3TRuxNxmW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'QWeUYd2n62', '2017-06-01 21:30:21', '2017-06-04 20:27:36', '2017-06-04 20:27:36'),
(12, 'php_fucker', '哈哈', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAP8AAAD/CAIAAACxapedAAAABnRSTlMAAAAAAABupgeRAAADEklEQVR4nO3W0WnEMBRFwThsQS5FpaoUl5QGNh8LgWfnzFRwkY+FjnWur7va156e8IYT+9RtT+x7egCMUT9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9dxzrX9AaY8Zoe8Ej72tMT3nCRfcrLhy7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpn65jnWt6A8w4pgc8z53vi33t6QlP4uVDl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRPl/rpUj9d6qdL/XSpny7106V+utRP12uda3rDr/a1pyfwB27b2Gt6wPP4J/8NLx+61E+X+ulSP13qp0v9dKmfLvXTpX661E+X+ulSP13qp0v9dKmfLvXTpX661E+X+ulSP13qp0v9dKmfLvXTpX661E+X+ulSP13qp0v9dKmfLvXTpX661E+X+ulSP13qp0v9dKmfLvXTpX661E+X+ulSP13qp0v9dKmfLvXTpX66jnWu6Q3Ps689PeENn/JT7n661E+X+ulSP13qp0v9dKmfLvXTpX661E+X+ulSP13qp0v9dKmfLvXTpX661E+X+ulSP13qp0v9dKmfLvXTpX661E+X+ulSP13qp0v9dKmfLvXTpX661E+X+ulSP13qp0v9dKmfLvXTpX661E+X+ulSP13qp0v9dKmfLvXTpX661E/XD3Z4GkBRwg+GAAAAAElFTkSuQmCC', '183387594@qq.com', NULL, 1, 1, '$2y$10$zqAXK9m0L9BuhqHWnpk2e.KKZGcC2TSnta2y4chLsX8FLKw4cjI02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 'ipF8227Yjncv5VMo13dHh5qBr6jPytKjdSC6rOijTQ4rfZ6oHRSJLlbqb9G3', '2017-06-02 01:11:34', '2017-06-04 17:19:36', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `visitors`
--

CREATE TABLE IF NOT EXISTS `visitors` (
  `id` int(10) unsigned NOT NULL,
  `article_id` int(10) unsigned NOT NULL,
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicks` int(10) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `visitors`
--

INSERT INTO `visitors` (`id`, `article_id`, `ip`, `country`, `clicks`, `created_at`, `updated_at`) VALUES
(127, 48, '180.169.16.78', NULL, 29, '2017-06-06 23:27:10', '2017-08-21 23:08:08'),
(128, 48, '123.125.106.97', NULL, 1, '2017-06-08 17:14:43', '2017-06-08 17:14:43'),
(129, 48, '123.126.56.237', NULL, 1, '2017-06-08 17:14:43', '2017-06-08 17:14:43'),
(130, 49, '180.169.16.78', NULL, 12, '2017-06-09 01:55:06', '2017-07-09 23:50:07'),
(137, 74, '180.169.16.78', NULL, 20, '2017-06-12 18:01:03', '2017-08-13 17:57:21'),
(138, 74, '27.16.206.28', NULL, 2, '2017-06-15 01:05:23', '2017-06-15 01:11:01'),
(139, 74, '106.120.160.109', NULL, 1, '2017-06-15 01:05:59', '2017-06-15 01:05:59'),
(140, 74, '220.181.132.198', NULL, 1, '2017-06-15 01:06:31', '2017-06-15 01:06:31'),
(141, 48, '27.16.206.28', NULL, 1, '2017-06-15 01:10:52', '2017-06-15 01:10:52'),
(142, 49, '27.16.206.28', NULL, 2, '2017-06-15 01:10:56', '2017-06-15 01:12:08'),
(143, 48, '104.192.74.11', NULL, 24, '2017-06-19 10:22:17', '2018-05-09 05:22:46'),
(144, 49, '104.192.74.11', NULL, 24, '2017-06-19 10:22:17', '2018-05-09 05:22:46'),
(145, 74, '104.192.74.11', NULL, 24, '2017-06-19 10:22:18', '2018-05-09 05:22:47'),
(146, 48, '104.192.74.24', NULL, 24, '2017-06-20 10:28:15', '2018-03-20 02:29:55'),
(147, 49, '104.192.74.24', NULL, 24, '2017-06-20 10:28:15', '2018-03-20 02:29:55'),
(148, 74, '104.192.74.24', NULL, 24, '2017-06-20 10:28:16', '2018-03-20 02:29:56'),
(149, 48, '104.192.74.30', NULL, 20, '2017-06-21 06:10:56', '2018-05-19 03:01:53'),
(150, 49, '104.192.74.30', NULL, 20, '2017-06-21 06:10:56', '2018-05-19 03:01:53'),
(151, 74, '104.192.74.30', NULL, 20, '2017-06-21 06:10:56', '2018-05-19 03:01:55'),
(152, 48, '104.192.74.43', NULL, 26, '2017-06-22 08:13:26', '2018-04-21 05:41:06'),
(153, 49, '104.192.74.43', NULL, 26, '2017-06-22 08:13:26', '2018-04-21 05:41:06'),
(154, 74, '104.192.74.43', NULL, 26, '2017-06-22 08:13:27', '2018-04-21 05:41:08'),
(155, 75, '180.169.16.78', NULL, 5, '2017-06-22 23:44:59', '2017-08-13 17:57:29'),
(156, 78, '180.169.16.78', NULL, 6, '2017-06-22 23:45:05', '2017-08-13 17:58:01'),
(157, 48, '104.192.74.13', NULL, 14, '2017-06-23 05:16:57', '2018-05-20 00:54:02'),
(158, 49, '104.192.74.13', NULL, 14, '2017-06-23 05:16:58', '2018-05-20 00:54:02'),
(159, 78, '104.192.74.13', NULL, 10, '2017-06-23 05:16:58', '2017-11-20 09:59:44'),
(160, 75, '104.192.74.13', NULL, 14, '2017-06-23 05:16:58', '2018-05-20 00:54:04'),
(161, 74, '104.192.74.13', NULL, 14, '2017-06-23 05:16:59', '2018-05-20 00:54:04'),
(162, 48, '104.192.74.19', NULL, 16, '2017-06-24 02:38:13', '2018-05-05 06:59:39'),
(163, 49, '104.192.74.19', NULL, 16, '2017-06-24 02:38:13', '2018-05-05 06:59:39'),
(164, 75, '104.192.74.19', NULL, 16, '2017-06-24 02:38:13', '2018-05-05 06:59:40'),
(165, 78, '104.192.74.19', NULL, 14, '2017-06-24 02:38:14', '2018-01-29 10:51:07'),
(166, 74, '104.192.74.19', NULL, 16, '2017-06-24 02:38:15', '2018-05-05 06:59:40'),
(167, 48, '104.192.74.12', NULL, 24, '2017-06-25 02:01:16', '2018-04-06 05:30:10'),
(168, 49, '104.192.74.12', NULL, 24, '2017-06-25 02:01:17', '2018-04-06 05:30:11'),
(169, 78, '104.192.74.12', NULL, 22, '2017-06-25 02:01:17', '2018-02-10 03:55:24'),
(170, 75, '104.192.74.12', NULL, 24, '2017-06-25 02:01:17', '2018-04-06 05:30:12'),
(171, 74, '104.192.74.12', NULL, 24, '2017-06-25 02:01:18', '2018-04-06 05:30:12'),
(172, 48, '104.192.74.37', NULL, 32, '2017-06-26 10:05:55', '2018-05-14 09:05:02'),
(173, 49, '104.192.74.37', NULL, 32, '2017-06-26 10:05:55', '2018-05-14 09:05:02'),
(174, 75, '104.192.74.37', NULL, 32, '2017-06-26 10:05:55', '2018-05-14 09:05:03'),
(175, 78, '104.192.74.37', NULL, 26, '2017-06-26 10:05:56', '2018-01-04 09:39:36'),
(176, 74, '104.192.74.37', NULL, 32, '2017-06-26 10:05:56', '2018-05-14 09:05:03'),
(177, 48, '104.192.74.44', NULL, 16, '2017-06-27 08:18:03', '2018-04-16 07:37:55'),
(178, 49, '104.192.74.44', NULL, 16, '2017-06-27 08:18:03', '2018-04-16 07:37:55'),
(179, 78, '104.192.74.44', NULL, 14, '2017-06-27 08:18:04', '2018-03-01 06:58:20'),
(180, 75, '104.192.74.44', NULL, 16, '2017-06-27 08:18:04', '2018-04-16 07:37:56'),
(181, 74, '104.192.74.44', NULL, 16, '2017-06-27 08:18:05', '2018-04-16 07:37:57'),
(182, 48, '104.192.74.35', NULL, 30, '2017-06-28 01:29:59', '2018-05-06 01:56:19'),
(183, 49, '104.192.74.35', NULL, 30, '2017-06-28 01:29:59', '2018-05-06 01:56:19'),
(184, 75, '104.192.74.35', NULL, 30, '2017-06-28 01:29:59', '2018-05-06 01:56:20'),
(185, 78, '104.192.74.35', NULL, 28, '2017-06-28 01:30:00', '2018-02-16 23:21:20'),
(186, 74, '104.192.74.35', NULL, 30, '2017-06-28 01:30:00', '2018-05-06 01:56:20'),
(187, 48, '104.192.74.14', NULL, 34, '2017-06-29 04:22:51', '2018-04-11 02:03:32'),
(188, 49, '104.192.74.14', NULL, 34, '2017-06-29 04:22:51', '2018-04-11 02:03:32'),
(189, 75, '104.192.74.14', NULL, 34, '2017-06-29 04:22:52', '2018-04-11 02:03:33'),
(190, 78, '104.192.74.14', NULL, 28, '2017-06-29 04:22:52', '2018-02-28 10:07:02'),
(191, 74, '104.192.74.14', NULL, 34, '2017-06-29 04:22:53', '2018-04-11 02:03:33'),
(192, 48, '104.192.74.38', NULL, 24, '2017-07-01 08:25:02', '2018-01-03 10:51:45'),
(193, 49, '104.192.74.38', NULL, 24, '2017-07-01 08:25:02', '2018-01-03 10:51:45'),
(194, 75, '104.192.74.38', NULL, 24, '2017-07-01 08:25:03', '2018-01-03 10:51:45'),
(195, 78, '104.192.74.38', NULL, 24, '2017-07-01 08:25:03', '2018-01-03 10:51:46'),
(196, 74, '104.192.74.38', NULL, 24, '2017-07-01 08:25:04', '2018-01-03 10:51:47'),
(197, 74, '167.114.209.38', NULL, 3, '2017-07-02 17:46:37', '2017-12-26 03:25:22'),
(198, 49, '167.114.209.38', NULL, 3, '2017-07-02 17:46:41', '2017-12-26 03:25:19'),
(199, 78, '167.114.209.38', NULL, 1, '2017-07-02 17:46:42', '2017-07-02 17:46:42'),
(200, 48, '104.192.74.27', NULL, 30, '2017-07-04 07:32:02', '2018-03-18 22:01:49'),
(201, 49, '104.192.74.27', NULL, 30, '2017-07-04 07:32:02', '2018-03-18 22:01:49'),
(202, 75, '104.192.74.27', NULL, 30, '2017-07-04 07:32:03', '2018-03-18 22:01:50'),
(203, 78, '104.192.74.27', NULL, 28, '2017-07-04 07:32:03', '2018-02-20 23:21:34'),
(204, 74, '104.192.74.27', NULL, 30, '2017-07-04 07:32:04', '2018-03-18 22:01:50'),
(205, 48, '1.192.121.104', NULL, 1, '2017-07-05 21:09:32', '2017-07-05 21:09:32'),
(206, 49, '1.192.121.104', NULL, 1, '2017-07-05 21:09:46', '2017-07-05 21:09:46'),
(207, 75, '1.192.121.104', NULL, 1, '2017-07-05 21:09:56', '2017-07-05 21:09:56'),
(208, 74, '1.192.121.104', NULL, 1, '2017-07-05 21:10:07', '2017-07-05 21:10:07'),
(209, 48, '180.166.70.58', NULL, 1, '2017-07-05 21:12:34', '2017-07-05 21:12:34'),
(210, 75, '180.166.70.58', NULL, 1, '2017-07-05 21:12:51', '2017-07-05 21:12:51'),
(211, 74, '106.91.182.82', NULL, 1, '2017-07-05 21:21:13', '2017-07-05 21:21:13'),
(212, 48, '106.91.182.82', NULL, 1, '2017-07-05 21:21:29', '2017-07-05 21:21:29'),
(213, 48, '140.207.128.193', NULL, 1, '2017-07-05 21:21:42', '2017-07-05 21:21:42'),
(214, 74, '61.151.226.191', NULL, 1, '2017-07-05 21:22:08', '2017-07-05 21:22:08'),
(215, 48, '104.192.74.29', NULL, 20, '2017-07-06 05:17:17', '2018-04-24 08:20:44'),
(216, 49, '104.192.74.29', NULL, 20, '2017-07-06 05:17:17', '2018-04-24 08:20:44'),
(217, 75, '104.192.74.29', NULL, 20, '2017-07-06 05:17:18', '2018-04-24 08:20:45'),
(218, 78, '104.192.74.29', NULL, 16, '2017-07-06 05:17:18', '2018-01-30 04:59:16'),
(219, 74, '104.192.74.29', NULL, 20, '2017-07-06 05:17:19', '2018-04-24 08:20:46'),
(220, 48, '104.192.74.45', NULL, 16, '2017-07-07 00:34:48', '2018-04-29 03:23:09'),
(221, 49, '104.192.74.45', NULL, 16, '2017-07-07 00:34:48', '2018-04-29 03:23:09'),
(222, 75, '104.192.74.45', NULL, 16, '2017-07-07 00:34:49', '2018-04-29 03:23:11'),
(223, 78, '104.192.74.45', NULL, 10, '2017-07-07 00:34:49', '2017-11-23 05:10:08'),
(224, 74, '104.192.74.45', NULL, 16, '2017-07-07 00:34:50', '2018-04-29 03:23:11'),
(225, 48, '104.192.74.36', NULL, 24, '2017-07-08 06:21:09', '2018-05-18 03:26:12'),
(226, 49, '104.192.74.36', NULL, 24, '2017-07-08 06:21:09', '2018-05-18 03:26:12'),
(227, 75, '104.192.74.36', NULL, 24, '2017-07-08 06:21:09', '2018-05-18 03:26:13'),
(228, 78, '104.192.74.36', NULL, 16, '2017-07-08 06:21:10', '2018-01-23 08:20:55'),
(229, 74, '104.192.74.36', NULL, 24, '2017-07-08 06:21:10', '2018-05-18 03:26:13'),
(230, 78, '104.192.74.24', NULL, 18, '2017-07-10 22:41:28', '2017-12-19 03:17:33'),
(231, 75, '104.192.74.24', NULL, 22, '2017-07-10 22:41:28', '2018-03-20 02:29:56'),
(232, 48, '104.192.74.22', NULL, 16, '2017-07-12 22:44:43', '2018-05-16 07:49:31'),
(233, 49, '104.192.74.22', NULL, 16, '2017-07-12 22:44:43', '2018-05-16 07:49:31'),
(234, 75, '104.192.74.22', NULL, 16, '2017-07-12 22:44:44', '2018-05-16 07:49:32'),
(235, 78, '104.192.74.22', NULL, 6, '2017-07-12 22:44:44', '2018-02-15 06:27:57'),
(236, 74, '104.192.74.22', NULL, 16, '2017-07-12 22:44:45', '2018-05-16 07:49:33'),
(237, 75, '104.192.74.11', NULL, 22, '2017-07-15 09:38:51', '2018-05-09 05:22:47'),
(238, 78, '104.192.74.11', NULL, 18, '2017-07-15 09:38:51', '2018-02-12 08:36:15'),
(239, 48, '69.58.178.56', NULL, 2, '2017-07-16 02:20:52', '2017-09-02 17:53:18'),
(240, 49, '69.58.178.56', NULL, 2, '2017-07-16 02:20:53', '2017-09-02 17:53:19'),
(241, 75, '69.58.178.56', NULL, 2, '2017-07-16 02:20:54', '2017-09-02 17:53:21'),
(242, 78, '69.58.178.56', NULL, 2, '2017-07-16 02:20:56', '2017-09-02 17:53:22'),
(243, 74, '69.58.178.56', NULL, 1, '2017-07-16 02:20:58', '2017-07-16 02:20:58'),
(244, 48, '104.192.74.42', NULL, 18, '2017-07-18 01:23:24', '2018-05-11 22:28:47'),
(245, 49, '104.192.74.42', NULL, 18, '2017-07-18 01:23:25', '2018-05-11 22:28:47'),
(246, 75, '104.192.74.42', NULL, 18, '2017-07-18 01:23:25', '2018-05-11 22:28:48'),
(247, 78, '104.192.74.42', NULL, 8, '2017-07-18 01:23:26', '2018-01-06 08:52:14'),
(248, 74, '104.192.74.42', NULL, 18, '2017-07-18 01:23:27', '2018-05-11 22:28:49'),
(249, 48, '104.192.74.17', NULL, 20, '2017-07-20 07:49:39', '2018-04-05 08:34:37'),
(250, 49, '104.192.74.17', NULL, 20, '2017-07-20 07:49:39', '2018-04-05 08:34:37'),
(251, 75, '104.192.74.17', NULL, 20, '2017-07-20 07:49:40', '2018-04-05 08:34:38'),
(252, 78, '104.192.74.17', NULL, 16, '2017-07-20 07:49:40', '2017-12-07 09:51:28'),
(253, 74, '104.192.74.17', NULL, 20, '2017-07-20 07:49:41', '2018-04-05 08:34:38'),
(254, 48, '104.192.74.25', NULL, 16, '2017-07-21 05:44:23', '2018-04-02 02:16:22'),
(255, 49, '104.192.74.25', NULL, 16, '2017-07-21 05:44:23', '2018-04-02 02:16:22'),
(256, 75, '104.192.74.25', NULL, 16, '2017-07-21 05:44:24', '2018-04-02 02:16:23'),
(257, 78, '104.192.74.25', NULL, 14, '2017-07-21 05:44:24', '2018-01-15 08:21:51'),
(258, 74, '104.192.74.25', NULL, 16, '2017-07-21 05:44:25', '2018-04-02 02:16:24'),
(259, 48, '104.192.74.15', NULL, 22, '2017-07-25 10:50:58', '2018-03-27 04:41:50'),
(260, 49, '104.192.74.15', NULL, 22, '2017-07-25 10:50:59', '2018-03-27 04:41:50'),
(261, 75, '104.192.74.15', NULL, 22, '2017-07-25 10:50:59', '2018-03-27 04:41:51'),
(262, 78, '104.192.74.15', NULL, 18, '2017-07-25 10:51:00', '2018-03-05 02:55:01'),
(263, 74, '104.192.74.15', NULL, 22, '2017-07-25 10:51:00', '2018-03-27 04:41:51'),
(264, 48, '104.192.74.46', NULL, 20, '2017-07-26 07:38:25', '2018-04-17 23:13:59'),
(265, 49, '104.192.74.46', NULL, 20, '2017-07-26 07:38:25', '2018-04-17 23:13:59'),
(266, 75, '104.192.74.46', NULL, 20, '2017-07-26 07:38:26', '2018-04-17 23:14:01'),
(267, 78, '104.192.74.46', NULL, 14, '2017-07-26 07:38:26', '2018-03-03 01:27:30'),
(268, 74, '104.192.74.46', NULL, 20, '2017-07-26 07:38:27', '2018-04-17 23:14:01'),
(269, 79, '180.169.16.78', NULL, 5, '2017-07-26 19:37:05', '2017-09-17 19:02:05'),
(270, 79, '104.192.74.36', NULL, 22, '2017-07-27 00:14:34', '2018-05-18 03:26:10'),
(271, 79, '116.227.218.220', NULL, 1, '2017-07-28 06:01:48', '2017-07-28 06:01:48'),
(272, 79, '104.192.74.28', NULL, 8, '2017-07-28 06:15:16', '2018-04-19 06:22:23'),
(273, 48, '104.192.74.28', NULL, 8, '2017-07-28 06:15:17', '2018-04-19 06:22:24'),
(274, 49, '104.192.74.28', NULL, 8, '2017-07-28 06:15:18', '2018-04-19 06:22:24'),
(275, 75, '104.192.74.28', NULL, 8, '2017-07-28 06:15:18', '2018-04-19 06:22:26'),
(276, 78, '104.192.74.28', NULL, 6, '2017-07-28 06:15:18', '2017-11-27 01:17:59'),
(277, 74, '104.192.74.28', NULL, 8, '2017-07-28 06:15:19', '2018-04-19 06:22:26'),
(278, 79, '104.192.74.43', NULL, 24, '2017-07-29 02:15:17', '2018-04-21 05:41:05'),
(279, 75, '104.192.74.43', NULL, 24, '2017-07-29 02:15:18', '2018-04-21 05:41:07'),
(280, 78, '104.192.74.43', NULL, 20, '2017-07-29 02:15:19', '2018-02-23 05:50:11'),
(281, 79, '104.192.74.17', NULL, 18, '2017-07-30 08:32:55', '2018-04-05 08:34:36'),
(282, 79, '104.192.74.23', NULL, 28, '2017-07-30 23:21:31', '2018-05-07 06:53:54'),
(283, 48, '104.192.74.23', NULL, 28, '2017-07-30 23:21:31', '2018-05-07 06:53:55'),
(284, 49, '104.192.74.23', NULL, 28, '2017-07-30 23:21:32', '2018-05-07 06:53:55'),
(285, 75, '104.192.74.23', NULL, 28, '2017-07-30 23:21:32', '2018-05-07 06:53:56'),
(286, 78, '104.192.74.23', NULL, 18, '2017-07-30 23:21:32', '2018-01-31 03:15:51'),
(287, 74, '104.192.74.23', NULL, 28, '2017-07-30 23:21:33', '2018-05-07 06:53:56'),
(288, 79, '104.192.74.12', NULL, 20, '2017-08-01 09:18:29', '2018-04-06 05:30:09'),
(289, 79, '104.192.74.31', NULL, 24, '2017-08-02 09:29:05', '2018-05-22 22:19:50'),
(290, 49, '104.192.74.31', NULL, 24, '2017-08-02 09:29:06', '2018-05-22 22:19:52'),
(291, 48, '104.192.74.31', NULL, 24, '2017-08-02 09:29:06', '2018-05-22 22:19:52'),
(292, 78, '104.192.74.31', NULL, 18, '2017-08-02 09:29:07', '2018-01-28 09:31:06'),
(293, 75, '104.192.74.31', NULL, 24, '2017-08-02 09:29:07', '2018-05-22 22:19:53'),
(294, 74, '104.192.74.31', NULL, 24, '2017-08-02 09:29:08', '2018-05-22 22:19:53'),
(295, 79, '104.192.74.44', NULL, 14, '2017-08-03 03:30:10', '2018-04-16 07:37:54'),
(296, 49, '158.69.225.33', NULL, 1, '2017-08-04 00:26:49', '2017-08-04 00:26:49'),
(297, 79, '158.69.225.33', NULL, 1, '2017-08-04 00:26:52', '2017-08-04 00:26:52'),
(298, 74, '158.69.225.33', NULL, 1, '2017-08-04 00:26:53', '2017-08-04 00:26:53'),
(299, 79, '69.58.178.57', NULL, 1, '2017-08-04 05:30:23', '2017-08-04 05:30:23'),
(300, 48, '69.58.178.57', NULL, 1, '2017-08-04 05:30:27', '2017-08-04 05:30:27'),
(301, 49, '69.58.178.57', NULL, 1, '2017-08-04 05:30:30', '2017-08-04 05:30:30'),
(302, 75, '69.58.178.57', NULL, 1, '2017-08-04 05:30:32', '2017-08-04 05:30:32'),
(303, 78, '69.58.178.57', NULL, 1, '2017-08-04 05:30:34', '2017-08-04 05:30:34'),
(304, 79, '104.192.74.14', NULL, 28, '2017-08-04 11:30:35', '2018-04-11 02:03:30'),
(305, 79, '104.192.74.15', NULL, 20, '2017-08-06 02:13:53', '2018-03-27 04:41:48'),
(306, 79, '104.192.74.21', NULL, 18, '2017-08-06 23:54:06', '2018-05-22 08:33:14'),
(307, 48, '104.192.74.21', NULL, 18, '2017-08-06 23:54:07', '2018-05-22 08:33:15'),
(308, 49, '104.192.74.21', NULL, 18, '2017-08-06 23:54:07', '2018-05-22 08:33:15'),
(309, 75, '104.192.74.21', NULL, 18, '2017-08-06 23:54:07', '2018-05-22 08:33:17'),
(310, 78, '104.192.74.21', NULL, 16, '2017-08-06 23:54:08', '2018-02-05 08:40:57'),
(311, 74, '104.192.74.21', NULL, 18, '2017-08-06 23:54:09', '2018-05-22 08:33:17'),
(312, 79, '104.192.74.19', NULL, 8, '2017-08-10 02:51:37', '2018-05-05 06:59:37'),
(313, 79, '104.192.74.35', NULL, 26, '2017-08-12 22:45:44', '2018-05-06 01:56:17'),
(314, 79, '104.192.74.37', NULL, 24, '2017-08-14 02:02:57', '2018-05-14 09:05:00'),
(315, 79, '104.192.74.24', NULL, 20, '2017-08-15 02:37:59', '2018-03-20 02:29:53'),
(316, 79, '104.192.74.20', NULL, 18, '2017-08-19 01:24:16', '2018-04-13 03:01:38'),
(317, 49, '104.192.74.20', NULL, 18, '2017-08-19 01:24:17', '2018-04-13 03:01:39'),
(318, 48, '104.192.74.20', NULL, 18, '2017-08-19 01:24:17', '2018-04-13 03:01:39'),
(319, 75, '104.192.74.20', NULL, 18, '2017-08-19 01:24:17', '2018-04-13 03:01:40'),
(320, 78, '104.192.74.20', NULL, 14, '2017-08-19 01:24:18', '2018-02-24 23:02:05'),
(321, 74, '104.192.74.20', NULL, 18, '2017-08-19 01:24:18', '2018-04-13 03:01:41'),
(322, 79, '104.192.74.41', NULL, 18, '2017-08-21 02:08:41', '2018-05-03 07:02:08'),
(323, 48, '104.192.74.41', NULL, 16, '2017-08-21 02:08:41', '2018-05-03 07:02:09'),
(324, 49, '104.192.74.41', NULL, 18, '2017-08-21 02:08:42', '2018-05-03 07:02:09'),
(325, 75, '104.192.74.41', NULL, 18, '2017-08-21 02:08:42', '2018-05-03 07:02:10'),
(326, 78, '104.192.74.41', NULL, 16, '2017-08-21 02:08:42', '2018-03-02 10:05:42'),
(327, 74, '104.192.74.41', NULL, 18, '2017-08-21 02:08:43', '2018-05-03 07:02:10'),
(328, 79, '104.192.74.40', NULL, 14, '2017-08-25 07:44:01', '2018-04-27 23:23:26'),
(329, 48, '104.192.74.40', NULL, 14, '2017-08-25 07:44:02', '2018-04-27 23:23:28'),
(330, 49, '104.192.74.40', NULL, 14, '2017-08-25 07:44:02', '2018-04-27 23:23:28'),
(331, 75, '104.192.74.40', NULL, 14, '2017-08-25 07:44:02', '2018-04-27 23:23:29'),
(332, 78, '104.192.74.40', NULL, 6, '2017-08-25 07:44:03', '2018-01-19 09:35:19'),
(333, 74, '104.192.74.40', NULL, 14, '2017-08-25 07:44:03', '2018-04-27 23:23:29'),
(334, 79, '104.192.74.26', NULL, 12, '2017-08-27 10:40:15', '2018-04-12 07:10:09'),
(335, 48, '104.192.74.26', NULL, 12, '2017-08-27 10:40:15', '2018-04-12 07:10:10'),
(336, 49, '104.192.74.26', NULL, 12, '2017-08-27 10:40:16', '2018-04-12 07:10:10'),
(337, 75, '104.192.74.26', NULL, 12, '2017-08-27 10:40:16', '2018-04-12 07:10:12'),
(338, 78, '104.192.74.26', NULL, 10, '2017-08-27 10:40:16', '2018-02-14 04:50:22'),
(339, 74, '104.192.74.26', NULL, 12, '2017-08-27 10:40:17', '2018-04-12 07:10:12'),
(340, 79, '104.192.74.45', NULL, 14, '2017-08-28 12:05:35', '2018-04-29 03:23:08'),
(341, 79, '104.192.74.38', NULL, 20, '2017-08-29 06:35:59', '2018-01-03 10:51:44'),
(342, 79, '104.192.74.27', NULL, 28, '2017-08-30 07:09:06', '2018-03-18 22:01:47'),
(343, 79, '192.99.66.206', NULL, 1, '2017-08-31 00:29:38', '2017-08-31 00:29:38'),
(344, 48, '192.99.66.206', NULL, 1, '2017-08-31 00:29:54', '2017-08-31 00:29:54'),
(345, 49, '192.99.66.206', NULL, 1, '2017-08-31 00:29:59', '2017-08-31 00:29:59'),
(346, 75, '192.99.66.206', NULL, 1, '2017-08-31 00:30:03', '2017-08-31 00:30:03'),
(347, 78, '192.99.66.206', NULL, 1, '2017-08-31 00:30:07', '2017-08-31 00:30:07'),
(348, 74, '192.99.66.206', NULL, 1, '2017-08-31 00:30:22', '2017-08-31 00:30:22'),
(349, 79, '104.192.74.11', NULL, 18, '2017-08-31 06:23:21', '2018-05-09 05:22:44'),
(350, 79, '69.58.178.56', NULL, 1, '2017-09-02 17:53:10', '2017-09-02 17:53:10'),
(351, 79, '104.192.74.18', NULL, 20, '2017-09-03 09:11:00', '2018-05-02 07:03:52'),
(352, 48, '104.192.74.18', NULL, 20, '2017-09-03 09:11:00', '2018-05-02 07:03:53'),
(353, 75, '104.192.74.18', NULL, 20, '2017-09-03 09:11:01', '2018-05-02 07:03:54'),
(354, 49, '104.192.74.18', NULL, 20, '2017-09-03 09:11:01', '2018-05-02 07:03:53'),
(355, 78, '104.192.74.18', NULL, 12, '2017-09-03 09:11:02', '2018-01-16 01:21:06'),
(356, 74, '104.192.74.18', NULL, 20, '2017-09-03 09:11:02', '2018-05-02 07:03:55'),
(357, 79, '104.192.74.39', NULL, 22, '2017-09-06 00:21:15', '2018-05-21 08:34:59'),
(358, 48, '104.192.74.39', NULL, 22, '2017-09-06 00:21:15', '2018-05-21 08:35:01'),
(359, 49, '104.192.74.39', NULL, 22, '2017-09-06 00:21:16', '2018-05-21 08:35:01'),
(360, 75, '104.192.74.39', NULL, 22, '2017-09-06 00:21:16', '2018-05-21 08:35:02'),
(361, 78, '104.192.74.39', NULL, 12, '2017-09-06 00:21:16', '2018-03-05 23:39:16'),
(362, 74, '104.192.74.39', NULL, 22, '2017-09-06 00:21:17', '2018-05-21 08:35:03'),
(363, 79, '104.192.74.29', NULL, 16, '2017-09-08 05:40:03', '2018-04-24 08:20:43'),
(364, 79, '104.192.74.16', NULL, 6, '2017-09-14 08:04:42', '2018-01-08 10:32:17'),
(365, 48, '104.192.74.16', NULL, 6, '2017-09-14 08:04:43', '2018-01-08 10:32:18'),
(366, 49, '104.192.74.16', NULL, 6, '2017-09-14 08:04:44', '2018-01-08 10:32:18'),
(367, 75, '104.192.74.16', NULL, 6, '2017-09-14 08:04:44', '2018-01-08 10:32:18'),
(368, 78, '104.192.74.16', NULL, 6, '2017-09-14 08:04:44', '2018-01-08 10:32:20'),
(369, 74, '104.192.74.16', NULL, 6, '2017-09-14 08:04:45', '2018-01-08 10:32:20'),
(370, 49, '167.114.157.79', NULL, 2, '2017-09-14 12:22:53', '2017-11-02 11:06:52'),
(371, 79, '167.114.157.79', NULL, 2, '2017-09-14 12:22:55', '2017-11-02 11:06:55'),
(372, 74, '167.114.157.79', NULL, 2, '2017-09-14 12:22:56', '2017-11-02 11:06:56'),
(373, 79, '104.192.74.30', NULL, 18, '2017-09-14 21:53:31', '2018-05-19 03:01:52'),
(374, 75, '104.192.74.30', NULL, 18, '2017-09-14 21:53:32', '2018-05-19 03:01:54'),
(375, 78, '104.192.74.30', NULL, 10, '2017-09-14 21:53:33', '2018-02-16 05:32:39'),
(376, 79, '104.192.74.13', NULL, 12, '2017-09-19 05:27:54', '2018-05-20 00:54:01'),
(377, 79, '69.58.178.59', NULL, 2, '2017-10-03 19:47:23', '2017-12-10 02:36:52'),
(378, 48, '69.58.178.59', NULL, 2, '2017-10-03 19:47:26', '2017-12-10 02:36:56'),
(379, 49, '69.58.178.59', NULL, 2, '2017-10-03 19:47:27', '2017-12-10 02:36:58'),
(380, 75, '69.58.178.59', NULL, 2, '2017-10-03 19:47:28', '2017-12-10 02:36:59'),
(381, 78, '69.58.178.59', NULL, 2, '2017-10-03 19:47:29', '2017-12-10 02:37:00'),
(382, 49, '167.114.172.223', NULL, 2, '2017-10-11 07:10:56', '2018-01-28 03:34:17'),
(383, 79, '167.114.172.223', NULL, 2, '2017-10-11 07:10:58', '2018-01-28 03:34:19'),
(384, 74, '167.114.172.223', NULL, 2, '2017-10-11 07:10:59', '2018-01-28 03:34:20'),
(385, 79, '104.192.74.46', NULL, 18, '2017-10-11 10:45:11', '2018-04-17 23:13:58'),
(386, 79, '104.192.74.25', NULL, 14, '2017-10-17 22:59:48', '2018-04-02 02:16:21'),
(387, 74, '180.173.192.94', NULL, 1, '2017-10-25 17:37:00', '2017-10-25 17:37:00'),
(388, 79, '69.58.178.58', NULL, 3, '2017-11-05 18:13:53', '2018-02-05 18:02:20'),
(389, 48, '69.58.178.58', NULL, 3, '2017-11-05 18:13:56', '2018-02-05 18:02:23'),
(390, 49, '69.58.178.58', NULL, 3, '2017-11-05 18:13:57', '2018-02-05 18:02:24'),
(391, 75, '69.58.178.58', NULL, 3, '2017-11-05 18:13:58', '2018-02-05 18:02:25'),
(392, 78, '69.58.178.58', NULL, 3, '2017-11-05 18:13:59', '2018-02-05 18:02:27'),
(393, 79, '104.192.74.42', NULL, 16, '2017-11-09 03:51:42', '2018-05-11 22:28:46'),
(394, 75, '207.46.13.89', NULL, 1, '2017-11-15 08:03:15', '2017-11-15 08:03:15'),
(395, 74, '207.46.13.89', NULL, 1, '2017-11-15 11:09:36', '2017-11-15 11:09:36'),
(396, 79, '167.114.209.38', NULL, 2, '2017-11-15 20:16:39', '2017-12-26 03:25:21'),
(397, 48, '157.55.39.49', NULL, 1, '2017-11-16 05:31:22', '2017-11-16 05:31:22'),
(398, 75, '116.24.136.154', NULL, 1, '2017-11-16 17:43:54', '2017-11-16 17:43:54'),
(399, 79, '40.77.167.4', NULL, 1, '2017-11-17 00:23:01', '2017-11-17 00:23:01'),
(400, 78, '40.77.167.4', NULL, 1, '2017-11-17 07:43:32', '2017-11-17 07:43:32'),
(401, 49, '207.46.13.7', NULL, 1, '2017-11-19 00:55:47', '2017-11-19 00:55:47'),
(402, 75, '40.77.167.99', NULL, 1, '2017-11-21 04:01:31', '2017-11-21 04:01:31'),
(403, 78, '40.77.167.57', NULL, 1, '2017-11-22 22:17:32', '2017-11-22 22:17:32'),
(404, 74, '207.46.13.111', NULL, 1, '2017-11-23 03:10:02', '2017-11-23 03:10:02'),
(405, 79, '157.55.39.157', NULL, 1, '2017-11-23 23:00:58', '2017-11-23 23:00:58'),
(406, 78, '157.55.39.157', NULL, 1, '2017-11-25 12:11:54', '2017-11-25 12:11:54'),
(407, 49, '157.55.39.157', NULL, 1, '2017-11-26 07:34:03', '2017-11-26 07:34:03'),
(408, 79, '40.77.167.106', NULL, 2, '2017-11-27 20:22:37', '2017-11-28 00:21:23'),
(409, 75, '45.32.27.251', NULL, 4, '2017-12-01 01:19:46', '2018-01-30 22:49:13'),
(410, 48, '101.88.225.149', NULL, 8, '2017-12-07 04:38:02', '2018-04-08 01:19:53'),
(411, 75, '106.11.156.249', NULL, 1, '2017-12-31 23:47:31', '2017-12-31 23:47:31'),
(412, 48, '106.11.156.249', NULL, 1, '2018-01-01 10:50:50', '2018-01-01 10:50:50'),
(413, 79, '106.11.152.131', NULL, 1, '2018-01-03 08:10:28', '2018-01-03 08:10:28'),
(414, 78, '106.11.154.184', NULL, 1, '2018-01-04 19:38:05', '2018-01-04 19:38:05'),
(415, 49, '158.69.26.144', NULL, 1, '2018-01-13 00:11:46', '2018-01-13 00:11:46'),
(416, 79, '158.69.26.144', NULL, 1, '2018-01-13 00:11:49', '2018-01-13 00:11:49'),
(417, 74, '158.69.26.144', NULL, 1, '2018-01-13 00:11:50', '2018-01-13 00:11:50'),
(418, 49, '180.169.102.194', NULL, 1, '2018-01-19 01:14:19', '2018-01-19 01:14:19'),
(419, 48, '180.169.102.194', NULL, 1, '2018-01-19 01:14:49', '2018-01-19 01:14:49'),
(420, 79, '180.169.102.194', NULL, 1, '2018-01-19 01:15:04', '2018-01-19 01:15:04'),
(421, 75, '180.169.102.194', NULL, 1, '2018-01-19 01:15:13', '2018-01-19 01:15:13'),
(422, 49, '106.11.159.181', NULL, 1, '2018-01-27 18:58:26', '2018-01-27 18:58:26'),
(423, 48, '78.129.250.17', NULL, 1, '2018-01-28 03:07:40', '2018-01-28 03:07:40'),
(424, 78, '78.129.250.17', NULL, 1, '2018-01-28 03:07:42', '2018-01-28 03:07:42'),
(425, 75, '78.129.250.17', NULL, 1, '2018-01-28 03:07:43', '2018-01-28 03:07:43'),
(426, 74, '78.129.250.17', NULL, 1, '2018-01-28 03:07:45', '2018-01-28 03:07:45'),
(427, 79, '78.129.250.17', NULL, 1, '2018-01-28 03:07:46', '2018-01-28 03:07:46'),
(428, 49, '78.129.250.17', NULL, 1, '2018-01-28 03:07:48', '2018-01-28 03:07:48'),
(429, 79, '45.32.27.251', NULL, 1, '2018-01-30 22:44:36', '2018-01-30 22:44:36'),
(430, 74, '45.32.27.251', NULL, 1, '2018-01-30 22:44:52', '2018-01-30 22:44:52'),
(431, 49, '45.32.27.251', NULL, 1, '2018-01-30 22:45:03', '2018-01-30 22:45:03'),
(432, 79, '101.88.225.149', NULL, 8, '2018-01-31 22:24:16', '2018-04-23 23:25:57'),
(433, 79, '104.192.74.22', NULL, 12, '2018-02-15 06:27:54', '2018-05-16 07:49:30'),
(434, 49, '158.69.117.141', NULL, 1, '2018-02-16 08:52:10', '2018-02-16 08:52:10'),
(435, 79, '158.69.117.141', NULL, 1, '2018-02-16 08:52:13', '2018-02-16 08:52:13'),
(436, 74, '158.69.117.141', NULL, 1, '2018-02-16 08:52:15', '2018-02-16 08:52:15'),
(437, 74, '106.11.154.204', NULL, 1, '2018-02-16 16:32:48', '2018-02-16 16:32:48'),
(438, 49, '101.88.225.149', NULL, 4, '2018-02-28 00:59:20', '2018-04-19 01:28:27'),
(439, 74, '101.88.225.149', NULL, 3, '2018-02-28 00:59:35', '2018-03-04 22:44:12'),
(440, 78, '101.88.225.149', NULL, 5, '2018-02-28 01:02:55', '2018-03-06 01:20:35'),
(441, 79, '66.70.182.141', NULL, 1, '2018-02-28 15:23:01', '2018-02-28 15:23:01'),
(442, 48, '66.70.182.141', NULL, 1, '2018-02-28 15:23:16', '2018-02-28 15:23:16'),
(443, 49, '66.70.182.141', NULL, 1, '2018-02-28 15:23:21', '2018-02-28 15:23:21'),
(444, 75, '66.70.182.141', NULL, 1, '2018-02-28 15:23:25', '2018-02-28 15:23:25'),
(445, 78, '66.70.182.141', NULL, 1, '2018-02-28 15:23:28', '2018-02-28 15:23:28'),
(446, 74, '66.70.182.141', NULL, 1, '2018-02-28 15:23:43', '2018-02-28 15:23:43'),
(447, 75, '101.88.225.149', NULL, 3, '2018-03-01 23:55:10', '2018-03-30 01:37:55'),
(448, 78, '207.46.13.107', NULL, 1, '2018-03-03 18:05:19', '2018-03-03 18:05:19'),
(449, 80, '101.88.225.149', NULL, 12, '2018-03-05 00:35:52', '2018-04-24 23:22:10'),
(450, 81, '101.88.225.149', NULL, 9, '2018-03-05 01:16:50', '2018-03-30 01:38:30'),
(451, 82, '101.88.225.149', NULL, 8, '2018-03-05 01:52:11', '2018-04-19 01:27:55'),
(452, 80, '104.192.74.15', NULL, 6, '2018-03-05 02:54:54', '2018-03-27 04:41:45'),
(453, 82, '104.192.74.15', NULL, 6, '2018-03-05 02:54:55', '2018-03-27 04:41:47'),
(454, 81, '104.192.74.15', NULL, 6, '2018-03-05 02:54:57', '2018-03-27 04:41:48'),
(455, 74, '207.46.13.92', NULL, 1, '2018-03-05 11:08:16', '2018-03-05 11:08:16'),
(456, 80, '104.192.74.39', NULL, 12, '2018-03-05 23:39:09', '2018-05-21 08:34:56'),
(457, 82, '104.192.74.39', NULL, 12, '2018-03-05 23:39:10', '2018-05-21 08:34:58'),
(458, 81, '104.192.74.39', NULL, 12, '2018-03-05 23:39:12', '2018-05-21 08:34:59'),
(459, 79, '157.55.39.60', NULL, 1, '2018-03-05 23:52:49', '2018-03-05 23:52:49'),
(460, 80, '104.192.74.46', NULL, 6, '2018-03-07 07:11:21', '2018-04-17 23:13:54'),
(461, 82, '104.192.74.46', NULL, 6, '2018-03-07 07:11:22', '2018-04-17 23:13:56'),
(462, 81, '104.192.74.46', NULL, 6, '2018-03-07 07:11:24', '2018-04-17 23:13:58'),
(463, 80, '104.192.74.42', NULL, 10, '2018-03-08 00:33:08', '2018-05-11 22:28:43'),
(464, 82, '104.192.74.42', NULL, 10, '2018-03-08 00:33:10', '2018-05-11 22:28:44'),
(465, 81, '104.192.74.42', NULL, 10, '2018-03-08 00:33:11', '2018-05-11 22:28:45'),
(466, 49, '106.11.158.166', NULL, 1, '2018-03-08 01:44:46', '2018-03-08 01:44:46'),
(467, 48, '112.64.68.48', NULL, 2, '2018-03-08 17:02:22', '2018-03-08 17:06:33'),
(468, 80, '104.192.74.22', NULL, 10, '2018-03-09 00:31:39', '2018-05-16 07:49:26'),
(469, 82, '104.192.74.22', NULL, 10, '2018-03-09 00:31:40', '2018-05-16 07:49:28'),
(470, 81, '104.192.74.22', NULL, 10, '2018-03-09 00:31:42', '2018-05-16 07:49:29'),
(471, 80, '104.192.74.40', NULL, 8, '2018-03-10 02:53:43', '2018-04-27 23:23:23'),
(472, 82, '104.192.74.40', NULL, 8, '2018-03-10 02:53:44', '2018-04-27 23:23:25'),
(473, 81, '104.192.74.40', NULL, 8, '2018-03-10 02:53:45', '2018-04-27 23:23:26'),
(474, 82, '106.11.154.9', NULL, 1, '2018-03-10 18:25:48', '2018-03-10 18:25:48'),
(475, 80, '104.192.74.45', NULL, 6, '2018-03-10 23:19:20', '2018-04-29 03:23:04'),
(476, 82, '104.192.74.45', NULL, 6, '2018-03-10 23:19:22', '2018-04-29 03:23:06'),
(477, 81, '104.192.74.45', NULL, 6, '2018-03-10 23:19:23', '2018-04-29 03:23:08'),
(478, 81, '106.11.158.29', NULL, 1, '2018-03-11 19:30:19', '2018-03-11 19:30:19'),
(479, 80, '69.58.178.57', NULL, 2, '2018-03-12 01:14:54', '2018-04-19 12:33:26'),
(480, 82, '69.58.178.57', NULL, 2, '2018-03-12 01:14:57', '2018-04-19 12:33:28'),
(481, 81, '69.58.178.57', NULL, 2, '2018-03-12 01:15:01', '2018-04-19 12:33:32'),
(482, 80, '104.192.74.18', NULL, 8, '2018-03-12 06:15:18', '2018-05-02 07:03:49'),
(483, 82, '104.192.74.18', NULL, 8, '2018-03-12 06:15:20', '2018-05-02 07:03:50'),
(484, 81, '104.192.74.18', NULL, 8, '2018-03-12 06:15:22', '2018-05-02 07:03:51'),
(485, 79, '157.55.39.165', NULL, 1, '2018-03-12 19:06:15', '2018-03-12 19:06:15'),
(486, 80, '104.192.74.23', NULL, 10, '2018-03-13 08:07:26', '2018-05-07 06:53:50'),
(487, 82, '104.192.74.23', NULL, 10, '2018-03-13 08:07:27', '2018-05-07 06:53:51'),
(488, 81, '104.192.74.23', NULL, 10, '2018-03-13 08:07:30', '2018-05-07 06:53:53'),
(489, 48, '106.11.159.21', NULL, 1, '2018-03-14 03:57:29', '2018-03-14 03:57:29'),
(490, 74, '207.46.13.37', NULL, 1, '2018-03-14 05:02:02', '2018-03-14 05:02:02'),
(491, 75, '106.11.153.26', NULL, 1, '2018-03-14 17:58:57', '2018-03-14 17:58:57'),
(492, 80, '104.192.74.24', NULL, 4, '2018-03-15 06:31:09', '2018-03-20 02:29:50'),
(493, 82, '104.192.74.24', NULL, 4, '2018-03-15 06:31:10', '2018-03-20 02:29:52'),
(494, 81, '104.192.74.24', NULL, 4, '2018-03-15 06:31:12', '2018-03-20 02:29:53'),
(495, 79, '106.11.159.21', NULL, 1, '2018-03-16 21:22:35', '2018-03-16 21:22:35'),
(496, 80, '104.192.74.36', NULL, 8, '2018-03-16 23:23:00', '2018-05-18 03:26:08'),
(497, 82, '104.192.74.36', NULL, 8, '2018-03-16 23:23:01', '2018-05-18 03:26:09'),
(498, 81, '104.192.74.36', NULL, 8, '2018-03-16 23:23:03', '2018-05-18 03:26:10'),
(499, 82, '167.114.174.95', NULL, 1, '2018-03-18 10:41:43', '2018-03-18 10:41:43'),
(500, 75, '167.114.174.95', NULL, 1, '2018-03-18 10:41:48', '2018-03-18 10:41:48'),
(501, 80, '104.192.74.27', NULL, 2, '2018-03-18 22:01:43', '2018-03-18 22:01:44'),
(502, 82, '104.192.74.27', NULL, 2, '2018-03-18 22:01:45', '2018-03-18 22:01:45'),
(503, 81, '104.192.74.27', NULL, 2, '2018-03-18 22:01:46', '2018-03-18 22:01:47'),
(504, 79, '157.55.39.238', NULL, 1, '2018-03-19 17:55:45', '2018-03-19 17:55:45'),
(505, 74, '40.77.167.178', NULL, 1, '2018-03-19 21:50:04', '2018-03-19 21:50:04'),
(506, 82, '106.11.156.7', NULL, 1, '2018-03-20 00:02:53', '2018-03-20 00:02:53'),
(507, 74, '106.11.157.113', NULL, 1, '2018-03-21 04:33:37', '2018-03-21 04:33:37'),
(508, 80, '104.192.74.17', NULL, 4, '2018-03-21 07:44:41', '2018-04-05 08:34:33'),
(509, 82, '104.192.74.17', NULL, 4, '2018-03-21 07:44:42', '2018-04-05 08:34:34'),
(510, 81, '104.192.74.17', NULL, 4, '2018-03-21 07:44:44', '2018-04-05 08:34:35'),
(511, 48, '106.11.154.103', NULL, 1, '2018-03-23 08:07:52', '2018-03-23 08:07:52'),
(512, 79, '106.11.159.125', NULL, 1, '2018-03-23 08:07:55', '2018-03-23 08:07:55'),
(513, 75, '106.11.155.121', NULL, 1, '2018-03-23 08:07:56', '2018-03-23 08:07:56'),
(514, 49, '106.11.158.117', NULL, 1, '2018-03-23 23:50:47', '2018-03-23 23:50:47'),
(515, 80, '104.192.74.20', NULL, 4, '2018-03-24 05:29:27', '2018-04-13 03:01:35'),
(516, 82, '104.192.74.20', NULL, 4, '2018-03-24 05:29:29', '2018-04-13 03:01:36'),
(517, 81, '104.192.74.20', NULL, 4, '2018-03-24 05:29:30', '2018-04-13 03:01:37'),
(518, 74, '40.77.167.156', NULL, 1, '2018-03-24 17:02:12', '2018-03-24 17:02:12'),
(519, 80, '106.11.159.125', NULL, 1, '2018-03-26 09:37:35', '2018-03-26 09:37:35'),
(520, 80, '104.192.74.37', NULL, 6, '2018-03-31 09:02:51', '2018-05-14 09:04:57'),
(521, 82, '104.192.74.37', NULL, 6, '2018-03-31 09:02:52', '2018-05-14 09:04:59'),
(522, 81, '104.192.74.37', NULL, 6, '2018-03-31 09:02:54', '2018-05-14 09:05:00'),
(523, 80, '104.192.74.31', NULL, 6, '2018-03-31 22:49:19', '2018-05-22 22:19:47'),
(524, 82, '104.192.74.31', NULL, 6, '2018-03-31 22:49:20', '2018-05-22 22:19:49'),
(525, 81, '104.192.74.31', NULL, 6, '2018-03-31 22:49:22', '2018-05-22 22:19:50'),
(526, 74, '40.77.167.11', NULL, 1, '2018-03-31 23:16:45', '2018-03-31 23:16:45'),
(527, 80, '104.192.74.25', NULL, 2, '2018-04-02 02:16:17', '2018-04-02 02:16:18'),
(528, 82, '104.192.74.25', NULL, 2, '2018-04-02 02:16:18', '2018-04-02 02:16:19'),
(529, 81, '104.192.74.25', NULL, 2, '2018-04-02 02:16:20', '2018-04-02 02:16:21'),
(530, 74, '40.77.167.64', NULL, 1, '2018-04-02 20:09:42', '2018-04-02 20:09:42'),
(531, 80, '207.46.13.216', NULL, 1, '2018-04-04 09:13:12', '2018-04-04 09:13:12'),
(532, 80, '104.192.74.12', NULL, 2, '2018-04-06 05:30:05', '2018-04-06 05:30:05'),
(533, 82, '104.192.74.12', NULL, 2, '2018-04-06 05:30:06', '2018-04-06 05:30:07'),
(534, 81, '104.192.74.12', NULL, 2, '2018-04-06 05:30:08', '2018-04-06 05:30:09'),
(535, 80, '104.192.74.14', NULL, 6, '2018-04-07 03:16:35', '2018-04-11 02:03:27'),
(536, 82, '104.192.74.14', NULL, 6, '2018-04-07 03:16:37', '2018-04-11 02:03:28'),
(537, 81, '104.192.74.14', NULL, 6, '2018-04-07 03:16:38', '2018-04-11 02:03:30'),
(538, 74, '207.46.13.18', NULL, 1, '2018-04-07 20:53:23', '2018-04-07 20:53:23'),
(539, 80, '104.192.74.13', NULL, 4, '2018-04-07 22:48:43', '2018-05-20 00:53:58'),
(540, 82, '104.192.74.13', NULL, 4, '2018-04-07 22:48:45', '2018-05-20 00:53:59'),
(541, 81, '104.192.74.13', NULL, 4, '2018-04-07 22:48:47', '2018-05-20 00:54:01'),
(542, 80, '157.55.39.65', NULL, 1, '2018-04-11 06:56:25', '2018-04-11 06:56:25'),
(543, 49, '106.11.153.109', NULL, 1, '2018-04-11 15:56:29', '2018-04-11 15:56:29'),
(544, 80, '104.192.74.26', NULL, 2, '2018-04-12 07:10:05', '2018-04-12 07:10:06'),
(545, 82, '104.192.74.26', NULL, 2, '2018-04-12 07:10:06', '2018-04-12 07:10:07'),
(546, 81, '104.192.74.26', NULL, 2, '2018-04-12 07:10:08', '2018-04-12 07:10:09'),
(547, 74, '157.55.39.55', NULL, 1, '2018-04-12 12:49:19', '2018-04-12 12:49:19'),
(548, 49, '106.11.152.77', NULL, 1, '2018-04-14 00:06:40', '2018-04-14 00:06:40'),
(549, 80, '104.192.74.29', NULL, 4, '2018-04-14 04:45:35', '2018-04-24 08:20:40'),
(550, 82, '104.192.74.29', NULL, 4, '2018-04-14 04:45:36', '2018-04-24 08:20:41'),
(551, 81, '104.192.74.29', NULL, 4, '2018-04-14 04:45:38', '2018-04-24 08:20:43'),
(552, 80, '104.192.74.30', NULL, 8, '2018-04-14 04:52:33', '2018-05-19 03:01:49'),
(553, 82, '104.192.74.30', NULL, 8, '2018-04-14 04:52:34', '2018-05-19 03:01:50'),
(554, 81, '104.192.74.30', NULL, 8, '2018-04-14 04:52:36', '2018-05-19 03:01:52'),
(555, 80, '104.192.74.43', NULL, 4, '2018-04-15 00:04:30', '2018-04-21 05:41:02'),
(556, 82, '104.192.74.43', NULL, 4, '2018-04-15 00:04:31', '2018-04-21 05:41:03'),
(557, 81, '104.192.74.43', NULL, 4, '2018-04-15 00:04:32', '2018-04-21 05:41:04'),
(558, 80, '104.192.74.44', NULL, 2, '2018-04-16 07:37:50', '2018-04-16 07:37:51'),
(559, 82, '104.192.74.44', NULL, 2, '2018-04-16 07:37:52', '2018-04-16 07:37:52'),
(560, 81, '104.192.74.44', NULL, 2, '2018-04-16 07:37:53', '2018-04-16 07:37:54'),
(561, 74, '40.77.167.197', NULL, 1, '2018-04-17 11:30:16', '2018-04-17 11:30:16'),
(562, 81, '106.11.152.77', NULL, 1, '2018-04-17 22:46:22', '2018-04-17 22:46:22'),
(563, 82, '106.11.157.78', NULL, 1, '2018-04-18 09:39:19', '2018-04-18 09:39:19'),
(564, 80, '157.55.39.101', NULL, 1, '2018-04-18 23:08:48', '2018-04-18 23:08:48'),
(565, 80, '104.192.74.28', NULL, 2, '2018-04-19 06:22:19', '2018-04-19 06:22:20'),
(566, 82, '104.192.74.28', NULL, 2, '2018-04-19 06:22:20', '2018-04-19 06:22:21'),
(567, 81, '104.192.74.28', NULL, 2, '2018-04-19 06:22:22', '2018-04-19 06:22:23'),
(568, 81, '157.55.39.146', NULL, 1, '2018-04-20 07:55:49', '2018-04-20 07:55:49'),
(569, 82, '167.114.172.223', NULL, 1, '2018-04-20 21:56:49', '2018-04-20 21:56:49'),
(570, 75, '167.114.172.223', NULL, 1, '2018-04-20 21:56:53', '2018-04-20 21:56:53'),
(571, 79, '106.11.158.66', NULL, 1, '2018-04-22 16:37:37', '2018-04-22 16:37:37'),
(572, 80, '104.192.74.11', NULL, 4, '2018-04-23 07:56:00', '2018-05-09 05:22:41'),
(573, 82, '104.192.74.11', NULL, 4, '2018-04-23 07:56:02', '2018-05-09 05:22:42'),
(574, 81, '104.192.74.11', NULL, 4, '2018-04-23 07:56:03', '2018-05-09 05:22:44'),
(575, 74, '157.55.39.54', NULL, 1, '2018-04-23 15:07:25', '2018-04-23 15:07:25'),
(576, 81, '207.46.13.226', NULL, 1, '2018-04-26 05:44:40', '2018-04-26 05:44:40'),
(577, 80, '40.77.167.195', NULL, 1, '2018-04-27 17:33:51', '2018-04-27 17:33:51'),
(578, 74, '157.55.39.203', NULL, 1, '2018-04-29 04:03:42', '2018-04-29 04:03:42'),
(579, 80, '104.192.74.41', NULL, 2, '2018-05-03 07:02:04', '2018-05-03 07:02:04'),
(580, 82, '104.192.74.41', NULL, 2, '2018-05-03 07:02:05', '2018-05-03 07:02:06'),
(581, 81, '104.192.74.41', NULL, 2, '2018-05-03 07:02:07', '2018-05-03 07:02:07'),
(582, 80, '106.11.158.235', NULL, 1, '2018-05-03 08:46:26', '2018-05-03 08:46:26'),
(583, 80, '104.192.74.19', NULL, 2, '2018-05-05 06:59:34', '2018-05-05 06:59:34'),
(584, 82, '104.192.74.19', NULL, 2, '2018-05-05 06:59:35', '2018-05-05 06:59:36'),
(585, 81, '104.192.74.19', NULL, 2, '2018-05-05 06:59:36', '2018-05-05 06:59:37'),
(586, 80, '104.192.74.35', NULL, 2, '2018-05-06 01:56:13', '2018-05-06 01:56:14'),
(587, 82, '104.192.74.35', NULL, 2, '2018-05-06 01:56:15', '2018-05-06 01:56:16'),
(588, 81, '104.192.74.35', NULL, 2, '2018-05-06 01:56:16', '2018-05-06 01:56:17'),
(589, 80, '106.11.152.204', NULL, 1, '2018-05-11 01:43:06', '2018-05-11 01:43:06'),
(590, 81, '106.11.153.176', NULL, 1, '2018-05-19 09:01:09', '2018-05-19 09:01:09'),
(591, 80, '104.192.74.21', NULL, 2, '2018-05-22 08:33:10', '2018-05-22 08:33:10'),
(592, 82, '104.192.74.21', NULL, 2, '2018-05-22 08:33:11', '2018-05-22 08:33:12'),
(593, 81, '104.192.74.21', NULL, 2, '2018-05-22 08:33:13', '2018-05-22 08:33:14'),
(594, 80, '69.58.178.58', NULL, 1, '2018-05-23 07:38:13', '2018-05-23 07:38:13'),
(595, 82, '69.58.178.58', NULL, 1, '2018-05-23 07:39:46', '2018-05-23 07:39:46'),
(596, 81, '69.58.178.58', NULL, 1, '2018-05-23 07:41:54', '2018-05-23 07:41:54'),
(597, 82, '106.11.158.28', NULL, 1, '2018-05-25 22:09:11', '2018-05-25 22:09:11'),
(598, 75, '106.11.157.30', NULL, 1, '2018-05-26 08:16:18', '2018-05-26 08:16:18'),
(599, 48, '106.11.159.30', NULL, 1, '2018-05-26 20:00:46', '2018-05-26 20:00:46'),
(600, 74, '106.11.154.7', NULL, 1, '2018-05-27 23:31:53', '2018-05-27 23:31:53'),
(601, 79, '106.11.158.204', NULL, 1, '2018-05-28 22:55:03', '2018-05-28 22:55:03');

-- --------------------------------------------------------

--
-- 表的结构 `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
  `user_id` int(10) unsigned NOT NULL,
  `votable_id` int(10) unsigned NOT NULL,
  `votable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('up_vote','down_vote') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'up_vote',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_slug_unique` (`slug`),
  ADD KEY `articles_view_count_index` (`view_count`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `links_name_index` (`name`),
  ADD KEY `links_link_index` (`link`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `taggables`
--
ALTER TABLE `taggables`
  ADD KEY `taggables_tag_id_index` (`tag_id`),
  ADD KEY `taggables_taggable_id_index` (`taggable_id`),
  ADD KEY `taggables_taggable_type_index` (`taggable_type`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_tag_unique` (`tag`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_name_unique` (`name`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_confirm_code_unique` (`confirm_code`),
  ADD KEY `users_email_notify_enabled_index` (`email_notify_enabled`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitors_article_id_foreign` (`article_id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD KEY `votes_votable_type_index` (`votable_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=602;
--
-- 限制导出的表
--

--
-- 限制表 `visitors`
--
ALTER TABLE `visitors`
  ADD CONSTRAINT `visitors_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
