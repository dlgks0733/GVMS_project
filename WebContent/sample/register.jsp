<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">샘플 등록</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post" class="form-horizontal">
					<div class="box-body box-form-custom">
						<div class="form-group input-long">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">제품명</label> 
							<div class="col-sm-10">
								<input type="text" name='prodname' class="form-control" placeholder="긴 입력용">
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">가격</label> 
							<div class="col-sm-10">
								<input type="text" name='price' class="form-control" placeholder="짧은 입력용">
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">수량</label> 
							<div class="col-sm-10">
								<input type="text" name='quantity' class="form-control" placeholder="짧은 입력용">
							</div>
						</div>
						<div class="form-group input-short">
							<label for="exampleInputEmail1" class="col-sm-2 control-label">내용</label> 
							<div class="col-sm-10">
								<textarea rows="5" name='quantity' class="form-control" placeholder="긴 내용 입력용"></textarea>
							</div>
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer btn-group-center">
						<button type="button" class="btn btn-cancel">취소</button>
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</form>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>
