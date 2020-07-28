; ModuleID = 'GiannSpider42'
source_filename = "GiannSpider42"

@strtmp = private unnamed_addr constant [16 x i8] c"Initial array: \00"
@strtmp.1 = private unnamed_addr constant [3 x i8] c", \00"
@strtmp.2 = private unnamed_addr constant [2 x i8] c"\0A\00"
@strtmp.3 = private unnamed_addr constant [15 x i8] c"Sorted array: \00"
@strtmp.4 = private unnamed_addr constant [3 x i8] c", \00"
@strtmp.5 = private unnamed_addr constant [2 x i8] c"\0A\00"

declare void @puti(i64)

declare void @putb(i8)

declare i8* @GC_malloc(i64)

declare void @GC_init()

declare void @putc(i8)

declare void @puts(i8*)

declare i64 @geti()

declare i8 @readString()

declare i8 @getc()

declare void @gets(i64, i8*)

declare i64 @extend(i8)

declare i8 @shrink(i64)

declare i64 @strlen(i8*)

declare i64 @strcmp(i8*, i8*)

declare void @strcpy(i8*, i8*)

declare void @strcat(i8*, i8*)

define void @first() {
first_entry:
  %fr = alloca { i64 }
  %fr_first_pos = getelementptr inbounds { i64 }, { i64 }* %fr, i32 0, i32 0
  store i64 0, i64* %fr_first_pos
  ret void
}

define void @main() {
func_entry:
  %main.fr = alloca { i64*, i64, i64, i64* }
  call void @GC_init()
  %newtmp = call i8* @GC_malloc(i64 128)
  %arraytmp = bitcast i8* %newtmp to { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }*
  %arrayptr = bitcast { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }* %arraytmp to i64*
  %var = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 3
  store i64* %arrayptr, i64** %var
  %var1 = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 1
  store i64 53, i64* %var1
  %var2 = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 2
  store i64 0, i64* %var2
  br label %loop

loop:                                             ; preds = %body, %func_entry
  %0 = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 2
  %loadtmp = load i64, i64* %0
  %lesstmp = icmp slt i64 %loadtmp, 16
  %loop_cond = icmp ne i1 %lesstmp, false
  br i1 %loop_cond, label %body, label %endfor

body:                                             ; preds = %loop
  %1 = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 1
  %loadtmp3 = load i64, i64* %1
  %multmp = mul i64 %loadtmp3, 137
  %addtmp = add i64 %multmp, 220
  %2 = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 2
  %loadtmp4 = load i64, i64* %2
  %addtmp5 = add i64 %addtmp, %loadtmp4
  %modtmp = srem i64 %addtmp5, 101
  %var6 = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 1
  store i64 %modtmp, i64* %var6
  %3 = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 1
  %loadtmp7 = load i64, i64* %3
  %4 = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 3
  %5 = load i64*, i64** %4
  %6 = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 2
  %loadtmp8 = load i64, i64* %6
  %arrtmp = getelementptr inbounds i64, i64* %5, i64 %loadtmp8
  store i64 %loadtmp7, i64* %arrtmp
  %7 = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 2
  %loadtmp9 = load i64, i64* %7
  %addtmp10 = add i64 %loadtmp9, 1
  %var11 = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 2
  store i64 %addtmp10, i64* %var11
  br label %loop

endfor:                                           ; preds = %loop
  %8 = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 3
  %loadtmp12 = load i64*, i64** %8
  call void @writeArray({ i64*, i64, i64, i64* }* %main.fr, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @strtmp, i64 0, i64 0), i64 16, i64* %loadtmp12)
  %9 = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 3
  %loadtmp13 = load i64*, i64** %9
  call void @bsort({ i64*, i64, i64, i64* }* %main.fr, i64 16, i64* %loadtmp13)
  %10 = getelementptr inbounds { i64*, i64, i64, i64* }, { i64*, i64, i64, i64* }* %main.fr, i32 0, i32 3
  %loadtmp14 = load i64*, i64** %10
  call void @writeArray({ i64*, i64, i64, i64* }* %main.fr, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @strtmp.3, i64 0, i64 0), i64 16, i64* %loadtmp14)
  ret void
}

