-- MySQL
CREATE TABLE valid_video_metadata (
    id INT NOT NULL AUTO_INCREMENT,
    filename VARCHAR(20),
    video_duration DOUBLE,
    fps TINYINT,
    video_frames SMALLINT
);

INSERT INTO valid_video_metadata (filename, video_duration, fps, video_frames) VALUES 
('v_JDg--pjY5gg.mp4','126.133333333333','30','3784'), 
('v_PLek2e8NlKc.mp4','184.566666666667','30','5537'), 
('v_0n3VRoYYYGU.mp4','232.366666666667','30','6971'), 
('v_c5dvRUBZw2Q.mp4','234.233333333333','30','7027'), 
('v_A1EflBqBv14.mp4','96.9666666666667','30','2909'), 
('v_mh_0QLZhrSY.mp4','100.033333333333','30','3001'), 
('v_RTnNxbG2V5o.mp4','235.733333333333','30','7072'), 
('v_UkA6pgt29VI.mp4','236.266666666667','30','7088'), 
('v_w2HnFjJei7k.mp4','35.1333333333333','30','1054'), 
('v_lW4OZ8eP3ns.mp4','69.9333333333333','30','2098'), 
('v_Yk3pQ18So90.mp4','203.633333333333','30','6109'), 
('v_M1-G6KEhY-M.mp4','129.966666666667','30','3899'), 
('v_i0AsepC37Sk.mp4','211.433333333333','30','6343'), 
('v_jzNdWjZm92s.mp4','194.033333333333','30','5821'), 
('v_j4Ru2L4u0Qk.mp4','91.3333333333333','30','2740');