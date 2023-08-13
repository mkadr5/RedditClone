import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  final String kind;
  final PostData data;

  Post({required this.kind, required this.data});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        kind: json["kind"],
        data: PostData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "data": data.toJson(),
      };
}

class PostData {
  final dynamic after;
  final int dist;
  final String modhash;
  final String geoFilter;
  final List<Child> children;
  final String before;

  PostData({
    this.after,
    required this.dist,
    required this.modhash,
    required this.geoFilter,
    required this.children,
    required this.before,
  });

  factory PostData.fromJson(Map<String, dynamic> json) => PostData(
        after: json["after"],
        dist: json["dist"],
        modhash: json["modhash"],
        geoFilter: json["geo_filter"],
        children:
            List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
        before: json["before"],
      );

  Map<String, dynamic> toJson() => {
        "after": after,
        "dist": dist,
        "modhash": modhash,
        "geo_filter": geoFilter,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
        "before": before,
      };
}

class Child {
  final String kind;
  final ChildData data;

  Child({
    required this.kind,
    required this.data,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        kind: json["kind"],
        data: ChildData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "data": data.toJson(),
      };
}

class ChildData {
  final dynamic approvedAtUtc;
  final String subreddit;
  final String selftext;
  final String authorFullname;
  final bool saved;
  final dynamic modReasonTitle;
  final int gilded;
  final bool clicked;
  final String title;
  final List<dynamic> linkFlairRichtext;
  final String subredditNamePrefixed;
  final bool hidden;
  final int pwls;
  final String linkFlairCssClass;
  final int downs;
  final dynamic thumbnailHeight;
  final dynamic topAwardedType;
  final bool hideScore;
  final String name;
  final bool quarantine;
  final String linkFlairTextColor;
  final double upvoteRatio;
  final String authorFlairBackgroundColor;
  final String subredditType;
  final int ups;
  final int totalAwardsReceived;
  final Gildings mediaEmbed;
  final dynamic thumbnailWidth;
  final dynamic authorFlairTemplateId;
  final bool isOriginalContent;
  final List<dynamic> userReports;
  final dynamic secureMedia;
  final bool isRedditMediaDomain;
  final bool isMeta;
  final dynamic category;
  final Gildings secureMediaEmbed;
  final String linkFlairText;
  final bool canModPost;
  final int score;
  final dynamic approvedBy;
  final bool isCreatedFromAdsUi;
  final bool authorPremium;
  final String thumbnail;
  final dynamic edited;
  final String authorFlairCssClass;
  final List<dynamic> authorFlairRichtext;
  final Gildings gildings;
  final String? postHint;
  final dynamic contentCategories;
  final bool isSelf;
  final dynamic modNote;
  final double created;
  final String linkFlairType;
  final int wls;
  final dynamic removedByCategory;
  final dynamic bannedBy;
  final String authorFlairType;
  final String domain;
  final bool allowLiveComments;
  final String selftextHtml;
  final dynamic likes;
  final dynamic suggestedSort;
  final dynamic bannedAtUtc;
  final dynamic viewCount;
  final bool archived;
  final bool noFollow;
  final bool isCrosspostable;
  final bool pinned;
  final bool over18;
  final Preview? preview;
  final List<dynamic> allAwardings;
  final List<dynamic> awarders;
  final bool mediaOnly;
  final String linkFlairTemplateId;
  final bool canGild;
  final bool spoiler;
  final bool locked;
  final String authorFlairText;
  final List<dynamic> treatmentTags;
  final bool visited;
  final dynamic removedBy;
  final dynamic numReports;
  final dynamic distinguished;
  final String subredditId;
  final bool authorIsBlocked;
  final dynamic modReasonBy;
  final dynamic removalReason;
  final String linkFlairBackgroundColor;
  final String id;
  final bool isRobotIndexable;
  final dynamic reportReasons;
  final String author;
  final dynamic discussionType;
  final int numComments;
  final bool sendReplies;
  final String whitelistStatus;
  final bool contestMode;
  final List<dynamic> modReports;
  final bool authorPatreonFlair;
  final String authorFlairTextColor;
  final String permalink;
  final String parentWhitelistStatus;
  final bool stickied;
  final String url;
  final int subredditSubscribers;
  final double createdUtc;
  final int numCrossposts;
  final dynamic media;
  final bool isVideo;

