<?php

/**
 * This is the model class for table "sindicato".
 *
 * The followings are the available columns in table 'sindicato':
 * @property string $id
 * @property string $nombre
 * @property string $siglas
 * @property string $nro_boleta_inscripcion
 * @property integer $folio_registro
 * @property string $tomo_registroo
 * @property string $rif
 * @property string $direccion
 * @property integer $estado
 * @property integer $municipio
 * @property integer $parroquia
 * @property string $telefono
 * @property string $federacion_nacional
 * @property string $federacion_regional
 * @property string $sector
 * @property integer $ambito
 * @property integer $tipo_organizacion
 * @property string $fecha_registro
 * @property string $fecha_actualizacion
 * @property integer $duracion_junta_directiva
 * @property string $fecha_inicio_vigencia
 * @property string $fecha_cese_vigencia
 * @property string $fecha_informe_finanzas
 * @property string $fecha_nomina_afiliado
 * @property string $fecha_ultimas_elecciones
 * @property string $cod_convencion
 *
 * The followings are the available model relations:
 * @property Ambito $ambito0
 * @property Estados $estado0
 * @property Municipios $municipio0
 * @property Parroquias $parroquia0
 * @property Sector $sector0
 * @property Convencion $codConvencion
 * @property TipoOrganizacion $tipoOrganizacion
 */
