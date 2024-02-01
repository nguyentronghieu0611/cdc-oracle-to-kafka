# project cdc oracle to kafka by kafka connect for VKS
* Các bước thực hiện:
- Bước 1: Build các container:
    + docker-compose up --build (các lần sau chạy `docker-compose up` hoặc `docker-compose down`)
- Bước 2: Setup database oracle
    + Chạy file setup_db.sh bằng container oracledb19 để setup logmode, tạo user, phân quyền,...
    + Tạo các bảng dữ liệu bằng script oracle_script.sql
- Bước 3: Tạo connector kafka connect đến oracle để đọc log oracle và đẩy lên kafka
    + Tạo request json đến url kafka connect: http://localhost:8083/connectors nội dung body trong file oracle_cdc_connector.json
- Bước 4: Kiểm tra message khi cập nhật dữ liệu
    + Truy cập control center: http://localhost:9021/ topic có dạng ORCLCDB.VKS.**
Lưu ý: Nếu đã có sẵn database cấu hình thì comment container oracle trong docker-compose.yml lại không cần chạy!

###########
Mô tả chức năng các container trong project:
- oracle: database oracle
- broker: kafka
- schema-registry: quản lý và xác thực các schemas cho dữ liệu event trong topic, đồng thời tuần tự hóa và giải tuần tự hóa dữ liệu qua mạng
- connect: kafka connect phục vụ việc tạo connector đến database và stream đến kafka
- control-center: giao diện ui quản trị kafka