  ChildData({
    this.approvedAtUtc,
    required this.subreddit,
    required this.selftext,
    required this.authorFullname,
    required this.saved,
    this.modReasonTitle,
    required this.gilded,
    required this.clicked,
    required this.title,
    required this.linkFlairRichtext,
    required this.subredditNamePrefixed,
    required this.hidden,
    required this.pwls,
    required this.linkFlairCssClass,
    required this.downs,
    this.thumbnailHeight,
    this.topAwardedType,
    required this.hideScore,
    required this.name,
    required this.quarantine,
    required this.linkFlairTextColor,
    required this.upvoteRatio,
    required this.authorFlairBackgroundColor,
    required this.subredditType,
    required this.ups,
    required this.totalAwardsReceived,
    required this.mediaEmbed,
    this.thumbnailWidth,
    this.authorFlairTemplateId,
    required this.isOriginalContent,
    required this.userReports,
    this.secureMedia,
    required this.isRedditMediaDomain,
    required this.isMeta,
    this.category,
    required this.secureMediaEmbed,
    required this.linkFlairText,
    required this.canModPost,
    required this.score,
    this.approvedBy,
    required this.isCreatedFromAdsUi,
    required this.authorPremium,
    required this.thumbnail,
    required this.edited,
    required this.authorFlairCssClass,
    required this.authorFlairRichtext,
    required this.gildings,
    this.postHint,
    this.contentCategories,
    required this.isSelf,
    this.modNote,
    required this.created,
    required this.linkFlairType,
    required this.wls,
    this.removedByCategory,
    this.bannedBy,
    required this.authorFlairType,
    required this.domain,
    required this.allowLiveComments,
    required this.selftextHtml,
    this.likes,
    this.suggestedSort,
    this.bannedAtUtc,
    this.viewCount,
    required this.archived,
    required this.noFollow,
    required this.isCrosspostable,
    required this.pinned,
    required this.over18,
    this.preview,
    required this.allAwardings,
    required this.awarders,
    required this.mediaOnly,
    required this.linkFlairTemplateId,
    required this.canGild,
    required this.spoiler,
    required this.locked,
    required this.authorFlairText,
    required this.treatmentTags,
    required this.visited,
    this.removedBy,
    this.numReports,
    this.distinguished,
    required this.subredditId,
    required this.authorIsBlocked,
    this.modReasonBy,
    this.removalReason,
    required this.linkFlairBackgroundColor,
    required this.id,
    required this.isRobotIndexable,
    this.reportReasons,
    required this.author,
    this.discussionType,
    required this.numComments,
    required this.sendReplies,
    required this.whitelistStatus,
    required this.contestMode,
    required this.modReports,
    required this.authorPatreonFlair,
    required this.authorFlairTextColor,
    required this.permalink,
    required this.parentWhitelistStatus,
    required this.stickied,
    required this.url,
    required this.subredditSubscribers,
    required this.createdUtc,
    required this.numCrossposts,
    this.media,
    required this.isVideo,
  });

