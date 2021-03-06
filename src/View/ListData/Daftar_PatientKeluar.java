package View.ListData;


import Connection.Connect;
import View.CRUDForm.PatientKeluar_Ruangan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import net.proteanit.sql.DbUtils;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Rahadian
 */
public class Daftar_PatientKeluar extends javax.swing.JFrame {
Connection con=null;
ResultSet rs=null;
PreparedStatement pst=null;
    /**
     *
     */
    public Daftar_PatientKeluar() {
        initComponents();
          con= Connect.ConnectDB();
        Get_Data();
        setLocationRelativeTo(null);
    }
 private void Get_Data(){
         try{
         String sql="Select ID as 'ID Keluar', PatientMasuk_Ruangan.MasukID as 'ID Masuk',RegistrasiPatient.PatientID as 'ID Patient',"
                 + "RegistrasiPatient.PatientNama as 'Nama Patient',RegistrasiPatient.JenisKelamin as 'Jenis Kelamin',RegistrasiPatient.GolDarah as 'Golongan Darah',"
                 + "Penyakit,MasukTanggal as 'Tanggal Masuk',Ruangan.RuanganNo as 'No Ruangan',Dokter.DokterID as 'ID Dokter',DokterNama as 'Nama Dokter',"
                 + "KeluarTanggal as 'TanggalKeluar',Tanda_DP as 'Catatan' "
                 + "from Ruangan,Dokter,RegistrasiPatient,PatientMasuk_Ruangan,PatientKeluar_Ruangan "
                 + "where Ruangan.RuanganNo=PatientMasuk_Ruangan.RuanganNo and Dokter.DokterID=PatientMasuk_Ruangan.DokterID "
                 + "and RegistrasiPatient.PatientID=PatientMasuk_Ruangan.PatientID  "
                 + "and PatientMasuk_Ruangan.MasukID= PatientKeluar_Ruangan.MasukID order by KeluarTanggal";
         pst=con.prepareStatement(sql);
          rs= pst.executeQuery();
         jTable1.setModel(DbUtils.resultSetToTableModel(rs));
         }catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
          
}
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Patient Keluar Record");
        setResizable(false);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 1230, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(0, 2, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 582, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
      try{
            con=Connect.ConnectDB();
            int row= jTable1.getSelectedRow();
            String table_click= jTable1.getModel().getValueAt(row, 0).toString();
             String sql="Select * from Ruangan,Dokter,RegistrasiPatient,PatientMasuk_Ruangan,PatientKeluar_Ruangan "
                     + "where Ruangan.RuanganNo=PatientMasuk_Ruangan.RuanganNo and Dokter.DokterID=PatientMasuk_Ruangan.DokterID "
                     + "and RegistrasiPatient.PatientID=PatientMasuk_Ruangan.PatientID and PatientMasuk_Ruangan.MasukID=PatientKeluar_Ruangan.MasukID "
                     + "and ID=" + table_click + "";   
            pst=con.prepareStatement(sql);
            rs=  pst.executeQuery();
            if(rs.next()){
                this.hide();
                PatientKeluar_Ruangan frm = new PatientKeluar_Ruangan();
                frm.setVisible(true);
                String add1=rs.getString("DokterID");
                frm.txtDokterID.setText(add1);
                String add2=rs.getString("DokterNama");
                frm.txtDokterNama.setText(add2);
                String add3=rs.getString("PatientID");
                frm.PatientID.setText(add3);
                String add5=rs.getString("PatientNama");
                frm.txtNamaPatient.setText(add5);
                String add6=rs.getString("JenisKelamin");
                frm.txtJenisKelamin.setText(add6);
                String add7=rs.getString("GolDarah");
                frm.txtGolDarah.setText(add7);
                String add9=rs.getString("Penyakit");
                frm.txtPenyakit.setText(add9);
                String add11=rs.getString("MasukTanggal");
                frm.txtTanggalMasuk.setText(add11);
                String add14=rs.getString("RuanganNo");
                frm.txtRuanganNo.setText(add14);
                int add16 = rs.getInt("MasukID");
                String add17= Integer.toString(add16);
                frm.txtIDMasuk.setText(add17);
                String add18=rs.getString("KeluarTanggal");
                frm.txtTanggalKeluar.setText(add18);
                String add19=rs.getString("Tanda_DP");
                 frm.txtCatatan.setText(add19);
                 int add20 = rs.getInt("ID");
                String add21= Integer.toString(add20);
                frm.txtIDKeluar.setText(add21);
               
                frm.btnDelete.setEnabled(true);
                frm.btnSave.setEnabled(false);
                frm.btnUpdate.setEnabled(true);
                
                      }
        }catch(Exception ex){
            JOptionPane.showMessageDialog(this,ex);
        }
    }//GEN-LAST:event_jTable1MouseClicked

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
      this.hide();
       PatientKeluar_Ruangan frm = new PatientKeluar_Ruangan();
       frm.setVisible(true);
    }//GEN-LAST:event_formWindowClosing

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Daftar_PatientKeluar.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Daftar_PatientKeluar.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Daftar_PatientKeluar.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Daftar_PatientKeluar.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Daftar_PatientKeluar().setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    // End of variables declaration//GEN-END:variables
}
