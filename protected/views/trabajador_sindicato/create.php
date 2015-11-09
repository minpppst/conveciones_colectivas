<?php
/* @var $this Trabajador_sindicatoController */
/* @var $model Trabajador_sindicato */


?>
<div >
<?php 
    
    
 
?>
</div>
<?php// echo CHtml::beginForm(); ?>

<h1>Asociar Nomina Con Sindicato</h1>
<?php $dataProvider= new CActiveDataProvider('trabajador_sindicato',[
    'criteria'=>[
        'condition'=>"nomina_sindicato='".$_GET['convencion']."'"
]]);

            $this->widget('zii.widgets.grid.CGridView', array(
    'dataProvider'=>$dataProvider,
                'id'=>'show-list',

                'columns'=>array(
        
         // muestra el atributo "titulo"
                    
                     array('name'=>'id','value'=>'$data->id',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
            ), 
                    
                    
                    array('name'=>'trabajador','value'=>'$data->trabajador',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
            ), 
            // 
           
             
            // // muestra el atributo 'nombre' de la relación 'categoria' declararada en el modelo
        // array('name'=>'secretario_general','value'=>CHtml::checkBox("id",$dataProvider->id,array("secretario_general"=>"chkPublish_".$dataProvider->id))),
        array(  
                'class' => 'CCheckBoxColumn',
               // 'name'=>'trabajadores_amparados_conve_col','value'=>'CHtml::checkBox("trabajadores_amparados_conve_col[]","attributes",array("value"=>$data->trabajadores_amparados_conve_col,"trabajadores_amparados_conve_col"=>"trabajadores_amparados_conve_col".$data->id))',
            
                'name' => '$data->trabajadores_amparados_conve_col',
                'id' => 'id',
                'value' => '$data->trabajadores_amparados_conve_col',
                'checked'=>'$data->trabajadores_amparados_conve_col',
                
                'class' => 'CCheckBoxColumn',
                'selectableRows' => '100',
 
            
                //'name' => 'trabajadores_amparados_conve_col[]',
                //'id' => 'autoId',
            //    'value' => '$data->trabajadores_amparados_conve_col',
                
                'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
                
                'headerTemplate'=>'Trabajadores Beneficiados<br>{item}',
                'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
 
            ),
         array(
                 'name'=>'trabajadores_afiliados_sindicato','value'=>'CHtml::checkBox("trabajadores_afiliados_sindicato[]",null,array("value"=>$data->trabajadores_afiliados_sindicato,"trabajadores_afiliados_sindicato"=>"trabajadores_afiliados_sindicato".$data->trabajadores_afiliados_sindicato))',
                //'name' => 'trabajadores_afiliados_sindicato',
                'id' => 'id1',
                'value' => '$data->trabajadores_afiliados_sindicato',
                'class' => 'CCheckBoxColumn',
                'checked'=>'$data->trabajadores_afiliados_sindicato',
                'selectableRows' => '2',
                'headerTemplate'=>'Trabajadores Sindicato<br>{item}',
                'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
             'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
 
            ),
        array(
        'name'=>'secretario_general','value'=>'CHtml::checkBox("secretario_general[]",null,array("value"=>$data->secretario_general,"$data->trabajador"=>"secretario_general".$data->secretario_general))',
         'id' => 'id2',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
        'selectableRows' => '1',
        'checked'=>'$data->secretario_general',
        'headerTemplate'=>'Secretario General{item}',
        'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
        array(
        'name'=>'secretario_ejecutivo','value'=>'CHtml::checkBox("secretario_ejecutivo[]",null,array("value"=>$data->secretario_ejecutivo,"secretario_ejecutivo"=>"secretario_ejecutivo".$data->secretario_ejecutivo))',
        'id' => 'id3',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
        'selectableRows' => '1',
        'checked'=>'$data->secretario_ejecutivo',
        'headerTemplate'=>'Secretario Ejecutivo{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
        array(
        'name'=>'secretario_tesorero','value'=>'CHtml::checkBox("secretario_tesorero[]",null,array("value"=>$data->secretario_tesorero,"secretario_tesorero"=>"secretario_tesorero".$data->secretario_tesorero))',
        'id' => 'id4',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
        'selectableRows' => '1',
        'checked'=>'$data->secretario_tesorero',
        'headerTemplate'=>'Secretario tesorero{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
         array(
        'name'=>'secretario_finanzas','value'=>'CHtml::checkBox("secretario_finanzas[]",null,array("value"=>$data->secretario_finanzas,"secretario_finanzas"=>"secretario_finanzas".$data->secretario_finanzas))',
        'id' => 'id5',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
        'checked'=>'$data->secretario_finanzas',
        'value'=>'$data->secretario_finanzas',
        'selectableRows' => '1',
        'headerTemplate'=>'Secretario Finanzas{item}',
             'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
        array(
        'name'=>'secretario_trabajo_reclamos','value'=>'CHtml::checkBox("secretario_trabajo_reclamos[]",null,array("value"=>$data->secretario_trabajo_reclamos,"secretario_trabajo_reclamos"=>"secretario_trabajo_reclamos".$data->secretario_trabajo_reclamos))',
        'id' => 'id6',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
        'checked'=>'$data->secretario_trabajo_reclamos',    
        'selectableRows' => '1',
        'headerTemplate'=>'Secretario Trabajo{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
        array(
        'name'=>'secretario_cultura_deporte','value'=>'CHtml::checkBox("secretario_cultura_deporte[]",null,array("value"=>$data->secretario_cultura_deporte,"secretario_cultura_deporte"=>"secretario_cultura_deporte".$data->secretario_cultura_deporte))',
        'id' => 'id7',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'checked'=>'$data->secretario_cultura_deporte',
        'class' => 'CCheckBoxColumn',
        'selectableRows' => '1',
        'headerTemplate'=>'Secretario Deporte{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
        array(
        'name'=>'secretario_organizacion','value'=>'CHtml::checkBox("secretario_organizacion[]",null,array("value"=>$data->secretario_organizacion,"secretario_organizacion"=>"secretario_organizacion".$data->secretario_organizacion))',
        'id' => 'id8',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'checked'=>'$data->secretario_organizacion',
        'class' => 'CCheckBoxColumn',
        'selectableRows' => '1',
        'headerTemplate'=>'Secretario Organizacion{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
        array(
        'name'=>'secretario_actas_correspondencias','value'=>'CHtml::checkBox("secretario_actas_correspondencias[]",null,array("value"=>$data->secretario_actas_correspondencias,"secretario_actas_correspondencias"=>"secretario_actas_correspondencias".$data->secretario_actas_correspondencias))',
        'id' => 'id9',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
         'checked'=>'$data->secretario_actas_correspondencias',   
        'selectableRows' => '1',
        'headerTemplate'=>'Secretario Actas Y Correspondencias{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
            
        ),
        array(
        'name'=>'secretario_salud_laboral','value'=>'CHtml::checkBox("secretario_salud_laboral[]",null,array("value"=>$data->secretario_salud_laboral,"secretario_salud_laboral"=>"secretario_salud_laboral".$data->secretario_salud_laboral))',
        'id' => 'id10',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
        'checked'=>'$data->secretario_salud_laboral',
        'selectableRows' => '1',
        'headerTemplate'=>'Secretario Salud Laboral{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
        array(
        'name'=>'secretario_vigilancia_disciplina','value'=>'CHtml::checkBox("secretario_vigilancia_disciplina[]",null,array("value"=>$data->secretario_vigilancia_disciplina,"secretario_vigilancia_disciplina"=>"secretario_vigilancia_disciplina".$data->secretario_vigilancia_disciplina))',
        'id' => 'id11',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
        'checked'=>'$data->secretario_vigilancia_disciplina',
        'selectableRows' => '1',
        'headerTemplate'=>'Secretario Vigilancia y Disciplina{item}',
        'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
           
           
        ),
        array(
        'name'=>'secretario_otro','value'=>'CHtml::checkBox("secretario_otro[]",null,array("value"=>$data->secretario_otro,"secretario_otro"=>"secretario_otro".$data->secretario_otro))',
        'id' => 'id12',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
        'selectableRows' => '1',
        'checked'=>'$data->secretario_otro',
        'headerTemplate'=>'Secretario Otro{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
        array(
        'name'=>'delegado_sindical','value'=>'CHtml::checkBox("delegado_sindical[]",null,array("value"=>$data->delegado_sindical,"delegado_sindical"=>"delegado_sindical".$data->delegado_sindical))',
        'id' => 'id13',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        'class' => 'CCheckBoxColumn',
        'checked'=>'$data->delegado_sindical',
        'selectableRows' => '1',
        'headerTemplate'=>'Delegado Sindical{item}',
        ),
        
        
        

        //array(  // muestra una columna con los botones "view", "update" y "delete"
        //    'class'=>'CButtonColumn',
        //),
        
        
    ),
                'htmlOptions'=>array(
      'style'=>'overflow-y:scroll;height:500px; '),
 ));
 ?>
<div>
<?php

$options = array ('1' => 'Agregar', '0'=>'Quitar');
    echo '  <span>Acción:<span>'.CHtml::dropDownList('newStatus', 0,($options));
 
    echo CHtml::ajaxLink("<br>Cambiar", $this->createUrl('trabajador_sindicato/getvalue'), array(
        "type" => "post",
        "data" => 'js:{theIds : $.fn.yiiGridView.getChecked("show-list","id").toString(),"status":$("#newStatus").val(),
                   theIds1 : $.fn.yiiGridView.getChecked("show-list","id1").toString(),"status":$("#newStatus").val(),
                   theIds2 : $.fn.yiiGridView.getChecked("show-list","id2").toString(),"status":$("#newStatus").val(),
                   theIds3 : $.fn.yiiGridView.getChecked("show-list","id3").toString(),"status":$("#newStatus").val(),
                   theIds4 : $.fn.yiiGridView.getChecked("show-list","id4").toString(),"status":$("#newStatus").val(),
                   theIds5 : $.fn.yiiGridView.getChecked("show-list","id5").toString(),"status":$("#newStatus").val(),
                   theIds6 : $.fn.yiiGridView.getChecked("show-list","id6").toString(),"status":$("#newStatus").val(),
                   theIds7 : $.fn.yiiGridView.getChecked("show-list","id7").toString(),"status":$("#newStatus").val(),
                   theIds8 : $.fn.yiiGridView.getChecked("show-list","id8").toString(),"status":$("#newStatus").val(),
                   theIds9 : $.fn.yiiGridView.getChecked("show-list","id9").toString(),"status":$("#newStatus").val(),
                   theIds10 : $.fn.yiiGridView.getChecked("show-list","id10").toString(),"status":$("#newStatus").val(),
                   theIds11 : $.fn.yiiGridView.getChecked("show-list","id11").toString(),"status":$("#newStatus").val(),
                   theIds12 : $.fn.yiiGridView.getChecked("show-list","id12").toString(),"status":$("#newStatus").val(),
                   theIds13 : $.fn.yiiGridView.getChecked("show-list","id13").toString(),"status":$("#newStatus").val()
                   }',
        
        //"data" => 'js:{theIds1 : $.fn.yiiGridView.getChecked("show-list","id1").toString(),"status":$("#newStatus").val()}',
        "success" => 'js:alert("Cambios Realizados") ','js:document.location.reload()'//array(
        //'class' => 'btn btn-info'
        )
        );

?>

</div>
<?php //echo $this->renderPartial('_form', array('model'=>$model)); ?>
<?php //echo CHtml::endForm(); ?>