  factory ChildData.fromJson(Map<String, dynamic> json) => ChildData(
        approvedAtUtc: json["approved_at_utc"],
        subreddit: json["subreddit"],
        selftext: json["selftext"],
        authorFullname: json["author_fullname"],
        saved: json["saved"],
        modReasonTitle: json["mod_reason_title"],
        gilded: json["gilded"],
        clicked: json["clicked"],
        title: json["title"],
        linkFlairRichtext:
            List<dynamic>.from(json["link_flair_richtext"].map((x) => x)),
        subredditNamePrefixed: json["subreddit_name_prefixed"],
        hidden: json["hidden"],
        pwls: json["pwls"],
        linkFlairCssClass: json["link_flair_css_class"],
        downs: json["downs"],
        thumbnailHeight: json["thumbnail_height"],
        topAwardedType: json["top_awarded_type"],
        hideScore: json["hide_score"],
        name: json["name"],
        quarantine: json["quarantine"],
        linkFlairTextColor: json["link_flair_text_color"],
        upvoteRatio: json["upvote_ratio"]?.toDouble(),
        authorFlairBackgroundColor: json["author_flair_background_color"],
        subredditType: json["subreddit_type"],
        ups: json["ups"],
        totalAwardsReceived: json["total_awards_received"],
        mediaEmbed: Gildings.fromJson(json["media_embed"]),
        thumbnailWidth: json["thumbnail_width"],
        authorFlairTemplateId: json["author_flair_template_id"],
        isOriginalContent: json["is_original_content"],
        userReports: List<dynamic>.from(json["user_reports"].map((x) => x)),
        secureMedia: json["secure_media"],
        isRedditMediaDomain: json["is_reddit_media_domain"],
        isMeta: json["is_meta"],
        category: json["category"],
        secureMediaEmbed: Gildings.fromJson(json["secure_media_embed"]),
        linkFlairText: json["link_flair_text"],
        canModPost: json["can_mod_post"],
        score: json["score"],
        approvedBy: json["approved_by"],
        isCreatedFromAdsUi: json["is_created_from_ads_ui"],
        authorPremium: json["author_premium"],
        thumbnail: json["thumbnail"],
        edited: json["edited"],
        authorFlairCssClass: json["author_flair_css_class"],
        authorFlairRichtext:
            List<dynamic>.from(json["author_flair_richtext"].map((x) => x)),
        gildings: Gildings.fromJson(json["gildings"]),
        postHint: json["post_hint"],
        contentCategories: json["content_categories"],
        isSelf: json["is_self"],
        modNote: json["mod_note"],
        created: json["created"],
        linkFlairType: json["link_flair_type"],
        wls: json["wls"],
        removedByCategory: json["removed_by_category"],
        bannedBy: json["banned_by"],
        authorFlairType: json["author_flair_type"],
        domain: json["domain"],
        allowLiveComments: json["allow_live_comments"],
        selftextHtml: json["selftext_html"] ?? "",
        likes: json["likes"],
        suggestedSort: json["suggested_sort"],
        bannedAtUtc: json["banned_at_utc"],
        viewCount: json["view_count"],
        archived: json["archived"],
        noFollow: json["no_follow"],
        isCrosspostable: json["is_crosspostable"],
        pinned: json["pinned"],
        over18: json["over_18"],
        preview:
            json["preview"] == null ? null : Preview.fromJson(json["preview"]),
        allAwardings: List<dynamic>.from(json["all_awardings"].map((x) => x)),
        awarders: List<dynamic>.from(json["awarders"].map((x) => x)),
        mediaOnly: json["media_only"],
        linkFlairTemplateId: json["link_flair_template_id"],
        canGild: json["can_gild"],
        spoiler: json["spoiler"],
        locked: json["locked"],
        authorFlairText: json["author_flair_text"],
        treatmentTags: List<dynamic>.from(json["treatment_tags"].map((x) => x)),
        visited: json["visited"],
        removedBy: json["removed_by"],
        numReports: json["num_reports"],
        distinguished: json["distinguished"],
        subredditId: json["subreddit_id"],
        authorIsBlocked: json["author_is_blocked"],
        modReasonBy: json["mod_reason_by"],
        removalReason: json["removal_reason"],
        linkFlairBackgroundColor: json["link_flair_background_color"],
        id: json["id"],
        isRobotIndexable: json["is_robot_indexable"],
        reportReasons: json["report_reasons"],
        author: json["author"],
        discussionType: json["discussion_type"],
        numComments: json["num_comments"],
        sendReplies: json["send_replies"],
        whitelistStatus: json["whitelist_status"],
        contestMode: json["contest_mode"],
        modReports: List<dynamic>.from(json["mod_reports"].map((x) => x)),
        authorPatreonFlair: json["author_patreon_flair"],
        authorFlairTextColor: json["author_flair_text_color"],
        permalink: json["permalink"],
        parentWhitelistStatus: json["parent_whitelist_status"],
        stickied: json["stickied"],
        url: json["url"],
        subredditSubscribers: json["subreddit_subscribers"],
        createdUtc: json["created_utc"],
        numCrossposts: json["num_crossposts"],
        media: json["media"],
        isVideo: json["is_video"],
      );

