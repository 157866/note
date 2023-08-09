# Mybatis

> 前言：

去做连表查询的时候 使用resultMap返回结果集去重问题



场景复现

userEntity 类

```java
/*
 * 用户表
 */
@AllArgsConstructor
@ToString
@Data
@NoArgsConstructor
public class UserEntity {
    //    添加伪列防止 resultMap 去重
    private Integer rowNO;

    private String uid;

    private String userName;

    private String upassWord;

    private String unick;

    private int ustatus;
    //   包含 VoteEntity 类
    private VoteEntity  voteEntity;
}
```



VoteEntity类

```java
@Data
@AllArgsConstructor
@NoArgsConstructor
public class VoteEntity {
    private String vid;

    private String uid;

    private String pid;

    private String activityId;
    //    投票时间
    private String voteTime;
    //    投票时间戳
    private Long voteUpdateTime;

    private String ipAddress;

    private Integer count;

    private Integer status;
}
```



userMapper.xml 的 resultMap 编写

```xml
   
<resultMap id="UserAndVote" type="userEntity">
        <id column="rowNO" property="rowNO"/> //伪列用于不去重 把rowNo当成id
        <result column="unick" property="unick"/>
        <association property="voteEntity" javaType="voteEntity">
            <id column="vid" property="vid"/>
            <result column="vote_update_time" property="voteUpdateTime"/>
            <result column="count" property="count"/>
        </association>
    </resultMap>

```



userMappper.xml 的SQL编写

> MyBatis ResultMap去重操作，原因：MyBatis的ResultMap默认是把id作为map的主键，当id相同时，不管其他字段相不相同，它都当作相同的记录。那么主键是唯一的，所以他就会进行去重操作

在查询的结果中，使用 `@rowNo := @rowNo + 1 as rowNo` 这个表达式来计算行号。每次查询一行数据时，@rowNo的值会自动加1，从而实现行号的递增。

```java
    <select id="selectByVotePIdAndActivityId"  resultMap="UserAndVote">
        SELECT
        @rowNo := @rowNo + 1 as rowNo,  // 伪列 自增
        user_uid.vid, u.unick, user_uid.vote_update_time, user_uid.count
        FROM `user` u,(
        SELECT uid , vote_update_time, count, vid, `status`
        FROM `vote`
        WHERE  pid = #{pid} AND activity_id = #{ActivityId}
        ) user_uid
        WHERE u.uid = user_uid.uid
        AND user_uid.`status` = 0
    </select>
```



