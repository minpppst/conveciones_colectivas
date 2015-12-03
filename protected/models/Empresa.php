<?php

/**
 * This is the model class for table "empresa".
 *
 * The followings are the available columns in table 'empresa':
 * @property string $id
 * @property string $razon_social
 * @property string $rif
 * @property string $identificacion_laboral
 * @property string $seguro_social
 * @property string $actividad_economica
 * @property string $sector
 * @property string $capital_empresa
 * @property integer $nro_sucursales
 * @property string $direccion
 * @property integer $estado
 * @property integer $municipio
 * @property integer $parroquia
 * @property string $telefono
 * @property string $fax
 * @property string $correo
 * @property string $web
 * @property string $rnc
 * @property string $cod_convencion
 *
 * The followings are the available model relations:
 * @property Rama $actividadEconomica
 * @property Convencion $codConvencion
 * @property Sector $sector0
 * @property Estados $estado0
 * @property Municipios $municipio0
 * @property Parroquias $parroquia0
 */
class Empresa extends CActiveRecord
{
    
    

    
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Empresa the static model class
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
		return 'empresa';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('razon_social, rif, identificacion_laboral, seguro_social, actividad_economica, sector, capital_empresa, nro_sucursales, direccion, estado, municipio, parroquia, cod_convencion', 'required'),
			array('nro_sucursales, estado, municipio, parroquia', 'numerical', 'integerOnly'=>true),
			array('razon_social, direccion', 'length', 'max'=>255),
			array('rif, actividad_economica, capital_empresa, fax', 'length', 'max'=>20),
			array('identificacion_laboral, seguro_social', 'length', 'max'=>10),
			array('sector', 'length', 'max'=>11),
			array('telefono, correo, rnc', 'length', 'max'=>100),
			array('web, cod_convencion', 'length', 'max'=>50),
                        array('correo', 'email'),
                        array('web','url'),


			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, razon_social, rif, identificacion_laboral, seguro_social, actividad_economica, sector, capital_empresa, nro_sucursales, direccion, estado, municipio, parroquia, telefono, fax, correo, web, rnc, cod_convencion', 'safe', 'on'=>'search'),
                        array('rif','validarif'),
                        array('telefono','validartelefonoreal'),
                        array('telefono','validartelefono'),
                        array('identificacion_laboral', 'validaril'),
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
        
           public function validarif() {
            	$rif = substr($this->rif, 0);
                
                if (0 === preg_match("/^([JPGV]{1}[0-9]{8})(-)([0-9]{1})$/", $rif) )
                {
            $this->addError('rif', 'El Rif No Tiene El Formato Correcto, ejemplo: V12345678-9');
                }
                }
                
                
                public function validaril(){
                     if(!preg_match('/^[0-9]{6,6}([- ]?[0-9]{1,8})?$/', $this->identificacion_laboral)){
                     $this->addError('identificacion_laborar', 'Identificacion Laborar No Tiene El Formato Correcto, ejemplo: ######-#..');
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
                
                
                
        
        
        
        
	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'actividadEconomica' => array(self::BELONGS_TO, 'Rama', 'actividad_economica'),
			'codConvencion' => array(self::BELONGS_TO, 'Convencion', 'cod_convencion'),
			'sector0' => array(self::BELONGS_TO, 'Sector', 'sector'),
			'estado0' => array(self::BELONGS_TO, 'Estados', 'estado'),
			'municipio0' => array(self::BELONGS_TO, 'Municipios', 'municipio'),
			'parroquia0' => array(self::BELONGS_TO, 'Parroquias', 'parroquia'),
		);
	}

        
               public static function getListrama()
             {
             return CHtml::listData(Rama::model()->findAll(array('order'=>'rama')),'id','rama');
             }
             public static function getListcod_convencion()
             {
             return CHtml::listData(Convencion::model()->findAll(array('order'=>'nombre')),'id','nombre');
             }
             
             
	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'razon_social' => 'Razon Social',
			'rif' => 'Rif',
			'identificacion_laboral' => 'Identificacion Laboral',
			'seguro_social' => 'Seguro Social',
			'actividad_economica' => 'Actividad Economica',
			'sector' => 'Sector',
			'capital_empresa' => 'Capital De La Empresa',
			'nro_sucursales' => 'Nro. Sucursales',
			'direccion' => 'Direccion',
			'estado' => 'Estado',
			'municipio' => 'Municipio',
			'parroquia' => 'Parroquia',
			'telefono' => 'Telefono',
			'fax' => 'Fax',
			'correo' => 'Correo',
			'web' => 'Sitio Web',
			'rnc' => 'Registro Nacional De Contratista (RNC)',
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
		$criteria->compare('razon_social',$this->razon_social,true);
		$criteria->compare('rif',$this->rif,true);
		$criteria->compare('identificacion_laboral',$this->identificacion_laboral,true);
		$criteria->compare('seguro_social',$this->seguro_social,true);
		$criteria->compare('actividad_economica',$this->actividad_economica,true);
		$criteria->compare('sector',$this->sector,true);
		$criteria->compare('capital_empresa',$this->capital_empresa,true);
		$criteria->compare('nro_sucursales',$this->nro_sucursales);
		$criteria->compare('direccion',$this->direccion,true);
		$criteria->compare('estado',$this->estado);
		$criteria->compare('municipio',$this->municipio);
		$criteria->compare('parroquia',$this->parroquia);
		$criteria->compare('telefono',$this->telefono,true);
		$criteria->compare('fax',$this->fax,true);
		$criteria->compare('correo',$this->correo,true);
		$criteria->compare('web',$this->web,true);
		$criteria->compare('rnc',$this->rnc,true);
		$criteria->compare('cod_convencion',$this->cod_convencion,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
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