define void @writeArray({ i64*, i64, i64, i64* }* %par, i8* %par15, i64 %par16, i64* %par17) {
func_entry:
  %writeArray.fr14 = alloca { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }
  %frame_elem18 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr14, i32 0, i32 0
  store { i64*, i64, i64, i64* }* %par, { i64*, i64, i64, i64* }** %frame_elem18
  %frame_elem19 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr14, i32 0, i32 1
  store i8* %par15, i8** %frame_elem19
  %frame_elem20 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr14, i32 0, i32 2
  store i64 %par16, i64* %frame_elem20
  %frame_elem21 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr14, i32 0, i32 3
  store i64* %par17, i64** %frame_elem21
  %writeArray.fr = alloca { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }
  %frame_elem = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr, i32 0, i32 0
  store { i64*, i64, i64, i64* }* %par, { i64*, i64, i64, i64* }** %frame_elem
  %frame_elem4 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr, i32 0, i32 1
  store i8* %par15, i8** %frame_elem4
  %frame_elem5 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr, i32 0, i32 2
  store i64 %par16, i64* %frame_elem5
  %frame_elem6 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr, i32 0, i32 3
  store i64* %par17, i64** %frame_elem6
  %0 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr, i32 0, i32 1
  %loadtmp = load i8*, i8** %0
  call void @puts(i8* %loadtmp)
  %var = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr, i32 0, i32 4
  store i64 0, i64* %var
  br label %loop

loop:                                             ; preds = %endif, %func_entry
  %1 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr, i32 0, i32 4
  %loadtmp7 = load i64, i64* %1
  %2 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr, i32 0, i32 2
  %loadtmp8 = load i64, i64* %2
  %lesstmp = icmp slt i64 %loadtmp7, %loadtmp8
  %loop_cond = icmp ne i1 %lesstmp, false
  br i1 %loop_cond, label %body, label %endfor

body:                                             ; preds = %loop
  %3 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr, i32 0, i32 4
  %loadtmp9 = load i64, i64* %3
  %greatertmp = icmp sgt i64 %loadtmp9, 0
  %ifcond = icmp ne i1 %greatertmp, false
  br i1 %ifcond, label %then, label %else

endfor:                                           ; preds = %loop
  call void @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @strtmp.2, i64 0, i64 0))
  ret void

then:                                             ; preds = %body
  call void @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @strtmp.1, i64 0, i64 0))
  br label %endif

endif:                                            ; preds = %then, %else
  %4 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr, i32 0, i32 3
  %5 = load i64*, i64** %4
  %6 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr, i32 0, i32 4
  %loadtmp10 = load i64, i64* %6
  %arrtmp = getelementptr inbounds i64, i64* %5, i64 %loadtmp10
  %load_arr_elem_tmp = load i64, i64* %arrtmp
  call void @puti(i64 %load_arr_elem_tmp)
  %7 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr, i32 0, i32 4
  %loadtmp11 = load i64, i64* %7
  %addtmp = add i64 %loadtmp11, 1
  %var12 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr, i32 0, i32 4
  store i64 %addtmp, i64* %var12
  br label %loop

else:                                             ; preds = %body
  br label %endif

func_entry13:                                     ; No predecessors!
  %8 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr14, i32 0, i32 1
  %loadtmp22 = load i8*, i8** %8
  call void @puts(i8* %loadtmp22)
  %var23 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr14, i32 0, i32 4
  store i64 0, i64* %var23
  br label %loop24

loop24:                                           ; preds = %endif35, %func_entry13
  %9 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr14, i32 0, i32 4
  %loadtmp27 = load i64, i64* %9
  %10 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr14, i32 0, i32 2
  %loadtmp28 = load i64, i64* %10
  %lesstmp29 = icmp slt i64 %loadtmp27, %loadtmp28
  %loop_cond30 = icmp ne i1 %lesstmp29, false
  br i1 %loop_cond30, label %body25, label %endfor26

body25:                                           ; preds = %loop24
  %11 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr14, i32 0, i32 4
  %loadtmp31 = load i64, i64* %11
  %greatertmp32 = icmp sgt i64 %loadtmp31, 0
  %ifcond33 = icmp ne i1 %greatertmp32, false
  br i1 %ifcond33, label %then34, label %else36

endfor26:                                         ; preds = %loop24
  call void @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @strtmp.5, i64 0, i64 0))
  ret void

then34:                                           ; preds = %body25
  call void @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @strtmp.4, i64 0, i64 0))
  br label %endif35

endif35:                                          ; preds = %then34, %else36
  %12 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr14, i32 0, i32 3
  %13 = load i64*, i64** %12
  %14 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr14, i32 0, i32 4
  %loadtmp37 = load i64, i64* %14
  %arrtmp38 = getelementptr inbounds i64, i64* %13, i64 %loadtmp37
  %load_arr_elem_tmp39 = load i64, i64* %arrtmp38
  call void @puti(i64 %load_arr_elem_tmp39)
  %15 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr14, i32 0, i32 4
  %loadtmp40 = load i64, i64* %15
  %addtmp41 = add i64 %loadtmp40, 1
  %var42 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }, { { i64*, i64, i64, i64* }*, i8*, i64, i64*, i64 }* %writeArray.fr14, i32 0, i32 4
  store i64 %addtmp41, i64* %var42
  br label %loop24

else36:                                           ; preds = %body25
  br label %endif35
}