  Map<String, dynamic> toJson() => {
        "approved_at_utc": approvedAtUtc,
        "subreddit": subreddit,
        "selftext": selftext,
        "author_fullname": authorFullname,
        "saved": saved,
        "mod_reason_title": modReasonTitle,
        "gilded": gilded,
        "clicked": clicked,
        "title": title,
        "link_flair_richtext":
            List<dynamic>.from(linkFlairRichtext.map((x) => x)),
        "subreddit_name_prefixed": subredditNamePrefixed,
        "hidden": hidden,
        "pwls": pwls,
        "link_flair_css_class": linkFlairCssClass,
        "downs": downs,
        "thumbnail_height": thumbnailHeight,
        "top_awarded_type": topAwardedType,
        "hide_score": hideScore,
        "name": name,
        "quarantine": quarantine,
        "link_flair_text_color": linkFlairTextColor,
        "upvote_ratio": upvoteRatio,
        "author_flair_background_color": authorFlairBackgroundColor,
        "subreddit_type": subredditType,
        "ups": ups,
        "total_awards_received": totalAwardsReceived,
        "media_embed": mediaEmbed.toJson(),
        "thumbnail_width": thumbnailWidth,
        "author_flair_template_id": authorFlairTemplateId,
        "is_original_content": isOriginalContent,
        "user_reports": List<dynamic>.from(userReports.map((x) => x)),
        "secure_media": secureMedia,
        "is_reddit_media_domain": isRedditMediaDomain,
        "is_meta": isMeta,
        "category": category,
        "secure_media_embed": secureMediaEmbed.toJson(),
        "link_flair_text": linkFlairText,
        "can_mod_post": canModPost,
        "score": score,
        "approved_by": approvedBy,
        "is_created_from_ads_ui": isCreatedFromAdsUi,
        "author_premium": authorPremium,
        "thumbnail": thumbnail,
        "edited": edited,
        "author_flair_css_class": authorFlairCssClass,
        "author_flair_richtext":
            List<dynamic>.from(authorFlairRichtext.map((x) => x)),
        "gildings": gildings.toJson(),
        "post_hint": postHint,
        "content_categories": contentCategories,
        "is_self": isSelf,
        "mod_note": modNote,
        "created": created,
        "link_flair_type": linkFlairType,
        "wls": wls,
        "removed_by_category": removedByCategory,
        "banned_by": bannedBy,
        "author_flair_type": authorFlairType,
        "domain": domain,
        "allow_live_comments": allowLiveComments,
        "selftext_html": selftextHtml,
        "likes": likes,
        "suggested_sort": suggestedSort,
        "banned_at_utc": bannedAtUtc,
        "view_count": viewCount,
        "archived": archived,
        "no_follow": noFollow,
        "is_crosspostable": isCrosspostable,
        "pinned": pinned,
        "over_18": over18,
        "preview": preview?.toJson(),
        "all_awardings": List<dynamic>.from(allAwardings.map((x) => x)),
        "awarders": List<dynamic>.from(awarders.map((x) => x)),
        "media_only": mediaOnly,
        "link_flair_template_id": linkFlairTemplateId,
        "can_gild": canGild,
        "spoiler": spoiler,
        "locked": locked,
        "author_flair_text": authorFlairText,
        "treatment_tags": List<dynamic>.from(treatmentTags.map((x) => x)),
        "visited": visited,
        "removed_by": removedBy,
        "num_reports": numReports,
        "distinguished": distinguished,
        "subreddit_id": subredditId,
        "author_is_blocked": authorIsBlocked,
        "mod_reason_by": modReasonBy,
        "removal_reason": removalReason,
        "link_flair_background_color": linkFlairBackgroundColor,
        "id": id,
        "is_robot_indexable": isRobotIndexable,
        "report_reasons": reportReasons,
        "author": author,
        "discussion_type": discussionType,
        "num_comments": numComments,
        "send_replies": sendReplies,
        "whitelist_status": whitelistStatus,
        "contest_mode": contestMode,
        "mod_reports": List<dynamic>.from(modReports.map((x) => x)),
        "author_patreon_flair": authorPatreonFlair,
        "author_flair_text_color": authorFlairTextColor,
        "permalink": permalink,
        "parent_whitelist_status": parentWhitelistStatus,
        "stickied": stickied,
        "url": url,
        "subreddit_subscribers": subredditSubscribers,
        "created_utc": createdUtc,
        "num_crossposts": numCrossposts,
        "media": media,
        "is_video": isVideo,
      };
}

class Gildings {
  Gildings();

  factory Gildings.fromJson(Map<String, dynamic> json) => Gildings();

  Map<String, dynamic> toJson() => {};
}

class Preview {
  final List<Image> images;
  final bool enabled;

  Preview({
    required this.images,
    required this.enabled,
  });

  factory Preview.fromJson(Map<String, dynamic> json) => Preview(
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        enabled: json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "enabled": enabled,
      };
}

class Image {
  final Source source;
  final List<Source> resolutions;
  final Gildings variants;
  final String id;

  Image({
    required this.source,
    required this.resolutions,
    required this.variants,
    required this.id,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        source: Source.fromJson(json["source"]),
        resolutions: List<Source>.from(
            json["resolutions"].map((x) => Source.fromJson(x))),
        variants: Gildings.fromJson(json["variants"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "resolutions": List<dynamic>.from(resolutions.map((x) => x.toJson())),
        "variants": variants.toJson(),
        "id": id,
      };
}

class Source {
  final String url;
  final int width;
  final int height;

  Source({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}