class Sindicato extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Sindicato the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'sindicato';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			
                        array('nombre, siglas,  direccion, estado, municipio, parroquia,  sector, ambito, tipo_organizacion, fecha_registro, fecha_actualizacion, duracion_junta_directiva, fecha_inicio_vigencia, fecha_cese_vigencia, fecha_nomina_afiliado, fecha_ultimas_elecciones, cod_convencion', 'required'),
			array('folio_registro, estado, municipio, parroquia, ambito, tipo_organizacion, duracion_junta_directiva', 'numerical', 'integerOnly'=>true),
			array('nombre, tomo_registroo, direccion, federacion_nacional, federacion_regional', 'length', 'max'=>255),
			array('siglas, rif, cod_convencion', 'length', 'max'=>20),
			array('nro_boleta_inscripcion', 'length', 'max'=>15),
			array('telefono', 'length', 'max'=>100),
			array('sector', 'length', 'max'=>11),
                        array('telefono','validartelefonoreal'),
                        array('telefono','validartelefono'),
                        array('nro_boleta_inscripcion','validarboleta'),
                        array('rif', 'validarif'),
                        array('fecha_registro, fecha_informe_finanzas, fecha_actualizacion,fecha_inicio_vigencia, fecha_cese_vigencia, fecha_nomina_afiliado, fecha_ultimas_elecciones','formatear_fechas'),
                        //array('fecha_cese_vigencia','compare','compareAttribute'=>'fecha_inicio_vigencia','operator'=>'>=','message'=>'Fecha de Cese de Vigencia debe ser superior a Fecha de Inicio Vigencia'),
                        array('fecha_cese_vigencia','validar_fecha'),
                        
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombre, siglas, nro_boleta_inscripcion, folio_registro, tomo_registroo, rif, direccion, estado, municipio, parroquia, telefono, federacion_nacional, federacion_regional, sector, ambito, tipo_organizacion, fecha_registro, fecha_actualizacion, duracion_junta_directiva, fecha_inicio_vigencia, fecha_cese_vigencia, fecha_informe_finanzas, fecha_nomina_afiliado, fecha_ultimas_elecciones, cod_convencion', 'safe', 'on'=>'search'),
		);
	}
        public function validartelefonoreal(){
            if(!preg_match("/^([0-9]{4})(-)([0-9]{7})$/",$_POST['telefono'][0])){
                 $this->addError('telefono', 'Telefono No Tiene El Formato Correcto, ejemplo: 1234-1234567');
            }
            if(!empty($_POST['telefono'][1])){
                if(!preg_match("/^([0-9]{4})(-)([0-9]{7})$/",$_POST['telefono'][1]))
                 $this->addError('telefono', 'Telefono No Tiene El Formato Correcto, ejemplo: ####-1234567');
            }
            
        }
             public function validartelefono(){
                    if(empty($_POST['telefono'][0]))
                        $this->addError('telefono', 'El Telefono no puede ser nulo');
                    if(!empty($_POST['telefono'][1]))
                    $this->telefono=$_POST['telefono'][0]."/".$_POST['telefono'][1];
                    else
                        $this->telefono=$_POST['telefono'][0];
                    
                }
        
        public function validarboleta(){
            if(!preg_match("/^([0-9]{4})(-)([0-9]{2})(-)([0-9]{5})$/",$this->nro_boleta_inscripcion)){
                 $this->addError('nro_boleta_inscripcion', 'Nro. Boleta de Inscripción No Tiene El Formato Correcto, ejemplo: XXXX-XX-XXXXX');
            }
            
            
        }
        
        public function validar_fecha(){
          
            if(strtotime($this->fecha_cese_vigencia)< strtotime($this->fecha_inicio_vigencia)){
                $this->addError('fecha_cese_vigencia', 'Error, Fecha Cese de Vigencia debe ser mayor a Fecha Inicio Vigencia ');
            }
        }
        
         public function validarif() {
            	$rif = substr($this->rif, 0);
                    if(!empty($this->rif)){
                if (0 === preg_match("/^([JPGV]{1}[0-9]{8})(-)([0-9]{1})$/", $rif) )
                {
            $this->addError('rif', 'El Rif No Tiene El Formato Correcto, ejemplo: V12345678-9');
                }
                    }
                
                }
        
        public function formatear_fechas(){
                   
            
                   if(!empty($this->fecha_actualizacion) && !empty($this->fecha_cese_vigencia) &&!empty($this->fecha_informe_finanzas) && !empty($this->fecha_inicio_vigencia) && !empty($this->fecha_nomina_afiliado) && !empty($this->fecha_registro) && !empty($this->fecha_ultimas_elecciones)) 
                   { $this->fecha_actualizacion=Yii::app()->dateformatter->format("yyyy-MM-dd",$this->fecha_actualizacion);
                   $this->fecha_cese_vigencia=Yii::app()->dateformatter->format("yyyy-MM-dd",$this->fecha_cese_vigencia);
                   $this->fecha_informe_finanzas=Yii::app()->dateformatter->format("yyyy-MM-dd",$this->fecha_informe_finanzas);
                   $this->fecha_inicio_vigencia=Yii::app()->dateformatter->format("yyyy-MM-dd",$this->fecha_inicio_vigencia);
                   $this->fecha_nomina_afiliado=Yii::app()->dateformatter->format("yyyy-MM-dd",$this->fecha_nomina_afiliado);
                   $this->fecha_registro=Yii::app()->dateformatter->format("yyyy-MM-dd",$this->fecha_registro);
                   $this->fecha_ultimas_elecciones=Yii::app()->dateformatter->format("yyyy-MM-dd",$this->fecha_ultimas_elecciones);
                  
                   }
            }
        

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'ambito0' => array(self::BELONGS_TO, 'Ambito', 'ambito'),
			'estado0' => array(self::BELONGS_TO, 'Estados', 'estado'),
			'municipio0' => array(self::BELONGS_TO, 'Municipios', 'municipio'),
			'parroquia0' => array(self::BELONGS_TO, 'Parroquias', 'parroquia'),
			'sector0' => array(self::BELONGS_TO, 'Sector', 'sector'),
			'tipoOrganizacion' => array(self::BELONGS_TO, 'Tipo_organizacion', 'tipo_organizacion'),
                        'codConvencion' => array(self::BELONGS_TO, 'Convencion', 'cod_convencion'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nombre' => 'Nombre',
			'siglas' => 'Siglas',
			'nro_boleta_inscripcion' => 'Nro. Boleta Inscripcion',
			'folio_registro' => 'Folio Registro',
			'tomo_registroo' => 'Tomo Registro',
			'rif' => 'Rif',
			'direccion' => 'Direccion',
			'estado' => 'Estado',
			'municipio' => 'Municipio',
			'parroquia' => 'Parroquia',
			'telefono' => 'Telefono',
			'federacion_nacional' => 'Federacion Nacional',
			'federacion_regional' => 'Federacion Regional',
			'sector' => 'Sector',
			'ambito' => 'Ambito',
			'tipo_organizacion' => 'Tipo Organizacion',
			'fecha_registro' => 'Fecha Registro',
			'fecha_actualizacion' => 'Fecha Actualización',
			'duracion_junta_directiva' => 'Duración Junta Directiva',
			'fecha_inicio_vigencia' => 'Fecha Inicio Vigencia',
			'fecha_cese_vigencia' => 'Fecha Cese Vigencia',
			'fecha_informe_finanzas' => 'Fecha Informe Finanzas',
			'fecha_nomina_afiliado' => 'Fecha Nomina Afiliado',
			'fecha_ultimas_elecciones' => 'Fecha Ultimas Elecciones',
			'cod_convencion' => 'Cod Convencion',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('siglas',$this->siglas,true);
		$criteria->compare('nro_boleta_inscripcion',$this->nro_boleta_inscripcion,true);
		$criteria->compare('folio_registro',$this->folio_registro);
		$criteria->compare('tomo_registroo',$this->tomo_registroo,true);
		$criteria->compare('rif',$this->rif,true);
		$criteria->compare('direccion',$this->direccion,true);
		$criteria->compare('estado',$this->estado);
		$criteria->compare('municipio',$this->municipio);
		$criteria->compare('parroquia',$this->parroquia);
		$criteria->compare('telefono',$this->telefono,true);
		$criteria->compare('federacion_nacional',$this->federacion_nacional,true);
		$criteria->compare('federacion_regional',$this->federacion_regional,true);
		$criteria->compare('sector',$this->sector,true);
		$criteria->compare('ambito',$this->ambito);
		$criteria->compare('tipo_organizacion',$this->tipo_organizacion);
		$criteria->compare('fecha_registro',$this->fecha_registro,true);
		$criteria->compare('fecha_actualizacion',$this->fecha_actualizacion,true);
		$criteria->compare('duracion_junta_directiva',$this->duracion_junta_directiva);
		$criteria->compare('fecha_inicio_vigencia',$this->fecha_inicio_vigencia,true);
		$criteria->compare('fecha_cese_vigencia',$this->fecha_cese_vigencia);
		$criteria->compare('fecha_informe_finanzas',$this->fecha_informe_finanzas,true);
		$criteria->compare('fecha_nomina_afiliado',$this->fecha_nomina_afiliado,true);
		$criteria->compare('fecha_ultimas_elecciones',$this->fecha_ultimas_elecciones,true);
		$criteria->compare('cod_convencion',$this->cod_convencion,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
        
         public static function getListcod_convencion()
             {
             return CHtml::listData(Convencion::model()->findAll(array('order'=>'nombre')),'id','nombre');
             }
             
             
               public function behaviors()
                {
                    return array(
                        // Classname => path to Class
                        'ActiveRecordLogableBehavior'=>
                            'application.behaviors.ActiveRecordLogableBehavior',
                    );
                }
}