define void @bsort({ i64*, i64, i64, i64* }* %par, i64 %par1, i64* %par2) {
func_entry:
  %bsort.fr = alloca { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }
  %frame_elem = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 0
  store { i64*, i64, i64, i64* }* %par, { i64*, i64, i64, i64* }** %frame_elem
  %frame_elem3 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 1
  store i64 %par1, i64* %frame_elem3
  %frame_elem4 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 2
  store i64* %par2, i64** %frame_elem4
  %var = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 4
  store i1 true, i1* %var
  br label %loop

loop:                                             ; preds = %endfor9, %func_entry
  %0 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 4
  %loadtmp = load i1, i1* %0
  %loop_cond = icmp ne i1 %loadtmp, false
  br i1 %loop_cond, label %body, label %endfor

body:                                             ; preds = %loop
  %var5 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 4
  store i1 false, i1* %var5
  %var6 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 3
  store i64 0, i64* %var6
  br label %loop7

endfor:                                           ; preds = %loop
  ret void

loop7:                                            ; preds = %endif, %body
  %1 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 3
  %loadtmp10 = load i64, i64* %1
  %2 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 1
  %loadtmp11 = load i64, i64* %2
  %subtmp = sub i64 %loadtmp11, 1
  %lesstmp = icmp slt i64 %loadtmp10, %subtmp
  %loop_cond12 = icmp ne i1 %lesstmp, false
  br i1 %loop_cond12, label %body8, label %endfor9

body8:                                            ; preds = %loop7
  %3 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 2
  %4 = load i64*, i64** %3
  %5 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 3
  %loadtmp13 = load i64, i64* %5
  %arrtmp = getelementptr inbounds i64, i64* %4, i64 %loadtmp13
  %load_arr_elem_tmp = load i64, i64* %arrtmp
  %6 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 2
  %7 = load i64*, i64** %6
  %8 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 3
  %loadtmp14 = load i64, i64* %8
  %addtmp = add i64 %loadtmp14, 1
  %arrtmp15 = getelementptr inbounds i64, i64* %7, i64 %addtmp
  %load_arr_elem_tmp16 = load i64, i64* %arrtmp15
  %greatertmp = icmp sgt i64 %load_arr_elem_tmp, %load_arr_elem_tmp16
  %ifcond = icmp ne i1 %greatertmp, false
  br i1 %ifcond, label %then, label %else

endfor9:                                          ; preds = %loop7
  br label %loop

then:                                             ; preds = %body8
  %9 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 2
  %10 = load i64*, i64** %9
  %11 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 3
  %loadtmp17 = load i64, i64* %11
  %arrtmp18 = getelementptr inbounds i64, i64* %10, i64 %loadtmp17
  %12 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 2
  %13 = load i64*, i64** %12
  %14 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 3
  %loadtmp19 = load i64, i64* %14
  %addtmp20 = add i64 %loadtmp19, 1
  %arrtmp21 = getelementptr inbounds i64, i64* %13, i64 %addtmp20
  call void @swap({ { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i64* %arrtmp18, i64* %arrtmp21)
  %var22 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 4
  store i1 true, i1* %var22
  br label %endif

endif:                                            ; preds = %then, %else
  %15 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 3
  %loadtmp23 = load i64, i64* %15
  %addtmp24 = add i64 %loadtmp23, 1
  %var25 = getelementptr inbounds { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %bsort.fr, i32 0, i32 3
  store i64 %addtmp24, i64* %var25
  br label %loop7

else:                                             ; preds = %body8
  br label %endif
}

define void @swap({ { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %par, i64* %par1, i64* %par2) {
func_entry:
  %swap.fr = alloca { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }
  %frame_elem = getelementptr inbounds { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }, { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }* %swap.fr, i32 0, i32 0
  store { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }* %par, { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }** %frame_elem
  %frame_elem3 = getelementptr inbounds { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }, { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }* %swap.fr, i32 0, i32 1
  store i64* %par1, i64** %frame_elem3
  %frame_elem4 = getelementptr inbounds { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }, { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }* %swap.fr, i32 0, i32 2
  store i64* %par2, i64** %frame_elem4
  %0 = getelementptr inbounds { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }, { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }* %swap.fr, i32 0, i32 1
  %loadbyerf = load i64*, i64** %0
  %loadtmp = load i64, i64* %loadbyerf
  %var = getelementptr inbounds { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }, { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }* %swap.fr, i32 0, i32 3
  store i64 %loadtmp, i64* %var
  %1 = getelementptr inbounds { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }, { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }* %swap.fr, i32 0, i32 2
  %loadbyerf5 = load i64*, i64** %1
  %loadtmp6 = load i64, i64* %loadbyerf5
  %var7 = getelementptr inbounds { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }, { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }* %swap.fr, i32 0, i32 1
  %loadbyerf8 = load i64*, i64** %var7
  store i64 %loadtmp6, i64* %loadbyerf8
  %2 = getelementptr inbounds { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }, { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }* %swap.fr, i32 0, i32 3
  %loadtmp9 = load i64, i64* %2
  %var10 = getelementptr inbounds { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }, { { { i64*, i64, i64, i64* }*, i64, i64*, i64, i1 }*, i64*, i64*, i64 }* %swap.fr, i32 0, i32 2
  %loadbyerf11 = load i64*, i64** %var10
  store i64 %loadtmp9, i64* %loadbyerf11
  ret void
}
